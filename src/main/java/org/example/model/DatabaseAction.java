package org.example.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseAction {
    private final String url;
    private final String user;
    private final String password;

    public DatabaseAction(String url, String user, String password) {
        this.url = url;
        this.user = user;
        this.password = password;
    }

    public void createDatabase(String dbName) {
        executeSQL("CREATE DATABASE " + dbName);
    }

    public void dropDatabase(String dbName) {
        executeSQL("DROP DATABASE " + dbName);
    }

    private void executeSQL(String sql) {
        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement()) {

            stmt.executeUpdate(sql);
            System.out.println("Requête exécutée : " + sql);

        } catch (SQLException e) {
            System.err.println("Erreur SQL : " + e.getMessage());
        }
    }
}
