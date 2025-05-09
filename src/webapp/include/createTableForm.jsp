<%
    String db = request.getParameter("db");
%>
<h3>Créer une nouvelle table dans <%= db %></h3>
<form action="createTable.jsp" method="post">
    <input type="hidden" name="db" value="<%= db %>">
    Nom de la table : <input type="text" name="tableName"><br><br>
    Nom de la colonne : <input type="text" name="colName"><br>
    Type (ex: VARCHAR(100), INT, etc) : <input type="text" name="colType"><br>
    <input type="submit" value="Créer la table">
</form>
