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
  <title>Departments Table</title>
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
    <h1 class="text-center">Departments Table</h1>

    <nav class="navbar navbar-expand-lg navbar-dark bg-black justify-content-center">
      <ul class="navbar-nav">
        <li class="nav-item"><a href="index.php" class="nav-link text-light">Employees Table</a></li>
        <li class="nav-item"><a href="departments.php" class="nav-link text-light active">Departments Table</a></li>
        <li class="nav-item"><a href="payroll.php" class="nav-link text-light">Payroll Table</a></li>
        <li class="nav-item"><a href="addemployee.php" class="nav-link text-light active btn btn-success">Add Employee</a></li>
      </ul>
    </nav>

    <?php
    include 'database.php';

    // Determine sorting order
    $sort = isset($_GET['sort']) ? $_GET['sort'] : 'DepartmentID';
    $order = isset($_GET['order']) && $_GET['order'] == 'asc' ? 'desc' : 'asc';

    // SQL query to get departments with employees
    $sql = "SELECT d.DepartmentID, d.ManagerID, d.DepartmentName, e.FirstName, e.LastName 
            FROM departments d 
            LEFT JOIN employees e ON d.DepartmentID = e.DepartmentID 
            ORDER BY $sort $order";
    $result = mysqli_query($conn, $sql);

    if ($result && mysqli_num_rows($result) > 0) {
        echo "<table class='table table-dark table-striped mt-4'>";
        echo "<thead>";
        echo "<tr>";
        echo "<th><a href='?sort=DepartmentID&order=$order' class='text-light'>Department ID</a></th>";
        echo "<th><a href='?sort=ManagerID&order=$order' class='text-light'>Manager ID</a></th>";
        echo "<th><a href='?sort=DepartmentName&order=$order' class='text-light'>Department Name</a></th>";
        echo "<th>Employees</th>";
        echo "</tr>";
        echo "</thead>";
        echo "<tbody>";

        $currentDepartment = null;
        while ($row = mysqli_fetch_assoc($result)) {
            // Group rows by DepartmentID and show only one row per department with employees listed under it
            if ($currentDepartment != $row['DepartmentID']) {
                if ($currentDepartment !== null) {
                    echo "</ul></td></tr>";
                }
                echo "<tr>";
                echo "<td>" . htmlspecialchars($row['DepartmentID']) . "</td>";
                echo "<td>" . htmlspecialchars($row['ManagerID']) . "</td>";
                echo "<td>" . htmlspecialchars($row['DepartmentName']) . "</td>";
                echo "<td><ul>";
                $currentDepartment = $row['DepartmentID'];
            }
            // List employees in each department
            if ($row['FirstName'] && $row['LastName']) {
                echo "<li>" . htmlspecialchars($row['FirstName']) . " " . htmlspecialchars($row['LastName']) . "</li>";
            }
        }

        // Closing the last department's row
        echo "</ul></td></tr>";

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
