<?php
include 'db.php';
require_once 'navigation.php'; 

// Initialize message variable
$message = '';

// Check if form is submitted and the necessary fields are provided
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['student_id']) && isset($_POST['amount_paid']) && !empty($_POST['amount_paid'])) {
        $student_id = $_POST['student_id'];
        $amount_paid = $_POST['amount_paid'];

        // Insert payment into database
        $sql = "INSERT INTO payments (student_id, amount_paid, payment_date) VALUES (?, ?, NOW())";
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("id", $student_id, $amount_paid); // Changed to 'id' for integer and decimal
            if ($stmt->execute()) {
                $message = 'Payment complete.';
            } else {
                $message = 'Error processing payment.';
            }
        }
    } else {
        $message = 'Please enter an amount paid and select a student.';
    }
}

// Fetch recent transactions
$recent_transactions = $conn->query("SELECT s.name, s.class, p.amount_paid, p.payment_date
                                    FROM payments p
                                    JOIN students s ON p.student_id = s.student_id
                                    ORDER BY p.payment_date DESC LIMIT 5");
?>

<!DOCTYPE html>
<html>
<head>
    <title>Pay Fees</title>
    <script>
        let selectedStudentId = null;

        async function fetchStudents(query) {
            if (query.length < 2) {
                document.getElementById('students').innerHTML = '';
                return;
            }

            try {
                const response = await fetch(`search_students.php?q=${encodeURIComponent(query)}`);
                const students = await response.json();
                const datalist = document.getElementById('students');
                datalist.innerHTML = '';

                students.forEach(student => {
                    const option = document.createElement('option');
                    option.value = `${student.name} (Class ${student.class})`;
                    option.setAttribute('data-id', student.student_id);
                    datalist.appendChild(option);
                });
            } catch (error) {
                console.error('Error fetching students:', error);
            }
        }

        function handleStudentSelect() {
            const input = document.getElementById('student_name');
            const datalist = document.getElementById('students');
            const options = datalist.getElementsByTagName('option');
            
            for (let option of options) {
                if (option.value === input.value) {
                    selectedStudentId = option.getAttribute('data-id');
                    document.getElementById('student_id').value = selectedStudentId;
                    return;
                }
            }
            
            // Clear student_id if no match found
            selectedStudentId = null;
            document.getElementById('student_id').value = '';
        }

        function validateForm(event) {
            event.preventDefault();
            
            if (!selectedStudentId) {
                alert('Please select a valid student from the dropdown list.');
                return false;
            }
            
            const amountPaid = document.getElementById('amount_paid').value;
            if (!amountPaid || amountPaid <= 0) {
                alert('Please enter a valid amount.');
                return false;
            }

            document.getElementById('payment_form').submit();
        }
    </script>
    <style>
        .error-message {
            color: red;
            margin-bottom: 10px;
        }
        .success-message {
            color: green;
            margin-bottom: 10px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="styles.css">

</head>
<body>
    <h1>Pay Fees</h1>

    <?php if ($message): ?>
        <p class="<?= strpos($message, 'Error') !== false ? 'error-message' : 'success-message' ?>">
            <?= htmlspecialchars($message); ?>
        </p>
    <?php endif; ?>

    <form id="payment_form" method="POST" onsubmit="validateForm(event)">
        <label for="student_name">Search Student:</label><br>
        <input type="text" 
               id="student_name" 
               name="student_name" 
               oninput="fetchStudents(this.value)" 
               onchange="handleStudentSelect()"
               list="students" 
               required 
               autocomplete="off">
        <datalist id="students"></datalist><br><br>

        <input type="hidden" id="student_id" name="student_id">

        <label for="amount_paid">Amount Paid:</label><br>
        <input type="number" 
               id="amount_paid" 
               name="amount_paid" 
               step="0.01" 
               min="0.01" 
               required><br><br>
        
        <button type="submit">Submit Payment</button>
    </form>

    <h2>Recent Transactions</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Student Name</th>
                <th>Class</th>
                <th>Amount Paid</th>
                <th>Payment Date</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($recent_transactions && $recent_transactions->num_rows > 0): ?>
                <?php while ($row = $recent_transactions->fetch_assoc()): ?>
                    <tr>
                        <td><?= htmlspecialchars($row['name']); ?></td>
                        <td><?= htmlspecialchars($row['class']); ?></td>
                        <td><?= htmlspecialchars($row['amount_paid']); ?></td>
                        <td><?= htmlspecialchars($row['payment_date']); ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td colspan="4">No recent transactions found.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</body>
</html>