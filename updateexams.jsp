<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Exams</title>
    
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom background design */
        body {
            background-image: url('your-background-image.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        
        /* Add some padding to the form container */
        .container {
            padding: 30px;
            background-color: lightgray; /* Semi-transparent white background */
            border-radius: 10px; /* Rounded corners */
        }
        
    </style>
</head>
<body>
     <% 
             response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
            
    if(session.getAttribute("email")==null)
    {
        response.sendRedirect("index.jsp");
    }
    %>
    <div class="container mt-5">
        <h2>Edit Exam</h2>
        <form action="UpdateServlet" method="post">
            <div class="mb-3">
                <label for="examName" class="form-label">Exam Name</label>
                <input type="text" class="form-control" id="examName" name="examName" placeholder="Enter Exam Name">
            </div>
            <div class="mb-3">
                <label for="examType" class="form-label">Exam Type</label>
                                <input type="text" class="form-control" id="examType" name="examType" placeholder="Enter Exam Type">

               
            </div>
            <div class="mb-3">
                <label for="examDate" class="form-label">Exam Date</label>
                <input type="date" class="form-control" id="examDate" name="examDate">
            </div>
            <div class="mb-3">
                <label for="examDuration" class="form-label">Exam Duration (in minutes)</label>
                <input type="number" class="form-control" id="examDuration" name="examDuration" placeholder="Enter Exam Duration">
            </div>
            <div class="mb-3">
                <label for="examTrainer" class="form-label">Exam Trainer</label>
                <input type="text" class="form-control" id="examTrainer" name="examTrainer" placeholder="Enter Exam Trainer">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Include Bootstrap JavaScript (Optional, if needed) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>