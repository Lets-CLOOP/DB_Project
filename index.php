<?php
session_start();

require_once __DIR__ . '/db_pdo.php';
require_once __DIR__ . '/db.php';

require_once __DIR__ . '/api/check_compatibility.php';

//action for each cases
if (isset($_GET['action'])) {
    header('Content-Type: application/json; charset=utf-8');
    if (ob_get_level()) ob_clean();
    $pdo = getPDO();
    switch ($_GET['action']) {

        // Fetching parts from DB
        // As you expected... just simple logics
        case 'get_parts':
            $cat    = $_GET['category'] ?? '';
            $search = trim($_GET['search'] ?? '');

            if (!isset($SPEC_TABLE_MAP[$cat])) {
                echo json_encode(['parts'=>[]]);
                exit;
            }
            $spec = $SPEC_TABLE_MAP[$cat];

            $cols = ['p.id AS id', 'm.name AS manufacturer', 'p.model AS model'];
            foreach ($spec['cols'] as $c) {
                $cols[] = "s.`$c` AS `$c`";
            }
            $cols[] = 'p.price AS price';

            $sql  = 'SELECT ' . implode(', ', $cols)
                  . ' FROM Part p'
                  . ' JOIN Manufacturer m ON p.manufacturer_id = m.id'
                  . ' LEFT JOIN ' . $spec['table'] . ' s ON p.id = s.part_id'
                  . ' WHERE p.category = :cat';
            $params = [':cat' => $cat];

            if ($search !== '') {
                $sql .= ' AND (m.name LIKE :search OR p.model LIKE :search)';
                $params[':search'] = "%{$search}%";
            }

            foreach ($spec['cols'] as $col) {
                $minKey = "filter_{$col}_min";
                if (isset($_GET[$minKey]) && $_GET[$minKey] !== '') {
                    $sql .= " AND s.`{$col}` >= :{$minKey}";
                    $params[":{$minKey}"] = $_GET[$minKey];
                }
                $maxKey = "filter_{$col}_max";
                if (isset($_GET[$maxKey]) && $_GET[$maxKey] !== '') {
                    $sql .= " AND s.`{$col}` <= :{$maxKey}";
                    $params[":{$maxKey}"] = $_GET[$maxKey];
                }
            }
            
            $sql .= ' ORDER BY p.id';
            $stmt = $pdo->prepare($sql);
            $stmt->execute($params);
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            echo json_encode(['parts' => $rows]);
            exit;
        
        // SAVE! Or what else to say
        case 'save_quote':
            $data = json_decode(file_get_contents('php://input'), true);
            $title = $data['title'] ?? '';
            $items = $data['items'] ?? [];
            $isPublic = isset($data['is_public']) ? (int)$data['is_public'] : 0;
            $compat = runCompatibilityCheck($items);
            if(!$compat['success']) {
              $isPublic = 0;
            }
            $total = array_reduce($items, fn($sum, $it) => $sum + (float)$it['price'], 0);

            // Surely we need to begin our transaction *logically*
            $pdo->beginTransaction();
            $stmt = $pdo->prepare('
              INSERT INTO Quote (user_id, title, total_price, is_public)
              VALUES (:uid, :t, :p, :pub)
            ');
            $stmt->execute([
              ':uid' => $_SESSION['user_id'],
              ':t'   => $title,
              ':p'   => $total,
              ':pub' => $isPublic
            ]);
            $qid = $pdo->lastInsertId();
            $stmt = $pdo->prepare('INSERT INTO QuoteItem(quote_id, part_id, price, qty) VALUES(:qid, :pid, :pr, 1)');
            foreach ($items as $it) {
                $stmt->execute([':qid' => $qid, ':pid' => $it['id'], ':pr' => $it['price']]);
            }

            // After all, commits the transaction when you press SAVE button. Or rollback if you don't
            $pdo->commit();
            echo json_encode(['success' => true]);
            exit;
        
        // The longest part... Check compatibility
        // But still, the logic is pretty simple
        case 'check_compatibility':
            header('Content-Type: application/json; charset=utf-8');
            if (ob_get_level()) ob_clean();

            $data = json_decode(file_get_contents('php://input'), true);
            $items = $data['items'] ?? [];
            echo json_encode(
                checkCompatibility($items),
                JSON_UNESCAPED_UNICODE
            );
            exit;            

        // Again, a simple one. GET quotes if that is saved in DB
        case 'get_quotes':
            $stmt = $pdo->prepare('SELECT id, title, total_price FROM Quote WHERE user_id = :uid ORDER BY id DESC');
            $stmt->execute([':uid' => $_SESSION['user_id']]);
            echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
            exit;
 
        // Get public quotes where is_public = 1;
        // We will see...
        case 'get_public_quotes':
            $stmt = $pdo->prepare("
              SELECT q.id, q.title, q.total_price, u.username AS author
              FROM Quote q
              JOIN User u ON q.user_id = u.id
              WHERE q.is_public = 1
              ORDER BY q.id DESC
            ");
            $stmt->execute();
            echo json_encode(['quotes' => $stmt->fetchAll(PDO::FETCH_ASSOC)]);
            exit;

        // Get details about the quotes
        case 'get_quote_details':
            $qid = (int)($_GET['quote_id'] ?? 0);
            $sql = 'SELECT p.category, m.name AS manufacturer, p.model, qi.price, qi.qty'
                 . ' FROM QuoteItem qi'
                 . ' JOIN Part p ON qi.part_id = p.id'
                 . ' JOIN Manufacturer m ON p.manufacturer_id = m.id'
                 . ' WHERE qi.quote_id = :qid';
            $stmt = $pdo->prepare($sql);
            $stmt->execute([':qid' => $qid]);
            echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
            exit;

        // Just delete, simple one
        case 'delete_quote':
            $qid = (int)($_GET['quote_id'] ?? 0);

            $pdo->beginTransaction();

            $stmt = $pdo->prepare('DELETE FROM QuoteItem WHERE quote_id = :qid');
            $stmt->execute([':qid' => $qid]);

            $stmt = $pdo->prepare('DELETE FROM Quote WHERE id = :qid AND user_id = :uid');
            $stmt->execute([':qid' => $qid, ':uid' => $_SESSION['user_id']]);
            $pdo->commit();
            echo json_encode(['success' => true]);
            exit;

        default:
            echo json_encode([]);
            exit;
    }
}

if (!isset($_SESSION['user_id'])) {
    header('Location: /auth/login.php');
    exit;
}

include __DIR__ . '/includes/header.php';
?>

<!-- Main navigation tabs -->
<div class="container">
  <ul class="nav nav-tabs" id="mainTabs">
    <li class="nav-item"><a class="nav-link active" data-bs-toggle="tab" href="#browse">Browse Parts</a></li>
    <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#current">Current Quote</a></li>
    <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#saved">Saved Quotes</a></li>
    <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#community">Community</a></li>
  </ul>

  <!-- Browsing tab body -->
  <div class="tab-content mt-3">
    <div class="tab-pane fade show active" id="browse">
      <div class="row mb-3">
        <div class="col-md-4">
          <label for="categorySelect" class="form-label">Category</label>
          <select id="categorySelect" class="form-select"></select>
        </div>
        
        <!-- Models search field and button -->
        <div class="col-md-4">
          <label for="searchInput" class="form-label">Search</label>
          <div class="input-group">
            <input type="text" id="searchInput" class="form-control"
              placeholder="Manufacturer or Model"
            />
            <button id="searchBtn" class="btn btn-primary"
              type="button">Search</button>
          </div>
        </div>
        <div class="row mb-3" id="filters"></div>

        <table class="table table-striped">
            <thead>
              <tr id="tableHeader">
                <th>Action</th>
              </tr>
            </thead>
          <tbody id="tableBody"></tbody>
        </table>
      </div>
    </div>

  
  <!-- Current quote that is being made -->
  <div class="tab-pane fade" id="current">
    <div class="mb-3">
      <div class="form-check form-switch mb-2">
        <input class="form-check-input" type="checkbox" id="publicCheckbox">
        <label class="form-check-label" for="publicCheckbox">Share to Public</label>
      </div>
      <button class="btn btn-primary me-2" onclick="saveCurrent()">Save Quote</button>
      <button class="btn btn-primary" onclick="checkCompatibility()">Compatibility Check</button>
    </div>
    <table class="table table-bordered current-table">
      <thead>
        <tr>
          <th>Category</th>
          <th class="model-col">Model</th>
          <th>Price</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody id="currentBody"></tbody>
      <tfoot>
        <tr>
          <td colspan="2">Total</td>   
          <td id="currentTotal">0.00</td> 
          <td></td>                     
        </tr>
      </tfoot>
    </table>
  </div>
    
    <!-- Saved quotes (for individual users) -->
    <div class="tab-pane fade" id="saved">
      <table class="table">
        <thead><tr><th>Title</th><th>Total Price</th><th>Actions</th></tr></thead>
        <tbody id="savedBody"></tbody>
      </table>
    </div>
    
    <!-- Community tab -->
    <div id="community" class="tab-pane fade p-3">
      <table class="table" id="communityTable">
        <thead>
          <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Total Price</th>
            <th>View</th>
          </tr>
        </thead>
        <tbody></tbody>
      </table>
    </div>
  </div>
</div>

<!-- Shows the details of the quotes -->
<div class="modal fade" id="detailsModal" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header"><h5 class="modal-title" id="detailsTitle"></h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
      <div class="modal-body"><table class="table"><thead><tr><th>Category</th><th>Manufacturer</th><th>Model</th><th>Price</th><th>Qty</th></tr></thead><tbody id="detailsBody"></tbody></table></div>
    </div>
  </div>
</div>

<?php
include __DIR__ . '/includes/footer.php';
