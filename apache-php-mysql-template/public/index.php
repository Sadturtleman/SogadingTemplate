<?php
$host = getenv('MYSQL_HOST') ?: 'db';
$user = getenv('MYSQL_USER') ?: 'appuser';
$pass = getenv('MYSQL_PASSWORD') ?: 'change_me_user';
$db   = getenv('MYSQL_DATABASE') ?: 'appdb';

$dsn = "mysql:host=$host;dbname=$db;charset=utf8mb4";
try {
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);
    $stmt = $pdo->query('SELECT NOW() as now');
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "<h1>Apache + PHP + MySQL</h1>";
    echo "<p>DB OK — server time: " . htmlspecialchars($row['now']) . "</p>";
} catch (PDOException $e) {
    http_response_code(500);
    echo "<h1>DB connection error</h1>";
    echo "<pre>" . htmlspecialchars($e->getMessage()) . "</pre>";
}
