<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $student_id = $_POST['student_id'];
    $name = $_POST['name'];
    $class = $_POST['class'];
    $dob = $_POST['date_of_birth'];
    $gender = $_POST['gender'];
    $parent_phone = $_POST['parent_phone'];

    $sql = "UPDATE students 
            SET name = ?, class = ?, date_of_birth = ?, gender = ?, parent_phone = ? 
            WHERE student_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('sssssi', $name, $class, $dob, $gender, $parent_phone, $student_id);

    if ($stmt->execute()) {
        header('Location: student_management.php');
    } else {
        echo "Error updating record: " . $conn->error;
    }
}
?>
