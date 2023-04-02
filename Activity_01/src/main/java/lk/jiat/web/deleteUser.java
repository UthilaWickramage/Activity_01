package lk.jiat.web;

import lk.jiat.web.db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

@WebServlet(name = "deleteUser", urlPatterns = "/deleteUser")
public class deleteUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String id = req.getParameter("id");

        Connection connection = null;
        Statement statement = null;

        try {
            connection = DBConnection.getConnection();
            String query = "DELETE FROM `users` WHERE `id`='" + id + "'";
            statement = connection.createStatement();
            int success = statement.executeUpdate(query);
            if (success > 0)
                resp.getWriter().write("Successfully deleted");
            resp.getWriter().write("<br>");
            resp.getWriter().write("<a class='btn btn-primary' href='Home.jsp'>Go Back</a>");

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
