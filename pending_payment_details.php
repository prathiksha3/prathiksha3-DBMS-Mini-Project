<?php 
include('db_connect.php');

// Query to fetch pending payments
$sql = "SELECT * FROM payments WHERE status = 'pending'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        // Display pending payment details here
        echo "ID: " . $row["id"]. " - Amount: " . $row["amount"]. "<br>";
    }
} else {
    echo "No pending payments.";
}
$conn->close();
?>
