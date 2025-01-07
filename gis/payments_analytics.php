<?php
include 'db.php';
require_once 'navigation.php'; 
// Get student distribution by class
$class_distribution_query = "SELECT class, COUNT(*) as count 
                           FROM students 
                           GROUP BY class 
                           ORDER BY class";
$class_result = $conn->query($class_distribution_query);
$class_data = [];
while ($row = $class_result->fetch_assoc()) {
    $class_data[] = $row;
}

// Get daily payments for current month
$daily_payments_query = "SELECT DATE(payment_date) as date, 
                               SUM(amount_paid) as total,
                               COUNT(*) as count
                        FROM payments 
                        WHERE MONTH(payment_date) = MONTH(CURRENT_DATE())
                        AND YEAR(payment_date) = YEAR(CURRENT_DATE())
                        GROUP BY DATE(payment_date)
                        ORDER BY date";
$daily_result = $conn->query($daily_payments_query);
$daily_data = [];
while ($row = $daily_result->fetch_assoc()) {
    $daily_data[] = $row;
}

// Get payment frequency by day of week
$weekday_query = "SELECT 
                    DAYNAME(payment_date) as weekday,
                    COUNT(*) as count,
                    AVG(amount_paid) as avg_amount
                  FROM payments
                  WHERE payment_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
                  GROUP BY DAYNAME(payment_date)
                  ORDER BY DAYOFWEEK(payment_date)";
$weekday_result = $conn->query($weekday_query);
$weekday_data = [];
while ($row = $weekday_result->fetch_assoc()) {
    $weekday_data[] = $row;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Payment Analytics</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css" rel="stylesheet">
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
            max-width: 1200px;
            margin: 0 auto;
        }
        .chart-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(500px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }
        .chart-card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .chart-container {
            height: 400px;
            position: relative;
        }
        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
        }
        h2 {
            color: #34495e;
            margin-bottom: 15px;
        }
        #calendar {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>


    <div class="container">
        <h1>Payment Analytics</h1>

        <div class="chart-grid">
            <div class="chart-card">
                <h2>Student Distribution by Class</h2>
                <div class="chart-container">
                    <canvas id="classDistribution"></canvas>
                </div>
            </div>

            <div class="chart-card">
                <h2>Daily Payments This Month</h2>
                <div class="chart-container">
                    <canvas id="dailyPayments"></canvas>
                </div>
            </div>
        </div>

        <div class="chart-card" style="margin-bottom: 20px;">
            <h2>Payment Patterns by Day of Week</h2>
            <div class="chart-container">
                <canvas id="weekdayPattern"></canvas>
            </div>
        </div>

        <div class="chart-card">
            <h2>Payment Calendar</h2>
            <div id="calendar"></div>
        </div>
    </div>

    <script>
        // Pie Chart for Class Distribution
        new Chart(document.getElementById('classDistribution'), {
            type: 'pie',
            data: {
                labels: <?= json_encode(array_column($class_data, 'class')) ?>,
                datasets: [{
                    data: <?= json_encode(array_column($class_data, 'count')) ?>,
                    backgroundColor: [
                        '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', 
                        '#9966FF', '#FF9F40', '#FF6384', '#36A2EB'
                    ]
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'right'
                    }
                }
            }
        });

        // Line Chart for Daily Payments
        new Chart(document.getElementById('dailyPayments'), {
            type: 'line',
            data: {
                labels: <?= json_encode(array_column($daily_data, 'date')) ?>,
                datasets: [{
                    label: 'Daily Payments',
                    data: <?= json_encode(array_column($daily_data, 'total')) ?>,
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
                }
            }
        });

        // Bar Chart for Weekday Patterns
        new Chart(document.getElementById('weekdayPattern'), {
            type: 'bar',
            data: {
                labels: <?= json_encode(array_column($weekday_data, 'weekday')) ?>,
                datasets: [{
                    label: 'Number of Payments',
                    data: <?= json_encode(array_column($weekday_data, 'count')) ?>,
                    backgroundColor: '#3498db'
                }, {
                    label: 'Average Amount (MK)',
                    data: <?= json_encode(array_column($weekday_data, 'avg_amount')) ?>,
                    backgroundColor: '#2ecc71',
                    yAxisID: 'y1'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        position: 'left'
                    },
                    y1: {
                        beginAtZero: true,
                        position: 'right',
                        grid: {
                            drawOnChartArea: false
                        },
                        ticks: {
                            callback: function(value) {
                                return 'MK' + value.toLocaleString();
                            }
                        }
                    }
                }
            }
        });

        // Calendar
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                height: 450,
                events: [
                    <?php 
                    foreach ($daily_data as $day) {
                        echo "{
                            title: 'MK" . number_format($day['total']) . " (" . $day['count'] . " payments)',
                            start: '" . $day['date'] . "',
                            display: 'background',
                            backgroundColor: 'rgba(52, 152, 219, " . min($day['count'] / 10, 0.9) . ")'
                        },";
                    }
                    ?>
                ]
            });
            calendar.render();
        });
    </script>
</body>
</html>