<?php
include 'db.php';
require_once 'navigation.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $selected_class = $_POST['class'];
    $total_due = $_POST['total_due'];

    // Fetch students in the selected class with total payments
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

    // Prepare CSV data
    $csv_data = [];
    $csv_data[] = ['Name', 'Class', 'Parent Phone', 'Total Paid', 'Balance'];

    while ($row = $result->fetch_assoc()) {
        $balance = $total_due - $row['total_paid'];
        $csv_data[] = [
            $row['name'],
            $row['class'],
            $row['parent_phone'],
            $row['total_paid'],
            $balance,
        ];
    }

    // Generate and download CSV
    $filename = "students_class_{$selected_class}_export.csv";
    header('Content-Type: text/csv');
    header("Content-Disposition: attachment; filename=$filename");
    $output = fopen('php://output', 'w');
    foreach ($csv_data as $line) {
        fputcsv($output, $line);
    }
    fclose($output);
    exit;
}

// Fetch all available classes for the dropdown
$class_sql = "SELECT DISTINCT class FROM students ORDER BY class";
$class_result = $conn->query($class_sql);
$classes = [];
while ($row = $class_result->fetch_assoc()) {
    $classes[] = $row['class'];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Export Student Data</title>
    <style>
        form { max-width: 400px; margin: auto; padding: 20px; border: 1px solid #ddd; background: #f9f9f9; }
        label { display: block; margin-bottom: 10px; font-weight: bold; }
        input, select { width: 100%; padding: 8px; margin-bottom: 20px; border: 1px solid #ddd; border-radius: 4px; }
        button { padding: 10px 20px; border: none; background: #007BFF; color: white; border-radius: 4px; cursor: pointer; }
        button:hover { background: #0056b3; }
    </style>
        <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1 style="text-align: center;">Export Student Data to CSV</h1>
    <form method="POST" action="">
        <label for="class">Select Class:</label>
        <select name="class" id="class" required>
            <option value="">-- Select Class --</option>
            <?php foreach ($classes as $class): ?>
                <option value="<?= htmlspecialchars($class) ?>"><?= htmlspecialchars($class) ?></option>
            <?php endforeach; ?>
        </select>

        <label for="total_due">Enter Total Due per Student:</label>
        <input type="number" name="total_due" id="total_due" required step="0.01">

        <button type="submit">Export to CSV</button>
    </form>
</body>
</html>
