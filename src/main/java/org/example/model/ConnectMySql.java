package org.example.model;

//

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// Connection avec MySql
public class ConnectMySql {
    public static void main(String[] args){
        String url =  "jdbc:mysql://localhost:3306/myadmin";
        String user = "root";
        String password = "";

        // Check connection using try-with-ressource
        try (Connection conn = DriverManager.getConnection(url, user, password)){
            System.out.println("Connexion réussie");
            conn.close();
        }catch (SQLException e){
            System.out.println("Erreur avec connexion avec MySQL: " + e.getMessage());
        }
    }
}
