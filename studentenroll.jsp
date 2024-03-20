<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% HttpSession session1 = request.getSession(false); %>
<%
    if (session1 == null || session1.getAttribute("email") == null) {
        response.sendRedirect("stud_login.html"); // Redirect to the login page
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Course</title>
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

        .form-select {
            width: 25%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
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
            <form action="EnrollServlet" method="post">
        <h2>Select course</h2>
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
            %>
            <select name="selectedExam" class="form-select mb-3">
                <option value=""   id="examName" name="examName">Select  Course</option>
                <%
                    while (rs.next()) {
                        String examName = rs.getString("examName");
                %>
                
                <option value="<%= examName %>"><%= examName %></option>
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
                %>
            </select>
            
            <!-- Submit button to start the exam -->
            <button type="submit" class="btn btn-primary">Submit</button>
            </form>
    </div>

    <!-- Include Bootstrap JavaScript (Optional, if needed) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
