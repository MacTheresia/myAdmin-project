<%@ page import="java.sql.*" %>
<%
    String db = request.getParameter("db");
    String url = "jdbc:mysql://localhost:3306/" + db;
    String user = "root";
    String password = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);
        DatabaseMetaData meta = conn.getMetaData();
        ResultSet rs = meta.getTables(null, null, "%", new String[]{"TABLE"});

        out.println("<h3>Tables dans " + db + "</h3>");
        out.println("<ul>");
        while (rs.next()) {
            out.println("<li>" + rs.getString("TABLE_NAME") + "</li>");
        }
        out.println("</ul>");
        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Erreur : " + e.getMessage() + "</p>");
    }
%>
