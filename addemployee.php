<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Employee</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="container-fluid bg-dark text-white">
  <div class="container mt-5 bg-dark text-light p-4 rounded">
    <h1 class="text-center">Add Employee</h1>

    <nav class="navbar navbar-expand-lg navbar-dark bg-black justify-content-center mb-4">
      <ul class="navbar-nav">
        <li class="nav-item"><a href="index.php" class="nav-link text-light">Employees Table</a></li>
        <li class="nav-item"><a href="departments.php" class="nav-link text-light">Departments Table</a></li>
        <li class="nav-item"><a href="payroll.php" class="nav-link text-light">Payroll Table</a></li>
        <li class="nav-item"><a href="addemployee.php" class="nav-link text-light active btn btn-success">Add Employees</a></li>
      </ul>
    </nav>

    <?php
    session_start();
    include 'database.php';

    // Handle form submission
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Fetch department details based on the selected department
        $departmentID = $_POST['department'];
        $sql = "SELECT ManagerID FROM departments WHERE DepartmentID = '$departmentID'";
        $result = mysqli_query($conn, $sql);
        $department = mysqli_fetch_assoc($result);
        
        // Check if department exists
        if (!$department) {
            echo "<div class='alert alert-danger mt-4'>Selected department does not exist.</div>";
            exit;
        }

        $managerID = $department['ManagerID']; // Retrieve ManagerID

        // Insert employee data
        $firstName = mysqli_real_escape_string($conn, $_POST['first_name']);
        $lastName = mysqli_real_escape_string($conn, $_POST['last_name']);
        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $phoneNumber = mysqli_real_escape_string($conn, $_POST['phone_number']);
        $jobTitle = mysqli_real_escape_string($conn, $_POST['job_title']);
        $grossPay = mysqli_real_escape_string($conn, $_POST['salary']); // Use the salary input as GrossPay

        // Insert into employees table
        $sql = "INSERT INTO employees (DepartmentID, ManagerID, FirstName, LastName, Email, PhoneNumber, JobTitle)
                VALUES ('$departmentID', '$managerID', '$firstName', '$lastName', '$email', '$phoneNumber', '$jobTitle')";

        if (mysqli_query($conn, $sql)) {
            // Get the last inserted EmployeeID
            $employeeID = mysqli_insert_id($conn); // Retrieve the auto-incremented EmployeeID

            // Insert into payroll table with the same EmployeeID
            $sqlPayroll = "INSERT INTO payroll (EmployeeID, FirstName, LastName, GrossPay) 
                    VALUES ('$employeeID', '$firstName', '$lastName', '$grossPay')";

            if (mysqli_query($conn, $sqlPayroll)) {
                echo "<div class='alert alert-success mt-4'>Employee and payroll added successfully!</div>";
            } else {
                echo "<div class='alert alert-danger mt-4'>Error adding to payroll: " . mysqli_error($conn) . "</div>";
            }
        } else {
            echo "<div class='alert alert-danger mt-4'>Error adding employee: " . mysqli_error($conn) . "</div>";
        }

        mysqli_close($conn);
    }
    ?>

    <!-- Form to add employee -->
    <form action="addemployee.php" method="post" class="mt-4">
      <div class="row">
        <div class="col-md-6 mb-3">
          <label for="first_name">First Name:</label>
          <input type="text" name="first_name" id="first_name" class="form-control bg-light border border-secondary" required>
        </div>
        <div class="col-md-6 mb-3">
          <label for="last_name">Last Name:</label>
          <input type="text" name="last_name" id="last_name" class="form-control bg-light border border-secondary" required>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 mb-3">
          <label for="email">Email:</label>
          <input type="email" name="email" id="email" class="form-control bg-light border border-secondary" required>
        </div>
        <div class="col-md-6 mb-3">
          <label for="phone_number">Phone Number:</label>
          <input type="text" name="phone_number" id="phone_number" class="form-control bg-light border border-secondary" required>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 mb-3">
          <label for="job_title">Job Title:</label>
          <input type="text" name="job_title" id="job_title" class="form-control bg-light border border-secondary" required>
        </div>
        <div class="col-md-6 mb-3">
          <label for="salary">Salary:</label>
          <select name="salary" id="salary" class="form-control bg-light border border-secondary" required>
            <option value="">Select Salary</option>
            <?php
            for ($i = 5000; $i <= 100000; $i += 500) {
                echo "<option value='$i'>$" . number_format($i) . "</option>";
            }
            ?>
          </select>
        </div>
      </div>
      <div class="form-group mt-3">
        <label for="department">Department:</label>
        <select name="department" id="department" class="form-control bg-light border border-secondary" required>
          <option value="">Select a Department</option>
          <?php
          // Fetch all departments for the dropdown
          $sql = "SELECT DepartmentID, DepartmentName FROM departments";
          $result = mysqli_query($conn, $sql);
          while ($row = mysqli_fetch_assoc($result)) {
              echo "<option value='" . htmlspecialchars($row['DepartmentID']) . "'>" . htmlspecialchars($row['DepartmentName']) . "</option>";
          }
          ?>
        </select>
      </div>
      <button type="submit" class="btn btn-success mt-4">Add Employee</button>
    </form>

  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
