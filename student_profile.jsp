<%-- 
    Document   : student_profile
    Created on : 5 Oct, 2023, 11:54:51 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/custom.css" type="text/css"/>

    <style>
        .container.mt-2 {
            border-radius: 4px;
            background-color: whitesmoke;
            margin-bottom: 20px;
            padding: 10px;
            box-shadow: 10px 10px 10px 10px rgba(0.5, 0.5, 0.5, 0.5);
        }

        .background {
            background-color: white;
        }

        .form-container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
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

        .btn-center {
            text-align: center;
        }
    </style>
</head>
<body class="background">
      <% 
             response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
            
    if(session.getAttribute("email")==null)
    {
        response.sendRedirect("index.jsp");
    }
    %>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="height: 3rem;">
    <a class="navbar-brand" href="#"><img src="cafeteria.png" style="height: 2rem;" alt="logo"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="studentdashboard.jsp">Home</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Edit Profile Form -->
<div class="container mt-4">
    <div class="form-container">
        <h2 class="text-center">Profile</h2>
        <form action="studentprofile.jsp" method="post">
            <div class="form-group">
                <label for="fName">First Name</label>
                <input type="text" class="form-control" id="fName" name="fname" placeholder="Enter your first name">
            </div>

            <div class="form-group">
                <label for="lName">Last Name</label>
                <input type="text" class="form-control" id="lname" name="lname" placeholder="Enter your last name">
            </div>

            <div class="form-group">
                <label for="dob">DOB</label>
                <input type="date" class="form-control" id="dob" name="dob">
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" class="form-control" placeholder="Email Address">
            </div>

            <div class="form-group">
                <label for="address">Permanent Address</label>
                <input type="text" id="address" name="address" class="form-control" placeholder="Enter your Address">
            </div>

            <div class="btn-center">
                <button type="submit" id="submit" name="submit" value="submit" class="btn btn-primary">Save Changes</button>
                <button type="submit" class="btn btn-primary"><a href="studentdashboard.jsp"
                                                                 style="color: white;text-decoration: none">Back</a>
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
