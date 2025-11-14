<?php
session_start();
include('db_config.php'); 

$error = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") { //Will only run when the login is submitted
    $username = trim($_POST['username']); //Gets the inserted username and password 
    $password = trim($_POST['password']);

    $stmt = $conn->prepare("SELECT * FROM WebAppPermissions WHERE Username = ?");
    $stmt->bind_param("s", $username); //Use paramters to prevent SQL injection
    $stmt->execute();
    $result = $stmt->get_result(); //Grabs all of the user info from the database and stores it in result

    if ($row = $result->fetch_assoc()) { 
        if (password_verify($password, $row['Password_Hash'])) {
            $_SESSION['username'] = $row['Username'];
            header("Location: index.php"); // redirect to main page
            exit();
        } else {
            $error = "Invalid password.";
        }
    } else {
        $error = "No user found with that username.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f7f7f7;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .login-container {
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      width: 300px;
      text-align: center;
    }
    input {
      width: 90%;
      padding: 8px;
      margin: 8px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    button {
      width: 95%;
      padding: 10px;
      background-color: #007bff;
      border: none;
      color: white;
      border-radius: 5px;
      cursor: pointer;
    }
    button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <h2>Car Rental Database Login</h2>
    <form method="POST" action="">
      <input type="text" name="username" placeholder="Username" required><br>
      <input type="password" name="password" placeholder="Password" required><br>
      <button type="submit">Login</button>
    </form>
    <?php if ($error): ?>
      <p class="error"><?= htmlspecialchars($error) ?></p>
    <?php endif; ?>
  </div>
</body>
</html>
