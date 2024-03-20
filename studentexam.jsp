<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% HttpSession session1 = request.getSession(false); %>
<%
if (session1 == null || session1.getAttribute("email") == null) {
    response.sendRedirect("stud_login.jsp"); // Redirect to the login page
}
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam Details</title>
    <link rel="icon" type="x-icon" href="fav.png">
    
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
        }

        .container mt-5{
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Exam Details</h2>
        <%
            String userEmail = (String) session.getAttribute("email");
            java.sql.Connection conn = null;
            java.sql.PreparedStatement pstmt = null;
            java.sql.ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/PORTAL", "root", "root");
                
                // Retrieve the course the user has already selected
                String query = "SELECT DISTINCT examName FROM enroll WHERE email = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, userEmail);
                rs = pstmt.executeQuery();
                
                if (rs.next()) {
                    String selectedExam = rs.getString("examName");
                    // Fetch and display exam details for the selected course
                    String examName = selectedExam; // You can customize this part based on your database structure
                    
                    String examType = "";
                    String examDate = "";
                    int examDuration = 0;
                    String examTrainer = "";

                    // Retrieve exam details from the 'add_exam' table
                    query = "SELECT * FROM add_exam WHERE examName = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, selectedExam);
                    rs = pstmt.executeQuery();
                    
                    if (rs.next()) {
                        examName = rs.getString("examName");
                        examType = rs.getString("examType");
                        examDate = rs.getString("examDate");
                        examDuration = rs.getInt("examDuration");
                        examTrainer = rs.getString("examTrainer");
                    }
        %>
        <table class="table">
            <tr>
                <th>Exam Name</th>
                <td><%= examName %></td>
            </tr>
            <tr>
                <th>Exam Type</th>
                <td><%= examType %></td>
            </tr>
            <tr>
                <th>Exam Date</th>
                <td><%= examDate %></td>
            </tr>
            <tr>
                <th>Exam Duration</th>
                <td><%= examDuration %> minutes</td>
            </tr>
            <tr>
                <th>Exam Trainer</th>
                <td><%= examTrainer %></td>
            </tr>
        </table>
        
        <!-- Start Exam button with a link to the exam page -->
        <a href="displayquestions.jsp?selectedExam=<%= examName %>" class="btn btn-primary">Start Exam</a>
        
        <%
                } else {
                    out.println("No course selected for the user.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close the database resources
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        %>
        <!-- Back button to go back to the course selection page -->
        <a href="studentdashboard.jsp" class="btn btn-primary">Back</a>
    </div>

    <!-- Include Bootstrap JavaScript (Optional, if needed) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
