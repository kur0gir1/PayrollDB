<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Employees Table</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="container-fluid bg-dark text-white">
  <div class="container mt-5 bg-dark text-light p-4">
    <h1 class="text-center">Employees Table</h1>

    <nav class="navbar navbar-expand-lg navbar-dark bg-black justify-content-center">
      <ul class="navbar-nav">
        <li class="nav-item"><a href="index.php" class="nav-link text-light active">Employees Table</a></li>
        <li class="nav-item"><a href="departments.php" class="nav-link text-light">Departments Table</a></li>
        <li class="nav-item"><a href="payroll.php" class="nav-link text-light">Payroll Table</a></li>
        <li class="nav-item"><a href="addemployee.php" class="nav-link text-light active btn btn-success">Add Employees</a></li>
      </ul>
    </nav>

    <?php
    session_start();
    include 'database.php';

    // Determine sorting order
    $sort = isset($_GET['sort']) ? $_GET['sort'] : 'EmployeeID';
    $order = isset($_GET['order']) && $_GET['order'] == 'asc' ? 'desc' : 'asc';

    // Adjust the SQL query to include sorting
    $sql = "SELECT * FROM employees ORDER BY $sort $order";
    $result = mysqli_query($conn, $sql); 

    if ($result && mysqli_num_rows($result) > 0) {
        echo "<table class='table table-dark table-striped mt-4'>";
        echo "<thead>";
        echo "<tr>";
        echo "<th><a href='?sort=EmployeeID&order=$order' class='text-light'>Employee ID</a></th>";
        echo "<th><a href='?sort=DepartmentID&order=$order' class='text-light'>Department ID</a></th>";
        echo "<th><a href='?sort=ManagerID&order=$order' class='text-light'>Manager ID</a></th>";
        echo "<th><a href='?sort=FirstName&order=$order' class='text-light'>First Name</a></th>";
        echo "<th><a href='?sort=LastName&order=$order' class='text-light'>Last Name</a></th>";
        echo "<th><a href='?sort=Email&order=$order' class='text-light'>Email</a></th>"; 
        echo "<th><a href='?sort=PhoneNumber&order=$order' class='text-light'>Contact Number</a></th>"; 
        echo "<th><a href='?sort=JobTitle&order=$order' class='text-light'>Job Title</a></th>"; 
        echo "<th>Actions</th>";
        echo "</tr>";
        echo "</thead>";
        echo "<tbody>";

        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['EmployeeID']) . "</td>";
            echo "<td>" . htmlspecialchars($row['DepartmentID']) . "</td>";
            echo "<td>" . htmlspecialchars($row['ManagerID']) . "</td>";
            echo "<td>" . htmlspecialchars($row['FirstName']) . "</td>";
            echo "<td>" . htmlspecialchars($row['LastName']) . "</td>";
            echo "<td>" . htmlspecialchars($row['Email']) . "</td>";
            echo "<td>" . htmlspecialchars($row['PhoneNumber']) . "</td>";
            echo "<td>" . htmlspecialchars($row['JobTitle']) . "</td>";
            echo "<td>
                    <a href='edit.php?employeeID=" . htmlspecialchars($row['EmployeeID']) . "' class='btn btn-warning btn-sm'>Edit</a>
                    <a href='delete.php?id=" . htmlspecialchars($row['EmployeeID']) . "' class='btn btn-danger btn-sm' onclick='return confirm(\"Are you sure you want to delete this record?\");'>Delete</a>
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
