<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculate Results</title>
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

        .mb-4 {
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
        }

        a {
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
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
        <h2>Results</h2>
        <%
            String selectedExam = request.getParameter("examName");
            int totalQuestions = Integer.parseInt(request.getParameter("totalQuestions"));
            int correctAnswers = 0;

            if (selectedExam != null && !selectedExam.isEmpty()) {
                // Retrieve and calculate results for the selected exam
                try {
                    java.sql.Connection conn = null;
                    java.sql.Statement stmt = null;
                    java.sql.ResultSet rs = null;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/PORTAL", "root", "root");
                    stmt = conn.createStatement();
                    
                    // Retrieve questions, correct answers, and user's answers for the selected exam from the 'add_quest' table
                    rs = stmt.executeQuery("SELECT questions, answerA, answerB, answerC, answerD, correctAnswer FROM add_quest WHERE examName = '" + selectedExam + "'");
                    int questionNumber = 0;
                    
                    while (rs.next()) {
                        questionNumber++;
                        String question = rs.getString("questions");
                        String optionA = rs.getString("answerA");
                        String optionB = rs.getString("answerB");
                        String optionC = rs.getString("answerC");
                        String optionD = rs.getString("answerD");
                        String correctAnswer = rs.getString("correctAnswer");

                        // Get the selected answer from the request
                        String selectedAnswer = request.getParameter("answer" + questionNumber);

                        // Check if the selected answer is correct
                        boolean isCorrect = selectedAnswer != null && selectedAnswer.equals(correctAnswer);
                        
                        if (isCorrect) {
                            correctAnswers++; // Increment correct answers count
                        }
        %>
        <div class="mb-4">
            <p><strong>Question <%= questionNumber %>:</strong> <%= question %></p>
            <p><strong>Options:</strong></p>
            <p>A) <%= optionA %></p>
            <p>B) <%= optionB %></p>
            <p>C) <%= optionC %></p>
            <p>D) <%= optionD %></p>
            <p><strong>Selected Answer:</strong> <%= selectedAnswer != null ? selectedAnswer : "Not answered" %></p>
            <p><strong>Result:</strong> <%= isCorrect ? "Correct" : "Incorrect" %></p>
        </div>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } 
            }
        %>
        <p>Exam Name: <%= selectedExam %></p>
        <p>Total Questions: <%= totalQuestions %></p>
        <p>Correct Answers: <%= correctAnswers %></p>
        <p>Score: <%= (correctAnswers * 100.0) / totalQuestions %> %</p>
        <p><a href="studentdashboard.jsp">Back</a></p>
    </div>

    <!-- Include Bootstrap JavaScript (Optional, if needed) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
