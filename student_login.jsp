<%-- 
    Document   : student_login
    Created on : 5 Oct, 2023, 11:54:02 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <link rel="icon" type="x-icon" href="fav.png">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <title>Login Page</title>
    <style>
 .divider:after,
.divider:before {
content: "";
flex: 1;
height: 1px;
background: #eee;
}
.h-custom {
height: calc(100% - 73px);
}
@media (max-width: 450px) {
.h-custom {
height: 100%;
}
}
    </style>

<body>
<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
          class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
          <form action="stud_login.jsp " method="post">
       

          <!-- Email input -->
          <div class="form-outline mb-4">
            <input type="email" id="email" name="email" class="form-control form-control-lg"
              placeholder="Enter a valid email address" />
            <label class="form-label" for="email">Email address</label>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
            <input type="password" id="password" name="password" class="form-control form-control-lg"
              placeholder="Enter password" />
            <label class="form-label" for="password">Password</label>
          </div>

          <div class="d-flex justify-content-between align-items-center">
            <!-- Checkbox -->
           
            <a href="forgot.jsp" class="text-body">Forgot password?</a>
          </div>
          

          <div class="text-center text-lg-start mt-4 pt-2">
              <a href="studentdashboard.jsp"><button type="submit" class="btn btn-primary btn-lg"
                                                     style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button></a>
            <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="registration.jsp"
                class="link-danger">Register</a></p>
          </div>
 
          <div class="text-center text-lg-start mt-4 pt-2">
              <a href="index.jsp" style="text-decoration:none;"><i class="fas  fa-chevron-left " >Back</i></a>
              
           
          </div>
       

        </form>
      </div>
    </div>
  </div>
  <div
    class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
    <!-- Copyright -->
    <div class="text-white mb-3 mb-md-0">
      Copyright © 2023. All rights reserved.
    </div>
    <!-- Copyright -->

    <!-- Right -->
   
    <!-- Right -->
  </div>
</section>
    <!-- ... (your existing login page HTML) ... -->

<!-- ... (rest of your login page HTML) ... -->

</body>
</html>
