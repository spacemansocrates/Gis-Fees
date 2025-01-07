<?php
// Database configuration
include 'db.php';
require_once 'navigation.php'; 

class DatabaseBackup {
    private $conn;
    private $backup_dir;
    
    public function __construct($conn) {
        $this->conn = $conn;
        $this->backup_dir = 'backups';
        
        // Create backup directory if it doesn't exist
        if (!file_exists($this->backup_dir)) {
            mkdir($this->backup_dir, 0777, true);
        }
    }
    
    public function backup() {
        try {
            $tables = array();
            $result = $this->conn->query("SHOW TABLES");
            
            while ($row = $result->fetch_row()) {
                $tables[] = $row[0];
            }
            
            $sql = "-- GIS Database Backup\n";
            $sql .= "-- Generated: " . date('Y-m-d H:i:s') . "\n\n";
            $sql .= "SET FOREIGN_KEY_CHECKS=0;\n\n";
            
            // Iterate through each table
            foreach ($tables as $table) {
                // Get table creation SQL
                $result = $this->conn->query("SHOW CREATE TABLE $table");
                $row = $result->fetch_row();
                $sql .= "\n\n" . $row[1] . ";\n\n";
                
                // Get table data
                $result = $this->conn->query("SELECT * FROM $table");
                while ($row = $result->fetch_assoc()) {
                    $sql .= "INSERT INTO `$table` VALUES(";
                    $values = array();
                    foreach ($row as $value) {
                        $values[] = $value === null ? 'NULL' : "'" . $this->conn->real_escape_string($value) . "'";
                    }
                    $sql .= implode(', ', $values) . ");\n";
                }
                $sql .= "\n";
            }
            
            $sql .= "\nSET FOREIGN_KEY_CHECKS=1;";
            
            // Generate backup filename with timestamp
            $backup_file = $this->backup_dir . '/backup_' . date('Y-m-d_H-i-s') . '.sql';
            
            // Save backup file
            file_put_contents($backup_file, $sql);
            
            return array(
                'success' => true,
                'message' => 'Backup created successfully: ' . $backup_file,
                'filename' => $backup_file
            );
            
        } catch (Exception $e) {
            return array(
                'success' => false,
                'message' => 'Error creating backup: ' . $e->getMessage()
            );
        }
    }
    
    public function listBackups() {
        $backups = array();
        if (is_dir($this->backup_dir)) {
            foreach (scandir($this->backup_dir) as $file) {
                if (pathinfo($file, PATHINFO_EXTENSION) === 'sql') {
                    $backups[] = array(
                        'filename' => $file,
                        'size' => filesize($this->backup_dir . '/' . $file),
                        'date' => date('Y-m-d H:i:s', filemtime($this->backup_dir . '/' . $file))
                    );
                }
            }
        }
        return $backups;
    }
}

// Create backup interface
?>
<!DOCTYPE html>
<html>
<head>
    <title>Database Backup</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .nav {
            background-color: #2c3e50;
            padding: 15px 20px;
            margin-bottom: 20px;
        }
        .nav a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            margin-right: 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .nav a:hover {
            background-color: #34495e;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        .card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .button {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #2980b9;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f8f9fa;
        }
        .success-message {
            color: green;
            padding: 10px;
            background-color: #e8f5e9;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .error-message {
            color: red;
            padding: 10px;
            background-color: #ffebee;
            border-radius: 4px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>


    <div class="container">
        <div class="card">
            <h1>Database Backup</h1>
            
            <?php
            // Handle backup creation
            if (isset($_POST['create_backup'])) {
                $backup = new DatabaseBackup($conn);
                $result = $backup->backup();
                if ($result['success']) {
                    echo "<div class='success-message'>{$result['message']}</div>";
                } else {
                    echo "<div class='error-message'>{$result['message']}</div>";
                }
            }
            ?>
            
            <form method="post">
                <button type="submit" name="create_backup" class="button">Create New Backup</button>
            </form>
            
            <h2>Existing Backups</h2>
            <table>
                <thead>
                    <tr>
                        <th>Filename</th>
                        <th>Size</th>
                        <th>Date Created</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $backup = new DatabaseBackup($conn);
                    $backups = $backup->listBackups();
                    
                    foreach ($backups as $backup) {
                        echo "<tr>";
                        echo "<td>{$backup['filename']}</td>";
                        echo "<td>" . number_format($backup['size'] / 1024, 2) . " KB</td>";
                        echo "<td>{$backup['date']}</td>";
                        echo "<td><a href='backups/{$backup['filename']}' download>Download</a></td>";
                        echo "</tr>";
                    }
                    
                    if (empty($backups)) {
                        echo "<tr><td colspan='4'>No backups found</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>