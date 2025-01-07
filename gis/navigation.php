<?php
// navigation.php
function isCurrentPage($pageName) {
    return basename($_SERVER['PHP_SELF']) === $pageName;
}
?>

<style>
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
    display: inline-block;
}
.nav a:hover {
    background-color: #34495e;
}
.nav a.active {
    background-color: #3498db;
}

/* Responsive navigation */
@media (max-width: 768px) {
    .nav {
        padding: 10px;
    }
    .nav a {
        display: block;
        margin-bottom: 5px;
        text-align: center;
    }
}
</style>

<div class="nav">
    <a href="index.php" <?= isCurrentPage('index.php') ? 'class="active"' : '' ?>>Dashboard</a>
    <a href="payments_analytics.php" <?= isCurrentPage('payments_analytics.php') ? 'class="active"' : '' ?>>Charts</a>
    <a href="check_balance.php" <?= isCurrentPage('check_balance.php') ? 'class="active"' : '' ?>>Check Balance</a>
    <a href="pay_fees.php" <?= isCurrentPage('pay_fees.php') ? 'class="active"' : '' ?>>Pay Fees</a>
    <a href="register_student.php" <?= isCurrentPage('register_student.php') ? 'class="active"' : '' ?>>Register Student</a>
    <a href="backup.php" <?= isCurrentPage('backup.php') ? 'class="active"' : '' ?>>Backup</a>
    <a href="view_students.php" <?= isCurrentPage('view_students.php') ? 'class="active"' : '' ?>>View Students</a>
    <a href="expenses.php" <?= isCurrentPage('expenses.php') ? 'class="active"' : '' ?>>Expenses</a>
    <a href="csv.php" <?= isCurrentPage('csv.php') ? 'class="active"' : '' ?>>Export CSV</a>
</div>
