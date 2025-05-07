package org.example.model;

import java.sql.*;

public class ExecuteRequest {

    // Méthode pour exécuter une requête SQL sur une base de données donnée
    public static void executeQuery(String databaseName, String sql) {
        String url = "jdbc:mysql://localhost:3306/" + databaseName + "?useSSL=false&serverTimezone=UTC";
        String user = "root"; // À adapter selon votre configuration
        String password = ""; // À adapter selon votre configuration

        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement()) {

            boolean hasResult = stmt.execute(sql);

            if (hasResult) {
                try (ResultSet rs = stmt.getResultSet()) {
                    ResultSetMetaData metaData = rs.getMetaData();
                    int columnCount = metaData.getColumnCount();

                    while (rs.next()) {
                        for (int i = 1; i <= columnCount; i++) {
                            System.out.print(rs.getString(i) + "\t");
                        }
                        System.out.println();
                    }
                }
            } else {
                int updateCount = stmt.getUpdateCount();
                System.out.println("✅ Requête exécutée. Lignes affectées : " + updateCount);
            }

        } catch (SQLException e) {
            System.err.println("❌ Erreur SQL : " + e.getMessage());
        }
    }

    // Exemple d'utilisation
    public static void main(String[] args) {
        String database = "ma_base"; // Nom de la base à adapter
        String requete = "SELECT * FROM users"; // Requête à adapter
        executeQuery(database, requete);
    }
}
