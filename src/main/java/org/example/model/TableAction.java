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

    public void createTable(String tableName, List <String> columns){
        executeSQL("CREATE TABLE" + tableName + "{ " + tableName +"id INTEGER PRIMARY KEY" + columns + " }");
    }

    public void readTable(String tableName){
        executeSQL("SELECT * FROM" + tableName);
    }

    public void updateTable(String tableName, List <String> updatedColumns){
    executeSQL("ALTER TABLE " + tableName);
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
