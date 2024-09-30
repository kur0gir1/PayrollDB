<?php
session_start();
include 'database.php'; // Include your database connection file

$errors = array(); // Initialize an array to hold errors

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect form data
    $loginIdentifier = $_POST["loginIdentifier"] ?? ''; // Username or Email
    $password = $_POST["password"] ?? ''; // Password

    // Check for empty fields
    if (empty($loginIdentifier) || empty($password)) {
        array_push($errors, "Email or Username and Password are required");
    }

    if (count($errors) == 0) {
        // Prepare SQL statement to check user credentials
        $sql = "SELECT * FROM users WHERE email = ? OR username = ?";
        $stmt = mysqli_stmt_init($conn);
        
        if (mysqli_stmt_prepare($stmt, $sql)) {
            mysqli_stmt_bind_param($stmt, "ss", $loginIdentifier, $loginIdentifier); // Bind the same variable for both email and username
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);

            // Check if user exists
            if (mysqli_num_rows($result) > 0) {
                $user = mysqli_fetch_assoc($result);

                // Verify password
                if (password_verify($password, $user['password'])) {
                    // If the password is correct, redirect to index.php
                    $_SESSION['user_id'] = $user['id']; // Store user ID in session
                    header("Location: index.php");
                    exit();
                } else {
                    array_push($errors, "Incorrect password");
                }
            } else {
                array_push($errors, "You are not registered yet");
            }
        } else {
            array_push($errors, "Database error");
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <title>Login</title>
</head>
<body class="bg-black fade-out">
<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="row border rounded-5 p-3 bg-white shadow box-area">

        <!-- BlackForge Labs Section -->
        <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box" style="background: #06031f;">
            <p class="text-white fs-2" style="font-family: 'Courier New', Courier, monospace; font-weight: 600;">BlackForge Labs</p>
            <small class="text-white text-wrap text-center" style="width: 17rem; font-family: 'Courier New', Courier, monospace;">
                Forging the Future of Blockchain Innovation!
            </small>
        </div>

        <!-- Login Form Section -->
        <div class="col-md-6 right-box">
            <div class="row align-items-center">
                <div class="header-text mb-4">
                    <h2>Hello, Again</h2>
                    <p>We are happy to have you back.</p>
                </div>

                <form action="login.php" method="POST">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control form-control-lg bg-light fs-6" placeholder="Email Address or Username" name="loginIdentifier" required>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control form-control-lg bg-light fs-6" placeholder="Password" name="password" required id="password">
                    </div>
                    <div class="input-group mb-5 d-flex justify-content-between">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="formCheck" style="background-color: #06031f;">
                            <label for="formCheck" class="form-check-label" style="color: #06031f;"><small>Remember Me</small></label>
                        </div>
                        <div class="forgot">
                            <small><a href="#" style="color: #06031f;">Forgot Password?</a></small>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <button type="submit" class="btn btn-lg btn-primary w-100 fs-6 custom-btn">Login</button>
                    </div>
                    <div class="row">
                        <small>Don't have an account? <a href="register.php" style="color: #06031f;">Sign Up</a></small>
                    </div>
                </form>

                <!-- Display error messages -->
                <?php if (!empty($errors)): ?>
                    <div class="alert alert-danger">
                        <?php foreach ($errors as $error): ?>
                            <p><?php echo $error; ?></p>
                        <?php endforeach; ?>
                    </div>
                <?php endif; ?>
            </div>
        </div>

    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Add the fade-in effect when the page loads
        document.body.classList.add('fade-in'); // Set initial state to fade-in

        // Remove the fade-out class after page load to start fade-in animation
        setTimeout(function() {
            document.body.classList.remove('fade-out');
        }, 10); // Delay by 10ms to let the fade-in effect start after page load

        // Handle form submission
        const form = document.querySelector('form');
        form.addEventListener('submit', function (event) {
            event.preventDefault();  // Prevent default form submission

            document.body.classList.add('fade-out', 'active');  // Add fade-out class to body

            // Delay the actual form submission by 500ms (matching the CSS transition time)
            setTimeout(function () {
                form.submit();
            }, 500);
        });

        // Handle anchor links (like "Forgot Password?" or "Sign Up")
        const links = document.querySelectorAll('a');
        links.forEach(function (link) {
            link.addEventListener('click', function (event) {
                event.preventDefault();  // Prevent instant navigation

                const href = link.getAttribute('href');  // Get the target URL
                if (href) {
                    document.body.classList.add('fade-out', 'active');  // Add fade-out class to body

                    // Delay the actual page navigation by 500ms (matching the CSS transition time)
                    setTimeout(function () {
                        window.location.href = href;
                    }, 500);
                }
            });
        });
    });
</script>
</body>
</html>
