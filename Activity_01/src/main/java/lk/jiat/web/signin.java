package lk.jiat.web;

import lk.jiat.web.db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "signin", urlPatterns = "/signin")
public class signin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String adminMail = "admin@gmail.com";
        String adminPassword = "abc";
        Connection connection = null;
        Statement statement = null;

        if (email.equals(adminMail) && password.equals(adminPassword)) {
            req.getSession().setAttribute("admin", adminMail);
            resp.sendRedirect("Home.jsp");
        } else {
            try {
                connection = DBConnection.getConnection();
                String query = "SELECT * FROM `users` WHERE `email`='" + email + "' AND `password`='" + password + "'";
                statement = connection.createStatement();
                ResultSet rs = statement.executeQuery(query);
                if (rs.next()) {
                    req.getSession().setAttribute("user", rs.getString("name"));
                    resp.sendRedirect("Home.jsp");
                } else {
                    resp.sendRedirect("Signin.jsp");
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
        }


    }
}
