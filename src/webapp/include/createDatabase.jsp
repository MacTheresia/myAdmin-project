<%@ page import="org.example.model.DatabaseAction" %>

<%
    String dbName = request.getParameter("dbName");
    if (dbName != null && !dbName.trim().isEmpty()) {
        String url = "jdbc:mysql://localhost:3306/";
        String user = "root";
        String password = "";

        DatabaseAction dbAction = new DatabaseAction(url, user, password);
        dbAction.createDatabase(dbName);

        out.println("<p style='color:green;'>Base de données '" + dbName + "' créée avec succès.</p>");
    } else {
        out.println("<p style='color:red;'>Nom de la base requis.</p>");
    }
%>

<a href="../index.jsp">Retour</a>
