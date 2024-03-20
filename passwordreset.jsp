<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.Random" %>
<%@ page import="javax.mail.*, javax.mail.internet.*, java.util.Properties" %>

<%
// Check if the user has submitted the first section (send OTP)
    if (request.getParameter("sendotp") != null) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");

        // ... Your code to generate OTP ...
       
        String otp = request.getParameter("otp");
        // Generate OTP
        try {
            // Establish a database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PORTAL", "root", "root");
            conn.setAutoCommit(false);

            // Select query
            String selectQuery = "SELECT count(*) FROM student_login WHERE email = ?";
            PreparedStatement selectStatement = conn.prepareStatement(selectQuery);
            selectStatement.setString(1, email);

            ResultSet resultSet = selectStatement.executeQuery();

            if (resultSet.next()) {
                String name = resultSet.getString("name");

                // Update query
                String updateQuery = "UPDATE student_login SET password=?,cpassword=?,otp = ? WHERE email = ?";
                PreparedStatement updateStatement = conn.prepareStatement(updateQuery);
                updateStatement.setString(1, password);
                updateStatement.setString(2, cpassword);
                updateStatement.setString(3, otp);
                updateStatement.setString(4, email);

                int rowsUpdated = updateStatement.executeUpdate();

                if (rowsUpdated > 0) {
                   
                   out.println(" Password Updated");

                    } 
                } else {
                    out.println("Failed to update OTP.");
                }
              
            
            resultSet.close();
            
            selectStatement.close();
            
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the SQL exception
        } catch (Exception e) {
            e.printStackTrace();
            // Handle other exceptions
        }
    }
%>
