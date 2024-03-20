<%-- 
    Document   : registration
    Created on : 5 Oct, 2023, 11:53:05 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="icon" type="x-icon" href="fav.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #d1d1d1;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 5px;
        }

        .error-message {
            color: #dc3545;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">Sign Up</h2>
    <form action="register.jsp" method="POST" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="fname">First Name</label>
            <input type="text" id="fname" name="fname" class="form-control" placeholder="First Name" required>
        </div>
        <div class="form-group">
            <label for="lname">Last Name</label>
            <input type="text" id="lname" name="lname" class="form-control" placeholder="Last Name" required>
        </div>
        <div class="form-group">
            <label for="dob">Date of Birth</label>
            <input type="date" id="dob" name="dob" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="phonenumber">Phone Number</label>
            <input type="text" id="phonenumber" name="phonenumber" class="form-control" placeholder="Phone Number" required>
            <p class="error-message" id="phnoError"></p>
        </div>
        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" class="form-control" placeholder="Email Address" required>
        </div>
        <div class="form-group">
            <label for="address">Permanent Address</label>
            <input type="text" id="address" name="address" class="form-control" placeholder="Permanent Address" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
        </div>
        <div class="form-group">
            <label for="cpassword">Confirm Password</label>
            <input type="password" id="cpassword" name="cpassword" class="form-control" placeholder="Confirm Password" required>
            <p class="error-message" id="passwordError"></p>
        </div>
        <div class="text-center"> <!-- Center the button -->
            <button type="submit" value="submit" id="submit" name="submit" class="btn btn-primary">
                Register
            </button>
        </div>
    </form>
</div>

<script>
    function validateForm() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("cpassword").value;
        var phno = document.getElementById("phonenumber").value;

        var passwordError = document.getElementById("passwordError");
        var phnoError = document.getElementById("phnoError");

        if (password !== confirmPassword) {
            passwordError.innerHTML = "Passwords do not match";
            return false;
        } else {
            passwordError.innerHTML = "";
        }

        if (!/^\d{10}$/.test(phno)) {
            phnoError.innerHTML = "Phone number must be 10 digits";
            return false;
        } else {
            phnoError.innerHTML = "";
        }

        return true;
    }
</script>

</body>
</html>

