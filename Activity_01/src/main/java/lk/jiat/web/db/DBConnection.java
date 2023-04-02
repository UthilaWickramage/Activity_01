package lk.jiat.web.db;

import lk.jiat.web.util.ApplicationProperties;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection connection;

    public static Connection getConnection() throws Exception {
        ApplicationProperties applicationProperties = ApplicationProperties.getInstance();
        Class.forName(applicationProperties.get("sql.connection.driver"));
        connection = DriverManager.getConnection(applicationProperties.get("sql.connection.url"),
                applicationProperties.get("sql.connection.username"), applicationProperties.get("sql.connection.password"));
        return connection;
    }


}
