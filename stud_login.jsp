<%@page import="com.sun.faces.context.SessionMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");


    try {
        // Establish a database connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PORTAL", "root", "root");

        // Prepare the SQL query to select both fname and lname
        String query = "SELECT fname, lname FROM student_login WHERE email = ? AND PASSWORD = ?";
        PreparedStatement pst = conn.prepareStatement(query);
        pst.setString(1, email);
        pst.setString(2, password);

        // Execute the query
        ResultSet resultSet = pst.executeQuery();

        if (resultSet.next()) {
            // Retrieve the first name (fname) and last name (lname) from the result set
            String firstName = resultSet.getString("fname");

            // Store the email in the session (for other purposes)
            session.setAttribute("email", email);

                       session.setAttribute("fname", firstName);
            

            // Redirect to the dashboard or authorized page upon successful login
            response.sendRedirect("studentdashboard.jsp");
            
        } else {
            // Handle invalid login
            response.sendRedirect("stud_login.jsp");
        }

        resultSet.close();
        pst.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle the SQL exception
    } catch (Exception e) {
        e.printStackTrace();
        // Handle other exceptions
    }
    
%>