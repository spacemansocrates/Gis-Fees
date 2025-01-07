<?php
// Include database connection
include 'db.php';
require_once 'navigation.php'; 
?>
<?php
// Add this at the top of your existing file
session_start();

// Get summary data
function getSummaryData($conn) {
    $total_income = $conn->query("SELECT SUM(amount_paid) as total FROM payments")->fetch_assoc()['total'] ?? 0;
    $total_expenses = $conn->query("SELECT SUM(amount) as total FROM expenses")->fetch_assoc()['total'] ?? 0;
    $balance = $total_income - $total_expenses;
    
    return [
        'income' => $total_income,
        'expenses' => $total_expenses,
        'balance' => $balance
    ];
}

// Get category data for chart
function getCategoryData($conn) {
    $result = $conn->query("SELECT category, SUM(amount) as total FROM expenses GROUP BY category");
    $categories = [];
    $amounts = [];
    
    while ($row = $result->fetch_assoc()) {
        $categories[] = $row['category'];
        $amounts[] = $row['total'];
    }
    
    return ['labels' => $categories, 'values' => $amounts];
}

// Get recent expenses
function getRecentExpenses($conn) {
    return $conn->query("SELECT * FROM expenses ORDER BY expense_date DESC LIMIT 10");
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $description = $conn->real_escape_string($_POST['description']);
    $amount = floatval($_POST['amount']);
    $category = $conn->real_escape_string($_POST['category']);
    $expense_date = $conn->real_escape_string($_POST['expense_date']);
    $notes = $conn->real_escape_string($_POST['notes']);
    
    $sql = "INSERT INTO expenses (description, amount, category, expense_date, notes, created_at, updated_at) 
            VALUES ('$description', $amount, '$category', '$expense_date', '$notes', NOW(), NOW())";
    
    if ($conn->query($sql)) {
        $_SESSION['success'] = "Expense added successfully";
    } else {
        $_SESSION['error'] = "Error adding expense: " . $conn->error;
    }
    
    header("Location: " . $_SERVER['PHP_SELF']);
    exit();
}

// Get data for display
$summaryData = getSummaryData($conn);
$categoryData = getCategoryData($conn);
$recentExpenses = getRecentExpenses($conn);
?>

<script>
// Replace the sample data with PHP data
const expenses = <?php 
    $expensesArray = [];
    while ($row = $recentExpenses->fetch_assoc()) {
        $expensesArray[] = $row;
    }
    echo json_encode($expensesArray);
?>;

const categoryData = <?php echo json_encode($categoryData); ?>;

// Update summary cards
document.querySelector('.summary-card:nth-child(1) .amount').textContent = 
    `$${parseFloat(<?php echo $summaryData['balance']; ?>).toFixed(2)}`;
document.querySelector('.summary-card:nth-child(2) .amount').textContent = 
    `$${parseFloat(<?php echo $summaryData['income']; ?>).toFixed(2)}`;
document.querySelector('.summary-card:nth-child(3) .amount').textContent = 
    `$${parseFloat(<?php echo $summaryData['expenses']; ?>).toFixed(2)}`;

// Update form handling
document.getElementById('expenseForm').action = '<?php echo $_SERVER["PHP_SELF"]; ?>';
document.getElementById('expenseForm').method = 'POST';
</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Tracker</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            padding: 24px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: #333;
        }

        .summary-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 24px;
        }

        .summary-card {
            padding: 20px;
            border-radius: 8px;
            background: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .summary-card h3 {
            font-size: 0.875rem;
            color: #666;
            margin-bottom: 8px;
        }

        .summary-card .amount {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }

        .main-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 20px;
            margin-bottom: 24px;
        }

        .form-group {
            margin-bottom: 16px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 0.875rem;
            color: #666;
        }

        .form-control {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        .btn {
            background: #3b82f6;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            width: 100%;
        }

        .btn:hover {
            background: #2563eb;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f8f9fa;
            font-weight: 600;
        }

        .chart-container {
            height: 300px;
            position: relative;
        }

        .icon {
            width: 24px;
            height: 24px;
            stroke: currentColor;
        }

        .icon-up {
            color: #22c55e;
        }

        .icon-down {
            color: #ef4444;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="summary-grid">
            <div class="summary-card">
                <div class="card-header">
                    <h3>Total Balance</h3>
                    <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M12 1v22M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                    </svg>
                </div>
                <div class="amount">$3,500.00</div>
            </div>
            <div class="summary-card">
                <div class="card-header">
                    <h3>Income</h3>
                    <svg class="icon icon-up" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M23 6l-9.5 9.5-5-5L1 18"></path>
                    </svg>
                </div>
                <div class="amount">$5,200.00</div>
            </div>
            <div class="summary-card">
                <div class="card-header">
                    <h3>Expenses</h3>
                    <svg class="icon icon-down" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M23 18l-9.5-9.5-5 5L1 6"></path>
                    </svg>
                </div>
                <div class="amount">$1,700.00</div>
            </div>
        </div>

        <div class="main-grid">
            <div class="card">
                <div class="card-header">
                    <h2 class="card-title">Add New Expense</h2>
                </div>
                <form id="expenseForm">
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input type="text" id="description" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="amount">Amount</label>
                        <input type="number" id="amount" class="form-control" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label for="category">Category</label>
                        <input type="text" id="category" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="expense_date">Date</label>
                        <input type="date" id="expense_date" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="notes">Notes</label>
                        <textarea id="notes" class="form-control" rows="4"></textarea>
                    </div>
                    <button type="submit" class="btn">Add Expense</button>
                </form>
            </div>

            <div class="card">
                <div class="card-header">
                    <h2 class="card-title">Expense Categories</h2>
                </div>
                <div class="chart-container">
                    <canvas id="categoryChart"></canvas>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Recent Expenses</h2>
            </div>
            <div class="table-container">
                <table id="expensesTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Description</th>
                            <th>Amount</th>
                            <th>Category</th>
                            <th>Date</th>
                            <th>Notes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Table rows will be populated by JavaScript -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        // Sample data
        const expenses = [
            { id: 1, description: "Groceries", amount: 150.00, category: "Food", expense_date: "2025-01-05", notes: "Weekly groceries" },
            { id: 2, description: "Internet", amount: 89.99, category: "Utilities", expense_date: "2025-01-04", notes: "Monthly bill" }
        ];

        const categoryData = {
            labels: ['Food', 'Utilities', 'Transport', 'Entertainment'],
            values: [450, 300, 250, 200]
        };

        // Initialize chart
        const ctx = document.getElementById('categoryChart').getContext('2d');
        new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: categoryData.labels,
                datasets: [{
                    data: categoryData.values,
                    backgroundColor: [
                        '#0088FE',
                        '#00C49F',
                        '#FFBB28',
                        '#FF8042'
                    ]
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });

        // Populate table
        function populateTable() {
            const tbody = document.querySelector('#expensesTable tbody');
            tbody.innerHTML = expenses.map(expense => `
                <tr>
                    <td>${expense.id}</td>
                    <td>${expense.description}</td>
                    <td>$${expense.amount.toFixed(2)}</td>
                    <td>${expense.category}</td>
                    <td>${expense.expense_date}</td>
                    <td>${expense.notes}</td>
                </tr>
            `).join('');
        }

        // Handle form submission
        document.getElementById('expenseForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const formData = {
                id: expenses.length + 1,
                description: document.getElementById('description').value,
                amount: parseFloat(document.getElementById('amount').value),
                category: document.getElementById('category').value,
                expense_date: document.getElementById('expense_date').value,
                notes: document.getElementById('notes').value
            };
            
            expenses.unshift(formData);
            populateTable();
            this.reset();
        });

        // Initialize table
        populateTable();
    </script>
</body>
</html>