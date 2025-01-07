<?php
include 'db.php';

$query = $_GET['q'] ?? '';

$sql = "SELECT student_id, name, class 
        FROM students 
        WHERE name LIKE '%$query%' 
        LIMIT 10";

$result = $conn->query($sql);

$students = [];
while ($row = $result->fetch_assoc()) {
    $students[] = $row;
}
echo json_encode($students);
?>
