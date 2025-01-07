<?php
// Include database connection
include 'db.php';
require_once 'navigation.php'; 

// Initialize variables
$message = '';
$total_paid = 0;
$student_details = [];
$payment_history = [];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $student_id = $_POST['student_id'];

    // Get student details
    $student_sql = "SELECT * FROM students WHERE student_id = '$student_id'";
    $result = $conn->query($student_sql);
    
    if ($result->num_rows > 0) {
        $student_details = $result->fetch_assoc();

        // Get payment history for the selected student
        $payment_sql = "SELECT * FROM payments WHERE student_id = '$student_id'";
        $payment_result = $conn->query($payment_sql);

        while ($payment = $payment_result->fetch_assoc()) {
            $payment_history[] = $payment;
            $total_paid += $payment['amount_paid']; // Accumulate total paid
        }
    } else {
        $message = "Student not found.";
    }
}

// Fetch all students for search
$students_sql = "SELECT student_id, name FROM students";
$students_result = $conn->query($students_sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Student Balance</title>
    <link rel="stylesheet" type="text/css" href="styles.css">

    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
        }
        .student-info, .payment-history {
            margin-top: 20px;
        }
        .payment-history table {
            width: 100%;
            border-collapse: collapse;
        }
        .payment-history table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        .total-paid {
            font-size: 2em;
            color: green;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Check Student Balance</h1>

    <form method="POST" action="">
        <label for="student_name">Search Student (Enter Name):</label>
        <input type="text" id="student_name" name="student_name" list="students" placeholder="Search by name" oninput="searchStudent()">
        <datalist id="students">
            <?php while ($student = $students_result->fetch_assoc()) { ?>
                <option value="<?= $student['name']; ?>" data-id="<?= $student['student_id']; ?>">
            <?php } ?>
        </datalist>
        <input type="hidden" id="student_id" name="student_id">
        <button type="submit">Search</button>
    </form>

    <?php if ($message) : ?>
        <p style="color: red;"><?= $message; ?></p>
    <?php endif; ?>

    <?php if ($student_details) : ?>
        <div class="student-info">
            <h2>Student Details</h2>
            <p><strong>Name:</strong> <?= $student_details['name']; ?></p>
            <p><strong>Class:</strong> <?= $student_details['class']; ?></p>
            <p><strong>Date of Birth:</strong> <?= $student_details['date_of_birth']; ?></p>
            <p><strong>Gender:</strong> <?= $student_details['gender']; ?></p>
            <p><strong>Parent Phone:</strong> <?= $student_details['parent_phone']; ?></p>
        </div>

        <div class="payment-history">
            <h2>Payment History</h2>
            <p class="total-paid">Total Paid: $<?= number_format($total_paid, 2); ?></p>
            <table>
                <thead>
                    <tr>
                        <th>Payment Date</th>
                        <th>Amount Paid</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($payment_history as $payment) : ?>
                        <tr>
                            <td><?= $payment['payment_date']; ?></td>
                            <td>$<?= number_format($payment['amount_paid'], 2); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    <?php endif; ?>
</div>

<script>
    // Update the hidden student_id field when a student is selected
    function searchStudent() {
        const selectedOption = document.querySelector('#students option[value="' + document.getElementById('student_name').value + '"]');
        if (selectedOption) {
            document.getElementById('student_id').value = selectedOption.dataset.id;
        }
    }
</script>

</body>
</html>
