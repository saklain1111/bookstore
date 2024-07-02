<?php
include 'db.php';
session_start();

$sql = "SELECT * FROM books";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Bookstore</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h2>Online Bookstore</h2>
    <a href="register.php">Register</a>
    <a href="login.php">Login</a>
    <?php if (isset($_SESSION["username"])): ?>
        <p>Welcome, <?php echo $_SESSION["username"]; ?> | <a href="logout.php">Logout</a></p>
    <?php endif; ?>
    <div class="book-list">
        <?php while ($row = $result->fetch_assoc()): ?>
            <div class="book">
                <img src="<?php echo $row["cover_image"]; ?>" alt="Cover Image">
                <h3><?php echo $row["title"]; ?></h3>
                <p><?php echo $row["author"]; ?></p>
                <p><?php echo $row["description"]; ?></p>
                <p>$<?php echo $row["price"]; ?></p>
                <button class="add-to-cart" data-id="<?php echo $row["id"]; ?>">Add to Cart</button>
            </div>
        <?php endwhile; ?>
    </div>
    <script src="script.js"></script>
</body>
</html>