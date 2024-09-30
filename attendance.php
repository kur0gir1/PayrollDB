<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CRUD Tables</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
  <div class="container mt-5">
    <h1>CRUD Tables</h1>
    <div class="nav">
      <ul>
        <li><a href="index.php">Employees Table</a></li>
        <li><a href="payroll.php">Payroll Table</a></li>
        <li><a href="attendance.php">Attendance Table</a></li>
      </ul>
    </div>
  <?php
    session_start();
    include 'database.php';

    $sql = "SELECT * FROM attendance"; 
    $result = mysqli_query(mysql: $conn, query: $sql);

    if ($result && mysqli_num_rows($result) > 0) {
        echo "<table class='table table-striped'>";
        echo "<thead>";
        echo "<tr>";
        echo "<th>Attendance ID</th>";
        echo "<th>Employee ID</th>";
        echo "<th>Date</th>";
        echo "<th>Status</th>"; 
        echo "<th>Day</th>"; 
        echo "<th>Actions</th>";
        echo "</tr>";
        echo "</thead>";
        echo "<tbody>";

        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['AttendanceID']) . "</td>";
            echo "<td>" . htmlspecialchars($row['EmployeeID']) . "</td>";
            echo "<td>" . htmlspecialchars($row['AttendanceDate']) . "</td>";
            echo "<td>" . htmlspecialchars($row['Status']) . "</td>";
            echo "<td>" . htmlspecialchars($row['CreatedAt']) . "</td>";
            echo "<td>" . htmlspecialchars($row['Actions']) . "</td>";
            echo "<td>
                    <a href='edit.php?id=" . htmlspecialchars(string: $row['Actions']) . "' class='btn btn-warning'>Edit</a>
                    <a href='delete.php?id=" . htmlspecialchars(string: $row['Actions']) . "' class='btn btn-danger' onclick='return confirm(\"Are you sure you want to delete this record?\");'>Delete</a>
                  </td>";
            echo "</tr>";
        }

        echo "</tbody>";
        echo "</table>";
    } else {
        echo "<div class='alert alert-info'>No records found.</div>";
    }

    mysqli_close($conn);
  
  ?>
</div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
