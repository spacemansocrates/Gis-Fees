<?php
include 'db.php';
require_once 'navigation.php'; 

// Initialize message variable
$message = '';

// Delete transaction if delete button is clicked
if (isset($_GET['delete_id'])) {
    $transaction_id = $_GET['delete_id'];

    // SQL to delete the transaction
    $sql = "DELETE FROM payments WHERE payment_id = ?";
    if ($stmt = $conn->prepare($sql)) {
        $stmt->bind_param("i", $transaction_id);
        if ($stmt->execute()) {
            $message = 'Transaction deleted successfully.';
        } else {
            $message = 'Error deleting transaction.';
        }
    }
}

// Fetch all transactions
$transactions = $conn->query("SELECT p.payment_id, s.name, s.class, p.amount_paid, p.payment_date
                              FROM payments p
                              JOIN students s ON p.student_id = s.student_id
                              ORDER BY p.payment_date DESC");
?>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Transactions</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Delete Transactions</h1>

    <?php if ($message): ?>
        <p style="color: green;"><?= $message; ?></p>
    <?php endif; ?>

    <h2>Recent Transactions</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Student Name</th>
                <th>Class</th>
                <th>Amount Paid</th>
                <th>Payment Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($transactions->num_rows > 0): ?>
                <?php while ($row = $transactions->fetch_assoc()): ?>
                    <tr>
                        <td><?= htmlspecialchars($row['name']); ?></td>
                        <td><?= htmlspecialchars($row['class']); ?></td>
                        <td><?= htmlspecialchars($row['amount_paid']); ?></td>
                        <td><?= htmlspecialchars($row['payment_date']); ?></td>
                        <td>
                            <!-- Button to delete the transaction -->
                            <a href="?delete_id=<?= $row['payment_id']; ?>" onclick="return confirm('Are you sure you want to delete this transaction?')">
                                Delete
                            </a>
                        </td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td colspan="5">No transactions found.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</body>
</html>
