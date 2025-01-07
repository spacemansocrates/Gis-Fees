<?php
include 'db.php';
require_once 'navigation.php'; 

// Fetch students data for the table
$query = $_GET['q'] ?? '';
$page = $_GET['page'] ?? 1;
$limit = 20;
$offset = ($page - 1) * $limit;

// Fetch students with total payments
$sql = "SELECT s.student_id, s.name, s.class, s.parent_phone, 
               COALESCE(SUM(p.amount_paid), 0) AS total_paid
        FROM students s
        LEFT JOIN payments p ON s.student_id = p.student_id
        WHERE s.name LIKE '%$query%'
        GROUP BY s.student_id
        ORDER BY s.class, s.name
        LIMIT $limit OFFSET $offset";

$result = $conn->query($sql);
$students = [];
while ($row = $result->fetch_assoc()) {
    $students[] = $row;
}

// Fetch total count for pagination
$count_sql = "SELECT COUNT(*) AS total FROM students WHERE name LIKE '%$query%'";
$count_result = $conn->query($count_sql);
$total_students = $count_result->fetch_assoc()['total'];
$total_pages = ceil($total_students / $limit);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
    <style>
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        th, td { padding: 10px; text-align: left; border: 1px solid #ddd; }
        th { background-color: #f4f4f4; }
        .search-bar { margin-bottom: 20px; }
        .pagination { margin: 20px 0; text-align: center; }
        .pagination a { margin: 0 5px; padding: 5px 10px; text-decoration: none; border: 1px solid #ddd; }
        .pagination a.active { background-color: #007BFF; color: white; }
        .modal { display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 20px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); }
        .modal.active { display: block; }
        /* General Body Styling */
body {
    font-family: 'Inter', sans-serif;
    background-color: #f9fafb;
    color: #111827;
    margin: 0;
    padding: 0;
}

/* Header Styling */
h1 {
    font-size: 24px;
    font-weight: 600;
    text-align: center;
    margin: 20px 0;
    color: #1f2937;
}

/* Form Container */
form {
    max-width: 400px;
    margin: 20px auto;
    padding: 16px;
    background-color: #ffffff;
    border: 1px solid #e5e7eb;
    border-radius: 8px;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
}

label {
    font-size: 14px;
    font-weight: 500;
    color: #374151;
    display: block;
    margin-bottom: 4px;
}

input[type="text"],
input[type="number"] {
    width: 100%;
    padding: 8px;
    font-size: 14px;
    border: 1px solid #d1d5db;
    border-radius: 6px;
    background-color: #f9fafb;
    color: #111827;
    margin-bottom: 12px;
    box-sizing: border-box;
    transition: border-color 0.2s;
}

input[type="text"]:focus,
input[type="number"]:focus {
    outline: none;
    border-color: #6366f1;
    background-color: #ffffff;
}

button {
    display: block;
    width: 100%;
    padding: 10px;
    font-size: 14px;
    font-weight: 500;
    color: #ffffff;
    background-color: #6366f1;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.2s;
}

button:hover {
    background-color: #4f46e5;
}

/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 14px;
    background-color: #ffffff;
    border: 1px solid #e5e7eb;
    border-radius: 8px;
    overflow: hidden;
}

th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #e5e7eb;
}

th {
    background-color: #f3f4f6;
    color: #1f2937;
    font-weight: 600;
}

tr:hover {
    background-color: #f9fafb;
}

/* Responsive Table */
@media (max-width: 640px) {
    form {
        padding: 12px;
    }

    input[type="text"],
    input[type="number"],
    button {
        font-size: 12px;
    }

    table {
        font-size: 12px;
    }

    th, td {
        padding: 8px;
    }
}

    </style>
   
</head>
<body>
    <h1>Student Management</h1>

    <div class="search-bar">
        <input type="text" id="searchInput" placeholder="Search by name..." onkeyup="searchStudent()">
    </div>

    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Class</th>
                <th>Parent Phone</th>
                <th>Total Paid</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody id="studentTable">
            <?php foreach ($students as $student): ?>
                <tr>
                    <td><?= htmlspecialchars($student['name']) ?></td>
                    <td><?= htmlspecialchars($student['class']) ?></td>
                    <td><?= htmlspecialchars($student['parent_phone']) ?></td>
                    <td><?= htmlspecialchars($student['total_paid']) ?></td>
                    <td>
                        <button onclick="editStudent(<?= htmlspecialchars(json_encode($student)) ?>)">Edit</button>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <div class="pagination">
        <?php for ($i = 1; $i <= $total_pages; $i++): ?>
            <a href="?q=<?= htmlspecialchars($query) ?>&page=<?= $i ?>" class="<?= $i == $page ? 'active' : '' ?>">
                <?= $i ?>
            </a>
        <?php endfor; ?>
    </div>

    <div class="modal" id="editModal">
        <form id="editForm" method="POST" action="update_student.php">
            <input type="hidden" name="student_id" id="editStudentId">
            <label>Name:</label>
            <input type="text" name="name" id="editName" required><br>
            <label>Class:</label>
            <input type="text" name="class" id="editClass" required><br>
            <label>Date of Birth:</label>
            <input type="date" name="date_of_birth" id="editDob" required><br>
            <label>Gender:</label>
            <select name="gender" id="editGender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select><br>
            <label>Parent Phone:</label>
            <input type="text" name="parent_phone" id="editParentPhone" required><br>
            <button type="submit">Save Changes</button>
            <button type="button" onclick="closeModal()">Cancel</button>
        </form>
    </div>

    <script>
        function searchStudent() {
            const query = document.getElementById('searchInput').value;
            fetch(`search_students.php?q=${query}`)
                .then(response => response.json())
                .then(data => {
                    const table = document.getElementById('studentTable');
                    table.innerHTML = '';
                    data.forEach(student => {
                        const row = document.createElement('tr');
                        row.innerHTML = `
                            <td>${student.name}</td>
                            <td>${student.class}</td>
                            <td>${student.parent_phone}</td>
                            <td>${student.total_paid}</td>
                            <td><button onclick='editStudent(${JSON.stringify(student)})'>Edit</button></td>
                        `;
                        table.appendChild(row);
                    });
                });
        }

        function editStudent(student) {
            document.getElementById('editStudentId').value = student.student_id;
            document.getElementById('editName').value = student.name;
            document.getElementById('editClass').value = student.class;
            document.getElementById('editDob').value = student.date_of_birth || '';
            document.getElementById('editGender').value = student.gender || 'Male';
            document.getElementById('editParentPhone').value = student.parent_phone;
            document.getElementById('editModal').classList.add('active');
        }

        function closeModal() {
            document.getElementById('editModal').classList.remove('active');
        }
    </script>
</body>
</html>
