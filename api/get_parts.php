<?php
header('Content-Type: application/json; charset=utf-8');
require_once 'db.php';

$category = $_GET['category'] ?? '';
$page     = max(1, (int)($_GET['page'] ?? 1));
$perPage  = 20;

if (!isset(SPEC_TABLE_MAP[$category])) {
    http_response_code(400);
    echo json_encode(['error'=>'unknown category.']);
    exit;
}

$specInfo   = SPEC_TABLE_MAP[$category];
$specTable  = $specInfo['table'];
$specCols   = $specInfo['cols'];

$countStmt = $pdo->prepare("SELECT COUNT(*) FROM Part WHERE category = :cat");
$countStmt->execute(['cat'=>$category]);
$total = (int)$countStmt->fetchColumn();

$selectCols = array_merge(
    ["p.id", "p.model", "p.price"],
    array_map(fn($c) => "s.`$c`", $specCols)
);
$sql = "
    SELECT " . implode(', ', $selectCols) . "
    FROM Part p
    LEFT JOIN `$specTable` s ON p.id = s.part_id
    WHERE p.category = :cat
    LIMIT :lim OFFSET :off
";
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':cat', $category);
$stmt->bindValue(':lim', $perPage, PDO::PARAM_INT);
$stmt->bindValue(':off', $offset, PDO::PARAM_INT);
$stmt->execute();
$parts = $stmt->fetchAll();

echo json_encode([
    'total'      => $total,
    'perPage'    => $perPage,
    'page'       => $page,
    'totalPages' => $totalPages,
    'specCols'   => $specCols,
    'parts'      => $parts,
]);
