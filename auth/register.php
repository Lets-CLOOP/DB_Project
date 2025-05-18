<?php
session_start();

require_once __DIR__ . '/../db_pdo.php';

$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = $_POST['password'] ?? '';
    $email    = trim($_POST['email'] ?? '');

    if ($username === '' || $password === '') {
        $error = 'Username and password are essential.';
    } else {
        $hash = password_hash($password, PASSWORD_DEFAULT);
        try {
            $pdo = getPDO();
            $stmt = $pdo->prepare(
                'INSERT INTO User (username, password_hash, email) VALUES (?, ?, ?)'
            );
            $stmt->execute([$username, $hash, $email]);

            header('Location: /login.php');
            exit;
        } catch (PDOException $e) {
            $error = 'registration err: ' . htmlspecialchars($e->getMessage());
        }
    }
}
?>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>registration</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5" style="max-width:400px;">
  <h2 class="mb-4">registration</h2>
  <?php if ($error): ?>
    <div class="alert alert-danger"><?= $error ?></div>
  <?php endif; ?>
  <form method="post">
    <div class="mb-3">
      <label for="username" class="form-label">Username</label>
      <input id="username" name="username" class="form-control" required>
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">Email (selective)</label>
      <input id="email" name="email" type="email" class="form-control">
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input id="password" name="password" type="password" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-success">registration</button>
    <a href="login.php" class="btn btn-link">Back to Login</a>
  </form>
</div>
</body>
</html>
