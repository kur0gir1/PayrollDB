<?php
session_start();
include 'database.php';

$username = '';
if (isset($_SESSION['username'])) {
    $username = htmlspecialchars($_SESSION['username']); // Get the username safely
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payroll Table</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="container-fluid bg-dark text-white">
  <div class="container mt-5 bg-dark text-light p-4">
  <div class="d-flex justify-content-between align-items-center mb-4">
      <h2 class="mb-0">BlockForge Labs</h2>
      <div>
        <span class="me-3">Welcome, <?php echo $username ?: 'Guest'; ?>!</span>
        <a href="login.php" class="btn btn-outline-light">Logout</a> <!-- Change to logout.php -->
      </div>
    </div>

    <h1 class="text-center">Payroll Table</h1>

    <nav class="navbar navbar-expand-lg navbar-dark bg-black justify-content-center">
      <ul class="navbar-nav">
        <li class="nav-item"><a href="index.php" class="nav-link text-light">Employees Table</a></li>
        <li class="nav-item"><a href="departments.php" class="nav-link text-light">Departments Table</a></li>
        <li class="nav-item"><a href="payroll.php" class="nav-link text-light active">Payroll Table</a></li>
        <li class="nav-item"><a href="addemployee.php" class="nav-link text-light active btn btn-success">Add Employee</a></li>
      </ul>
    </nav>

    <?php
    include 'database.php';

    // Determine sorting order
    $sort = isset($_GET['sort']) ? $_GET['sort'] : 'PayrollID';
    $order = isset($_GET['order']) && $_GET['order'] == 'asc' ? 'desc' : 'asc';

    // Adjust the SQL query to include sorting
    $sql = "SELECT * FROM payroll ORDER BY $sort $order";
    $result = mysqli_query($conn, $sql);

    if ($result && mysqli_num_rows($result) > 0) {
        echo "<table class='table table-dark table-striped mt-4'>";
        echo "<thead>";
        echo "<tr>";
        echo "<th><a href='?sort=PayrollID&order=$order' class='text-light'>Payroll ID</a></th>";
        echo "<th><a href='?sort=EmployeeID&order=$order' class='text-light'>Employee ID</a></th>";
        echo "<th><a href='?sort=FirstName&order=$order' class='text-light'>First Name</a></th>";
        echo "<th><a href='?sort=LastName&order=$order' class='text-light'>Last Name</a></th>";
        echo "<th><a href='?sort=GrossPay&order=$order' class='text-light'>Gross Pay</a></th>"; 
        echo "<th><a href='?sort=Deductions&order=$order' class='text-light'>Deductions</a></th>"; 
        echo "<th><a href='?sort=NetPay&order=$order' class='text-light'>Net Pay</a></th>"; 
        echo "<th>Actions</th>";
        echo "</tr>";
        echo "</thead>";
        echo "<tbody>";

        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['PayrollID']) . "</td>";
            echo "<td>" . htmlspecialchars($row['EmployeeID']) . "</td>";
            echo "<td>" . htmlspecialchars($row['FirstName']) . "</td>";
            echo "<td>" . htmlspecialchars($row['LastName']) . "</td>";
            echo "<td>" . htmlspecialchars($row['GrossPay']) . "</td>";
            echo "<td>" . htmlspecialchars($row['Deductions']) . "</td>";
            echo "<td>" . htmlspecialchars($row['NetPay']) . "</td>";
            echo "<td>
                    <a href='edit.php?employeeID=" . htmlspecialchars($row['EmployeeID']) . "' class='btn btn-warning btn-sm'>Edit</a>
                    <a href='delete.php?employeeID=" . htmlspecialchars($row['EmployeeID']) . "&payrollID=" . htmlspecialchars($row['PayrollID']) . "' class='btn btn-danger btn-sm' onclick='return confirm(\"Are you sure you want to delete this employee and their payroll record?\");'>Delete</a>

                  </td>";
            echo "</tr>";
        }

        echo "</tbody>";
        echo "</table>";
    } else {
        echo "<div class='alert alert-info mt-4'>No records found.</div>";
    }

    mysqli_close($conn);
    ?>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
