package org.example.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class TableAction {
    private final String url;
    private final String user;
    private final String password;

    public TableAction(String url, String user, String password) {
        this.url = url;
        this.user = user;
        this.password = password;
    }

    public void createTable(String tableName, List<String> columns) {
        StringBuilder sql = new StringBuilder();
        sql.append("CREATE TABLE ").append(tableName).append(" (");
        sql.append(tableName).append("_id INTEGER PRIMARY KEY");

        for (String column : columns) {
            sql.append(", ").append(column);
        }

        sql.append(")");
        executeSQL(sql.toString());
    }

    public void readTable(String tableName) {
        String sql = "SELECT * FROM " + tableName;
        executeSQL(sql);
    }

    public void updateTable(String tableName, List<String> updatedColumns) {
        // Exemple : ajouter une ou plusieurs colonnes
        for (String column : updatedColumns) {
            String sql = "ALTER TABLE " + tableName + " ADD COLUMN " + column;
            executeSQL(sql);
        }
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
