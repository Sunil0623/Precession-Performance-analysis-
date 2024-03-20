<%@ page import="java.sql.*" %>
<!DOCTYPE html>

    <html>
    <head>
        <title>questions List</title>
        <link rel="stylesheet" type="text/css" href="assets/css/newcss.css"> <!-- Link to an external CSS file -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link rel="icon" type="x-icon" href="fav.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </head>
    <style>
        /* Define CSS styles for the table */
          table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        /* Define styles for table header */
        th {
            background-color: #f2f2f2;
        }

        /* Define alternating row colors */
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Define hover effect on rows */
        tr:hover {
            background-color: #ddd;
        }

        /* Define styles for buttons */
        .btn {
            padding: 6px 12px;
            font-size: 14px;
            cursor: pointer;
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
            String sql="select * from add_quest order by examName asc";
            resultSet = statement.executeQuery(sql);
        }catch(Exception e){}
    %>
            <%
if (request.getParameter("delete") != null) {
    String courseIdToDelete = request.getParameter("questions");
    // Perform the deletion from the database using courseIdToDelete
    try {
        String deleteQuery = "DELETE FROM add_quest WHERE questions=?";
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
                <th>Exam Name</th>
                <th>Questions</th>
                <th>Answer A</th>
                <th>Answer B</th>
                <th>Answer C</th>
        	<th>Answer D</th>
  		<th>Correct Answer</th>
                <th>action</th>
                <!-- Add more columns as needed -->
            </tr>
        </thead>
        <tbody>
            <%
        int rowNum = 1;
        while (resultSet.next()) {
            String examName = resultSet.getString("examName"); // Assuming examId is the primary key
    %>
           <tr>
       <td><%= resultSet.getString("examName")%></td>
                <td><%= resultSet.getString("questions")%></td>
                <td><%= resultSet.getString("answerA")%></td>
                <td><%= resultSet.getString("answerB")%></td>
                <td><%= resultSet.getString("answerC")%></td>
		<td><%= resultSet.getString("answerD")%></td>
		<td><%= resultSet.getString("correctAnswer")%></td>
                <td>
            <form action="updatequestions.jsp" method="post" class="d-inline">
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
                         <input type="hidden" name="questions" value="<%= resultSet.getString("questions")%>">
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
