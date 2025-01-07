<?php
include 'db.php';
require_once 'navigation.php'; 

// Get total payments for today
$today_query = "SELECT COUNT(*) as count, COALESCE(SUM(amount_paid), 0) as total 
                FROM payments 
                WHERE DATE(payment_date) = CURDATE()";
$today_result = $conn->query($today_query);
$today_stats = $today_result->fetch_assoc();

// Get total payments for current month
$month_query = "SELECT COUNT(*) as count, COALESCE(SUM(amount_paid), 0) as total 
                FROM payments 
                WHERE MONTH(payment_date) = MONTH(CURDATE()) 
                AND YEAR(payment_date) = YEAR(CURDATE())";
$month_result = $conn->query($month_query);
$month_stats = $month_result->fetch_assoc();

// Get payments by class
$class_query = "SELECT s.class, COUNT(*) as payment_count, COALESCE(SUM(p.amount_paid), 0) as total_amount
                FROM payments p
                JOIN students s ON p.student_id = s.student_id
                GROUP BY s.class
                ORDER BY s.class";
$class_result = $conn->query($class_query);

// Get recent payments
$recent_query = "SELECT s.name, s.class, p.amount_paid, p.payment_date
                FROM payments p
                JOIN students s ON p.student_id = s.student_id
                ORDER BY p.payment_date DESC
                LIMIT 10";
$recent_result = $conn->query($recent_query);

// Get monthly totals for chart
$monthly_totals_query = "SELECT 
                            DATE_FORMAT(payment_date, '%Y-%m') as month,
                            COALESCE(SUM(amount_paid), 0) as total
                        FROM payments
                        WHERE payment_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
                        GROUP BY DATE_FORMAT(payment_date, '%Y-%m')
                        ORDER BY month";
$monthly_totals_result = $conn->query($monthly_totals_query);
$monthly_data = [];
while ($row = $monthly_totals_result->fetch_assoc()) {
    $monthly_data[] = $row;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>GIS sytem</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
        .nav a.active {
            background-color: #3498db;
        }
        .container {
            padding: 20px;
        }
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }
        .card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .stat-card {
            text-align: center;
        }
        .stat-value {
            font-size: 24px;
            font-weight: bold;
            color: #2c3e50;
        }
        .stat-label {
            color: #7f8c8d;
            margin-top: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f8f9fa;
        }
        .chart-container {
            height: 400px;
        }
        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
        }
        h2 {
            color: #34495e;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Payment Dashboard</h1>

        <div class="dashboard-grid">
            <div class="card stat-card">
                <div class="stat-value"><?= number_format($today_stats['count']) ?></div>
                <div class="stat-label">Payments Today</div>
                <div class="stat-value">MK<?= number_format($today_stats['total'], 2) ?></div>
                <div class="stat-label">Total Amount Today</div>
            </div>

            <div class="card stat-card">
                <div class="stat-value"><?= number_format($month_stats['count']) ?></div>
                <div class="stat-label">Payments This Month</div>
                <div class="stat-value">MK<?= number_format($month_stats['total'], 2) ?></div>
                <div class="stat-label">Total Amount This Month</div>
            </div>
        </div>

        <div class="dashboard-grid">
            <div class="card">
                <h2>Payments by Class</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Class</th>
                            <th>Number of Payments</th>
                            <th>Total Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = $class_result->fetch_assoc()): ?>
                        <tr>
                            <td><?= htmlspecialchars($row['class']) ?></td>
                            <td><?= number_format($row['payment_count']) ?></td>
                            <td>MK<?= number_format($row['total_amount'], 2) ?></td>
                        </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>

            <div class="card">
                <h2>Recent Payments</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Student</th>
                            <th>Class</th>
                            <th>Amount</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = $recent_result->fetch_assoc()): ?>
                        <tr>
                            <td><?= htmlspecialchars($row['name']) ?></td>
                            <td><?= htmlspecialchars($row['class']) ?></td>
                            <td>MK<?= number_format($row['amount_paid'], 2) ?></td>
                            <td><?= date('M d, Y g:i A', strtotime($row['payment_date'])) ?></td>
                        </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="card">
            <h2>Monthly Payment Trends</h2>
            <div class="chart-container">
                <canvas id="monthlyChart"></canvas>
            </div>
        </div>
    </div>

    <script>
        // Monthly payments chart
        const ctx = document.getElementById('monthlyChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: <?= json_encode(array_column($monthly_data, 'month')) ?>,
                datasets: [{
                    label: 'Monthly Payments',
                    data: <?= json_encode(array_column($monthly_data, 'total')) ?>,
                    borderColor: '#2980b9',
                    tension: 0.1,
                    fill: false
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: function(value) {
                                return 'MK' + value.toLocaleString();
                            }
                        }
                    }
                },
                plugins: {
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return 'MK' + context.raw.toLocaleString();
                            }
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>