<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Add your meta tags, title, and CSS links here -->
    </head>
    <body>
        <%-- Include any necessary Java imports here --%>
        <%@ page import="java.io.*, java.sql.*" %>

        <%-- Retrieve form data from request parameters --%>
        <%
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String dob = request.getParameter("dob");
            String address = request.getParameter("address"); // You might want to handle file uploads differently
            String email = request.getParameter("email");

            // Update the user's profile in the database here
            // You should replace the database-related code with your own database logic
            try {
                // Establish a database connection (modify the database URL, username, and password)
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/PORTAL", "root", "root");

                // Create an SQL UPDATE statement to update the user's profile
                String updateSql = "UPDATE student_login SET fname=?, lname=?, dob=?, address=? WHERE email=?";

                // Prepare the statement and set parameters
                PreparedStatement preparedStatement = connection.prepareStatement(updateSql);
                preparedStatement.setString(1, fname);
                preparedStatement.setString(2, lname);
                preparedStatement.setString(3, dob);
                preparedStatement.setString(4, address);
                preparedStatement.setString(5, email); // Handle profile image separately if needed
                // Set the user_id parameter based on the user's ID (you need to retrieve it from somewhere)

                // Execute the UPDATE statement
                int rowsAffected = preparedStatement.executeUpdate();

                // Check if the UPDATE was successful
                if (rowsAffected > 0) {
                    response.sendRedirect("studentdashboard.jsp"); // Redirect to the dashboard after successful update
                }

                // Close the database connection and statement
                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <script>\
                    alert("Failed to Update");
        </script>
    </body>
</html>
