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
    <div class="container mt-5">
        <h2>Edit Exam</h2>
        <form action="UpdateQuestionsServlet" method="post">
            <div class="mb-3">
                <label for="examName" class="form-label">Exam Name</label>
                <input type="text" class="form-control" id="examName" name="examName" placeholder="Enter Exam Name">
            </div>
            <div class="mb-3">
                <label for="questionText" class="form-label"> Question Text</label>
                                <input type="text" class="form-control" id="questions" name="questions" placeholder="Enter Questions">

               
            </div>
            <div class="mb-3">
                <label for="answerA" class="form-label">Answer A:</label>
                <input type="text" class="form-control" id="answerA" name="answerA">
            </div>
            <div class="mb-3">
                <label for="answerB" class="form-label">Answer B:</label>
                <input type="text" class="form-control" id="answerB" name="answerB">
            </div>
            <div class="mb-3">
                <label for="answerC" class="form-label">Answer C:</label>
                <input type="text" class="form-control" id="answerC" name="answerC">
            </div>
            <div class="mb-3">
                <label for="answerD" class="form-label">Answer D:</label>
                <input type="text" class="form-control" id="answerD" name="answerD">
            </div>
            <div class="mb-3">
                <label for="correctAnswer" class="form-label">Correct Answer:</label>
                <input type="text" class="form-control" id="correctAnswer" name="correctAnswer">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Include Bootstrap JavaScript (Optional, if needed) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>