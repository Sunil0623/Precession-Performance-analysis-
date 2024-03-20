<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<meta http-equiv="refresh" content="0;URL='registration.jsp'">
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String dob = request.getParameter("dob");
    String phonenumber = request.getParameter("phonenumber");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String PASSWORD = request.getParameter("password"); // Change to "password"
    String cpassword = request.getParameter("cpassword");

// Initialize error variables
    String passwordError = "";
    String phnoError = "";

// Perform database insertion here
    if (!PASSWORD.equals(cpassword)) {
        passwordError = "Passwords do not match";
    } else if (phonenumber.length() != 10) {
        phnoError = "Phone number must be 10 digits";
    } else {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PORTAL", "root", "root");
            String query = "INSERT INTO student_login (fname, lname, dob, phonenumber, email, address, PASSWORD, cpassword) VALUES ( ?, ?, ?, ?, ?, ?,?,?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setString(3, dob);
            pst.setString(4, phonenumber);
            pst.setString(5, email);
            pst.setString(6, address);
            pst.setString(7, PASSWORD);
            pst.setString(8, cpassword);

            int i = pst.executeUpdate();
            if (i > 0) {
                response.sendRedirect("student_login.jsp");
            } else {
                out.println("Registration Failed");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }

%>
<script>
    alert("Password/phone number is invalid ");
</script>