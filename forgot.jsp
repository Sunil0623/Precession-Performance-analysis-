<%-- 
    Document   : forgot
    Created on : 5 Oct, 2023, 11:51:13 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="x-icon" href="fav.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <title>Password Reset</title>
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
</head>
<body>
    <section class="vh-100">
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp" class="img-fluid" alt="Sample image">
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    <form action="PasswordResetServlet" method="post"  >
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input type="email" id="email" name="email" class="form-control form-control-lg" placeholder="Enter a valid email address" />
                            <label class="form-label" for="email">Email address</label>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-3">
                            <input type="password" id="password" name="password" class="form-control form-control-lg" placeholder="Enter password" />
                            <label class="form-label" for="password">New Password</label>
                        </div>

                        <div class="form-outline mb-3">
                            <input type="password" id="cpassword" name="cpassword" class="form-control form-control-lg" placeholder="Confirm password" />
                            <label class="form-label" for="cpassword">Confirm Password</label>
                        </div>
                        <p id="error_password" style="color: red; display: none;">Passwords do not match.</p>

                        <div class="form-outline mb-3">
                            <input type="text" id="otp" name="otp" class="form-control form-control-lg" placeholder="Enter OTP" />
                            <label class="form-label" for="otp">Enter OTP</label>
                        </div>
                        <div class="text-center text-lg-start mt-4 pt-2">
                            <button class="btn btn-primary btn-lg" id="sendotp" name="sendotp" type="button"> Send OTP</button><p id="result"></p>
                        </div>

                        <div class="text-center text-lg-start mt-4 pt-2">
                            <button class="btn btn-primary btn-lg" id="submit" name="submit" type="submit"> Submit</button>
                        </div>
                        <div class="text-center text-lg-start mt-4 pt-2">
                            <a href="student_login.jsp" style="text-decoration:none;"><i class="fas  fa-chevron-left " >Back</i></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
            <!-- Copyright -->
            <div class="text-white mb-3 mb-md-0">
                Copyright © 2020. All rights reserved.
            </div>
            <!-- Copyright -->

            <!-- Right -->
        </div>
    </section>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#sendotp").click(function () {
                var email = $("#email").val();

                $.ajax({
                    type: "POST",
                    url: "sendotp", // The JSP page that will handle the email sending logic
                    data: {email: email},
                    success: function (response) {
                        $("#result").html(response); // Display the response from the server
                    },
                    error: function (xhr, status, error) {
                        console.error(error); // Handle any errors
                    }
                });
            });
        });
    </script>

    <script>
        const password = document.querySelector("#password");
        const cpassword = document.querySelector("#cpassword");
        const error_password = document.querySelector("#error_password");

        function passwordCheck() {
            if (password.value === cpassword.value) {
                error_password.style.display = "none"; // Hide error message
            } else {
                error_password.style.display = "block"; // Show error message
            }
        }

        // Add event listeners to the input fields
        password.addEventListener("input", passwordCheck);
        cpassword.addEventListener("input", passwordCheck);
    </script>
</body>
</html>