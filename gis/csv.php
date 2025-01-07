<?php
include 'db.php';
require_once 'navigation.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $selected_class = $_POST['class'];
    $total_due = $_POST['total_due'];

    $sql = "SELECT s.name, s.class, s.parent_phone, 
                   COALESCE(SUM(p.amount_paid), 0) AS total_paid
            FROM students s
            LEFT JOIN payments p ON s.student_id = p.student_id
            WHERE s.class = ?
            GROUP BY s.student_id
            ORDER BY s.name";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $selected_class);
    $stmt->execute();
    $result = $stmt->get_result();

    $filename = "students_class_{$selected_class}_export.csv";
    header('Content-Type: text/csv');
    header("Content-Disposition: attachment; filename=$filename");
    
    $output = fopen('php://output', 'w');
    fputcsv($output, ['Name', 'Class', 'Parent Phone', 'Total Paid', 'Balance']);
    
    while ($row = $result->fetch_assoc()) {
        $balance = $total_due - $row['total_paid'];
        fputcsv($output, [
            $row['name'],
            $row['class'],
            "'".$row['parent_phone'],
            $row['total_paid'],
            $balance
        ]);
    }
    fclose($output);
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Export Student Data</title>
    <style>

        input, select { width: 100%; padding: 8px; margin-bottom: 20px; font-size: 16px; }

    </style>
        <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1 style="text-align: center;">Export Student Data</h1>
    <form method="POST">
        <label>Select Class:</label>
        <select name="class" required>
            <?php 
            $class_sql = "SELECT DISTINCT class FROM students ORDER BY class";
            $classes = $conn->query($class_sql);
            while ($row = $classes->fetch_assoc()): 
            ?>
                <option value="<?= htmlspecialchars($row['class']) ?>">
                    <?= htmlspecialchars($row['class']) ?>
                </option>
            <?php endwhile; ?>
        </select>

        <label>Total Due per Student:</label>
        <input type="number" name="total_due" required step="0.01">

        <button type="submit">Export</button>
    </form>
</body>
</html>