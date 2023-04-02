<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="lk.jiat.web.db.DBConnection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Uthila Wickramage
  Date: 3/31/2023
  Time: 1:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    if (session.getAttribute("admin") == null && session.getAttribute("user") == null) {
        response.sendRedirect("Signin.jsp");
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="row bg-dark">
    <div class="col-2 offset-10  p-3">
        <form action="signout" method="get">
            <input type="submit" value="Sign Out" class="btn btn-light">
        </form>
    </div>
</div>
<%
    if (session.getAttribute("admin") != null) {
%>
<div class="row">
    <div class="col-4">
        <h2>Add a User</h2>
        <form action="addUser" method="post">
            <div class="mb-3">
                <label class="form-label">Full Name:</label>
                <input type="text" class="form-control" name="name">
            </div>
            <div class="mb-3">
                <label class="form-label">Mobile No:</label>
                <input type="text" class="form-control" name="mobile">
            </div>
            <div class="mb-3">
                <label class="form-label">Email:</label>
                <input type="text" class="form-control" name="email">
            </div>
            <div class="mb-3">
                <label class="form-label">City:</label>
                <input type="text" class="form-control" name="city">
            </div>
            <div class="mb-3">
                <label class="form-label">Password:</label>
                <input type="text" class="form-control" name="password">
            </div>
            <div>
                <input type="submit" class="btn btn-primary" value="Add User">
            </div>
        </form>
    </div>
<
    <div class="col-7 pt-5 ps-5">

        <table class="table table-bordered">
            <tr>

                <th>Full Name</th>
                <th>Mobile No</th>
                <th>Email</th>
                <th>City</th>
                <th>Action</th>
                <th>Action</th>
            </tr>
            <%
                Connection connection = null;
                Statement statement = null;
                ServletContext context = request.getServletContext();

                try {
                    connection = DBConnection.getConnection();
                    String query = "SELECT * FROM `users`";
                    statement = connection.createStatement();
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
            %>
            <form action="deleteUser" method="post">
                <tr>
                    <input type="hidden" value="<%=rs.getString("id")%>" name="id"/>
                    <td><%=rs.getString("name")%>
                    </td>
                    <td><%=rs.getString("mobile")%>
                    </td>
                    <td><%=rs.getString("email")%>
                    </td>
                    <td><%=rs.getString("city")%>
                    </td>
                    <td><input type="submit" class="btn btn-danger" value="Delete"/></td>
                    <td><input type="submit" class="btn btn-success" value="Update"/></td>
                </tr>
            </form>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (connection != null)
                            connection.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

            %>
            <tr>

            </tr>
        </table>
    </div>
</div>

<%
} else {
%>
<div class="row">
    <div class="col-4 offset-4 mt-3">
        <h1>Welcome <%=session.getAttribute("user")%>!</h1>
    </div>
</div>

<%
    }
%>


</body>
</html>
