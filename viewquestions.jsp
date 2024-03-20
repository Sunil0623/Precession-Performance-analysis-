<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Questions</title>
    
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Select an Exam</h2>
        <form action="displayquestions.jsp" method="post">
            <!-- Retrieve the list of exams from the database -->
            <select name="selectedExam" class="form-select mb-3">
                <option value="" disabled selected>Select an Exam</option>
                <%
                    java.sql.Connection conn = null;
                    java.sql.Statement stmt = null;
                    java.sql.ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/PORTAL", "root", "root");
                        stmt = conn.createStatement();
                        
                        // Retrieve the list of exams from the 'add_exam' table
                        rs = stmt.executeQuery("SELECT examName FROM add_exam");
                        while (rs.next()) {
                            String examName = rs.getString("examName");
                %>
                <option value="<%= examName %>"><%= examName %></option>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close database connections here (not shown in your code)
                    }
                %>
            </select>
            <button type="submit" class="btn btn-primary">Select Exam</button>
        </form>
    </div>

    <!-- Include Bootstrap JavaScript (Optional, if needed) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>