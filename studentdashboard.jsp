<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<% HttpSession session1 = request.getSession(false); %>
<%
    if (session1 == null || session1.getAttribute("email") == null) {
        response.sendRedirect("stud_login.html"); // Redirect to the login page
    }
%>
<html lang="en">
    <head>
        <title>Student Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="x-icon" href="fav.png">

        <!-- Add your CSS links here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <!-- Add other CSS links as needed -->
        <!-- Add your CSS links here -->
       
        <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">


        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />




        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"
              rel="stylesheet">



        <script src="assets/jquery-3.3.1.slim.min.js"></script>
        <script src="assets/popper.min.js"></script>
        <script src="assets/bootstrap.min.js"></script>
        <script src="assets/jquery-3.3.1.min.js"></script>
    </head>
    <body>
        <%-- Java code to retrieve the email parameter --%>
         <% 
             response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
            
    if(session.getAttribute("email")==null)
    {
        response.sendRedirect("index.jsp");
    }
    %>

        <div class="wrapper">
            <!-- Sidebar content -->
            <nav id="sidebar">
                <div class="sidebar-header" data-bind="true">
                    <h3>
                        <%
                            // Retrieve the first name and last name from the login process and display them
                            String fname = (String) session.getAttribute("fname");

                            if (fname!=null) {
                                out.print("Welcome<br>" + fname);
                             
                            } else {
                                // Handle the case when the first name or last name is not available in the session
                                out.print("Welcome, Guest");
// You can change this to a default value
                            }
                        %>
                    </h3>
                </div>
                <ul class="list-unstyled components">
                    
                    <li class="enroll">
                        <a href="studentenroll.jsp">
                            <i class="material-icons">school</i><span>Enroll</span></a>
                        
                    </li>
                    
                    <li class="dropdown">
                        <a href="#homeSubmenu1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                            <i class="material-icons">aspect_ratio</i><span>Exam</span></a>
                        <ul class="collapse list-unstyled menu" id="homeSubmenu1">
                            <li>
                                <a id="toggleExamsBtn" href="studentexam.jsp">View Exams</a>
                            </li>


                        </ul>
                    </li>
                    


                    <li class="active">
                        <a href="StuLogOut"><i class="material-icons">logout</i>Sign Out</a>
                    </li>
                </ul>
            </nav>

            <div id="content">
                <!-- Your top navigation bar content goes here -->
                <nav class="navbar navbar-expand-lg">
                    <div class="container-fluid">
                        <button type="button" id="sidebarCollapse" class="d-xl-block d-lg-block d-md-mone d-none">
                            <span class="material-icons">arrow_back_ios</span>
                        </button>
                        <a class="navbar-brand" href="#"><img src="cafeteria.png" alt="" style="height:2rem;"></a>
                        <button class="d-inline-block d-lg-none ml-auto more-button" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                                aria-label="Toggle navigation">
                            <span class="material-icons">more_vert</span>
                        </button>
                        <div class="collapse navbar-collapse d-lg-block d-xl-block d-sm-none d-md-none d-none"
                             id="navbarSupportedContent">
                            <ul class="nav navbar-nav ml-auto">

                                <a href="student_profile.jsp">
                                    <i class="fas fa-user-circle text-xl mr-2"></i>
                                    <span class="text-sm">Profile</span>
                                </a>

                                </li>

                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="main-content" style="width:100%;">
                    <div class="row">



                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header">
                                    <div class="icon icon-warning">
                                        <span class="material-icons">view_comfy_alt</span>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <p class="category"><strong>Total classes</strong></p>
                                    <h3 class="card-title">40</h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-info">info</i>
                                        <a href="details1.jsp">See detailed report</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header">
                                    <div class="icon icon-rose">
                                        <span class="material-icons">book</span>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <p class="category"><strong>Total Assignments</strong></p>
                                    <h3 class="card-title">05+</h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-info">info</i>
                                        <a href="details2.jsp">See detailed report</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header">
                                    <div class="icon icon-info">
                                        <span class="material-icons">follow_the_signs</span>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <p class="category"><strong>Projects</strong></p>
                                    <h3 class="card-title">5+</h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-info">info</i>
                                        <a href="details3.jsp">See detailed report</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row ">
                            <div id="dashboardContent">
                                <!-- Content will be dynamically populated here -->
                                <div class="col-lg-5 col-md-12">
                                    <div class="card" style="min-height: 485px">
                                        <div class="card-header card-header-text">
                                            <h4 class="card-title">Activities</h4>
                                        </div>
                                        <div class="card-content">
                                            <div class="streamline">
                                                <div class="sl-item sl-primary">
                                                    <div class="sl-content">
                                                        <small class="text-muted">5 mins ago</small>
                                                        <p>you have finished java Assignments</p>
                                                    </div>
                                                </div>
                                                <div class="sl-item sl-danger">
                                                    <div class="sl-content">
                                                        <small class="text-muted">25 mins ago</small>
                                                        <p>you has sent a request for update to the project Activities</p>
                                                    </div>
                                                </div>
                                                <div class="sl-item sl-success">
                                                    <div class="sl-content">
                                                        <small class="text-muted">40 mins ago</small>
                                                        <p>Kate added you to her team</p>
                                                    </div>
                                                </div>
                                                <div class="sl-item">
                                                    <div class="sl-content">
                                                        <small class="text-muted">45 minutes ago</small>
                                                        <p>you have finished your class</p>
                                                    </div>
                                                </div>
                                                <div class="sl-item sl-warning">
                                                    <div class="sl-content">
                                                        <small class="text-muted">55 mins ago</small>
                                                        <p>Sir has shared a folder with you</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Other dashboard elements go here -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Exam Details Container (hidden initially) -->


        <script>
            $(document).ready(function () {
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').toggleClass('active');
                    $('#content').toggleClass('active');
                });

                $('.more-button,.body-overlay').on('click', function () {
                    $('#sidebar,.body-overlay').toggleClass('show-nav');
                });

                // Get references to the exam details container and start exam button

            });
        </script>
        
    </body>
</html>