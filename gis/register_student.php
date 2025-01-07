<?php
include 'db.php';
require_once 'navigation.php'; 

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $class = $_POST['class'];
    $dob = $_POST['dob'];
    $gender = $_POST['gender'];
    $parent_phone = $_POST['parent_phone'];

    $sql = "INSERT INTO students (name, class, date_of_birth, gender, parent_phone) 
            VALUES ('$name', '$class', '$dob', '$gender', '$parent_phone')";

    if ($conn->query($sql) === TRUE) {
        echo "Student registered successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Register Student</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Register Student</h1>
    <form method="POST">
        <label>Name:</label><br>
        <input type="text" name="name" required><br><br>
        
        <label>Class:</label><br>
        <input type="text" name="class" required><br><br>
        
        <label>Date of Birth:</label><br>
        <input type="date" name="dob" required><br><br>
        
        <label>Gender:</label><br>
        <select name="gender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select><br><br>
        
        <label>Parent Phone:</label><br>
        <input type="text" name="parent_phone" required><br><br>
        
        <button type="submit">Register</button>
    </form>
</body>
</html>
