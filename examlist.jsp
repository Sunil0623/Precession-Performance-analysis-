<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Exam List</title>
        <link rel="stylesheet" type="text/css" href="assets/css/newcss.css"> 
        <link rel="icon" type="x-icon" href="fav.png"><!-- Link to an external CSS file -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            background-color: white;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn {
            padding: 6px 12px;
            font-size: 14px;
        }

        .btn-info {
            background-color: #007bff;
            color: #fff;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: #fff;
        }

        .btn i {
            margin-right: 5px;
        }

        .btn-group {
            display: inline-block;
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
       <%
        String jdbcUrl = "jdbc:mysql://localhost:3306/PORTAL";
        String dbUser = "root";
        String dbPassword = "root";
        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

        
    <%
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            statement = connection.createStatement();
            String sql="select * from add_exam order by examName asc";
            resultSet = statement.executeQuery(sql);
        }catch(Exception e){}
    %>
            <%
if (request.getParameter("delete") != null) {
    String courseIdToDelete = request.getParameter("examName");
    // Perform the deletion from the database using courseIdToDelete
    try {
        String deleteQuery = "DELETE FROM add_exam WHERE examName=?";
        PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
        preparedStatement.setString(1, courseIdToDelete);
        int rowsAffected = preparedStatement.executeUpdate();
        if (rowsAffected > 0) {
             
            response.setHeader("Refresh", "0;URL=?deleted");
        } else {
            
            // Deletion failed, you can display an error message if needed
        }
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle any database error
    }
}
%>
        <table>

            <thead>
                <tr>
                    <th style="color: white;">Exam Name</th>
                    <th style="color: white;">Exam Type</th>
                    <th style="color: white;">Exam Date</th>
                    <th style="color: white;">Exam Duration</th>
                    <th style="color: white;">Exam Trainer</th>
                    <th style="color: white;">Action</th>
                    
                    <!-- Add more columns as needed -->
                </tr>
            </thead>
           <tbody>
    <%
        int rowNum = 1;
        while (resultSet.next()) {
            String examName = resultSet.getString("examName"); 
    %>
    <tr>
        <td><%= resultSet.getString("examName")%></td>
        <td><%= resultSet.getString("examType")%></td>
        <td><%= resultSet.getString("examDate")%></td>
        <td><%= resultSet.getString("examDuration")%></td>
        <td><%= resultSet.getString("examTrainer")%></td>
        <td>
            <form action="updateexams.jsp" method="post" class="d-inline">
                       <input type="hidden" name="edit" value="<%= resultSet.getString("examName")%>">
                     <button
                         type="submit"
                         class="btn btn-info mr-3"
                         name="view"
                         value="View" >
                         <i class="fas fa-pen"></i>
                     </button>
                         </form>
                           <form action="" method="post" class="d-inline">
                         <input type="hidden" name="examName" value="<%= resultSet.getString("examName")%>">
                         <button
                             type="submit"
                             class="btn btn-secondary"
                             name="delete"
                             value="Delete">
                             <i class="far fa-trash-alt"></i>
                         </button>
                     </form>
        </td>
    </tr>
    <%
        rowNum++;
    }
    %>
</tbody>


        </table>


        
       
       

    </body>
</html>
