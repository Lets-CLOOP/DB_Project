<!DOCTYPE html>
<html lang="ko">
<head>
  <style>
  #mainTabs,
  .tab-content > .tab-pane {
    margin-left: -50px;
    margin-right: -50px;
    width: calc(100% + 350px);
  }

  #browse .table th:nth-child(2),
  #browse .table td:nth-child(2) {
    width: 25%;
  }
  </style>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PC Builder</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">PC Builder</a>
    <div class="collapse navbar-collapse justify-content-end">
      <?php if (isset($_SESSION['username'])): ?>
        <span class="navbar-text me-3">
          Hello, <?= htmlspecialchars($_SESSION['username'], ENT_QUOTES, 'UTF-8') ?>!
        </span>
      <?php endif; ?>
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/auth/logout.php">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>