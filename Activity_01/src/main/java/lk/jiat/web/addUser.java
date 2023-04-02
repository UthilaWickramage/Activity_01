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

@WebServlet(name = "addUser", urlPatterns = "/addUser")
public class addUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String name = req.getParameter("name");
        String mobile = req.getParameter("mobile");
        String email = req.getParameter("email");
        String city = req.getParameter("city");
        String password = req.getParameter("password");
        Connection connection = null;
        Statement statement = null;

        try {
            connection = DBConnection.getConnection();
            statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM `users` WHERE `email`='" + email + "'");
            if (!rs.next()) {
                int success = statement.executeUpdate("INSERT INTO `users` (`name`,`mobile`,`email`,`city`,`password`) VALUES ('" + name + "','" + mobile + "','" + email + "','" + city + "','" + password + "')");
                resp.sendRedirect("Home.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

    }
}
