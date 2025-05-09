<%@ page import="java.sql.*" %>
<%
    String db = request.getParameter("db");
    String sqlQuery = request.getParameter("sqlQuery");
    String url = "jdbc:mysql://localhost:3306/" + db;
    String user = "root"; // à adapter
    String password = ""; // à adapter

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);
        Statement stmt = conn.createStatement();

        boolean hasResultSet = stmt.execute(sqlQuery);

        if (hasResultSet) {
            ResultSet rs = stmt.getResultSet();
            ResultSetMetaData meta = rs.getMetaData();
            int columns = meta.getColumnCount();

            out.println("<table border='1'><tr>");
            for (int i = 1; i <= columns; i++) {
                out.println("<th>" + meta.getColumnName(i) + "</th>");
            }
            out.println("</tr>");

            while (rs.next()) {
                out.println("<tr>");
                for (int i = 1; i <= columns; i++) {
                    out.println("<td>" + rs.getString(i) + "</td>");
                }
                out.println("</tr>");
            }
            out.println("</table>");
            rs.close();
        } else {
            int updateCount = stmt.getUpdateCount();
            out.println("<p>Requête exécutée. Lignes affectées : " + updateCount + "</p>");
        }

        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Erreur : " + e.getMessage() + "</p>");
    }
%>
