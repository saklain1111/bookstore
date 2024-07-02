<?php
include 'db.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $data = json_decode(file_get_contents("php://input"), true);
    $bookId = $data['bookId'];
    $userId = $_SESSION['userid'];

    $sql = "INSERT INTO orders (user_id, total_price) VALUES ('$userId', 0)";
    if ($conn->query($sql) === TRUE) {
        $orderId = $conn->insert_id;
        $sql = "SELECT price FROM books WHERE id='$bookId'";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $price = $row['price'];
            $sql = "INSERT INTO order_items (order_id, book_id, quantity, price) VALUES ('$orderId', '$bookId', 1, '$price')";
            if ($conn->query($sql) === TRUE) {
                $response = ["success" => true];
                echo json_encode($response);
                exit();
            }
        }
    }
    $response = ["success" => false];
    echo json_encode($response);
}
?>