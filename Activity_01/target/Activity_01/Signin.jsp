<%--
  Created by IntelliJ IDEA.
  User: Uthila Wickramage
  Date: 4/2/2023
  Time: 8:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Signin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<%
    if (session.getAttribute("admin") != null || session.getAttribute("user") != null) {
        response.sendRedirect("Home.jsp");
    } else {
%>
<div class="row">
    <div class="col-4 offset-4 shadow p-3 mb-5 bg-body rounded mt-5 ">
        <h2>Sign In</h2>
        <form action="signin" method="post">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" name="email"
                       aria-describedby="emailHelp">
                <div id="emailHelp" class="form-text">For Admin, use your admin email instead.</div>
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" name="password">
            </div>

            <button type="submit" class="btn btn-primary">Sign In</button>
        </form>
    </div>
</div>
<%
    }
%>


</body>
</html>
