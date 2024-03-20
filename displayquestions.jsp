<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Take Exam</title>
    <link rel="icon" type="x-icon" href="fav.png">
    
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
        }

        .form-check-label {
            font-weight: normal;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
        
        .timer {
            font-size: 24px;
            color: #d9534f;
        }
    </style>
</head>
<body>
      <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Check if the user has already taken the exam based on their unique identifier (e.g., email)
    String userEmail = (String) session.getAttribute("email");
    String selectedExam = request.getParameter("selectedExam");

    // Send a GET request to the ExamServiceServlet to check if the user has taken the exam
    String examServiceURL = request.getContextPath() + "/ExamServiceServlet?userEmail=" + userEmail + "&selectedExam=" + selectedExam;
    String responseMessage = ""; // Initialize an empty response message

    // Use JavaScript to make an AJAX request to the servlet
%>

    <div class="container mt-5">
        <h2>Exam Questions</h2>
        <div class="timer" id="timer"></div> <!-- Display timer here -->
        <form action="calculateresult1.jsp" method="post" id="questionForm">
            <%
                // Database connection code
                java.sql.Connection conn = null;
                java.sql.Statement stmt = null;
                java.sql.ResultSet rs = null;
                int totalQuestions = 0; // Initialize total questions count

                if (selectedExam != null && !selectedExam.isEmpty()){
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/PORTAL", "root", "root");
                        stmt = conn.createStatement();
                      
                        // Retrieve questions for the selected exam from the 'add_quest' table
                        rs = stmt.executeQuery("SELECT questions, answerA, answerB, answerC, answerD, correctAnswer FROM add_quest WHERE examName = '" + selectedExam + "'");
        %>
        <!-- Hidden input for exam name -->
        <input type="hidden" name="examName" value="<%= selectedExam %>">
        <%
                        while (rs.next()) {
                            totalQuestions++; // Increment total questions count
                            String question = rs.getString("questions");
                            String optionA = rs.getString("answerA");
                            String optionB = rs.getString("answerB");
                            String optionC = rs.getString("answerC");
                            String optionD = rs.getString("answerD");
        %>
        <div class="mb-4 question" data-index="<%= totalQuestions %>">
            <p><strong>Question <%= totalQuestions %>:</strong> <%= question %></p>
            <label class="form-check-label">
                <input type="radio" class="form-check-input" name="answer<%= totalQuestions %>" value="A"> <%= optionA %>
            </label>
            <br>
            <label class="form-check-label">
                <input type="radio" class="form-check-input" name="answer<%= totalQuestions %>" value="B"> <%= optionB %>
            </label>
            <br>
            <label class="form-check-label">
                <input type="radio" class="form-check-input" name="answer<%= totalQuestions %>" value="C"> <%= optionC %>
            </label>
            <br>
            <label class="form-check-label">
                <input type="radio" class="form-check-input" name="answer<%= totalQuestions %>" value="D"> <%= optionD %>
            </label>
        </div>
        <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close the database resources
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                }
        %>
        <!-- Hidden input for total questions -->
        <input type="hidden" name="totalQuestions" value="<%= totalQuestions %>">
            
        <!-- Add "Next" and "Previous" buttons to navigate questions -->
        <button type="button" class="btn btn-primary" id="prevButton">Previous</button>
        <button type="button" class="btn btn-primary" id="nextButton">Next</button>
        <button type="submit" class="btn btn-primary" id="submitButton" style="display: none;">Submit Answers</button>
    </form>
</div>

<!-- Include Bootstrap JavaScript (Optional, if needed) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<!-- Countdown timer script -->
<script>
    // Set the countdown time in minutes
    var countdownTime = 900; // 15 minutes
    
    var timer = setInterval(function() {
        var minutes = Math.floor(countdownTime / 60);
        var seconds = countdownTime % 60;
        var timerDisplay = minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
        document.getElementById("timer").textContent = "Time Remaining: " + timerDisplay;
        
        if (countdownTime === 0) {
            clearInterval(timer);
            // Handle timeout, e.g., submit the form automatically
            document.forms[0].submit();
        } else {
            countdownTime--;
        }
    }, 1000); // Update every 1 second
</script>
<script>
    var currentQuestionIndex = 0;
    var questions = document.querySelectorAll(".question");
    var prevButton = document.getElementById("prevButton");
    var nextButton = document.getElementById("nextButton");
    var submitButton = document.getElementById("submitButton");

    // Initially, hide all questions except the first one
    for (var i = 1; i < questions.length; i++) {
        questions[i].style.display = "none";
    }

    prevButton.addEventListener("click", function() {
        if (currentQuestionIndex > 0) {
            questions[currentQuestionIndex].style.display = "none";
            currentQuestionIndex--;
            questions[currentQuestionIndex].style.display = "block";
            submitButton.style.display = "none"; // Hide the submit button when going back
        }
    });

    nextButton.addEventListener("click", function() {
        if (currentQuestionIndex < questions.length - 1) {
            questions[currentQuestionIndex].style.display = "none";
            currentQuestionIndex++;
            questions[currentQuestionIndex].style.display = "block";
        }
        
        // Display the submit button at the end
        if (currentQuestionIndex === questions.length - 1) {
            submitButton.style.display = "block";
        }
    });
</script>
<script>
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "<%= examServiceURL %>", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var responseMessage = xhr.responseText;
            if (responseMessage === "User has already taken the exam") {
                window.location.href = "examTakenAlready.jsp";
            }
        }
    };
    xhr.send();
</script>
</body>
</html>