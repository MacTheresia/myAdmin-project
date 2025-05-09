<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Exécuter une requête SQL</title>
</head>
<body>
    <jsp:include page="../include/menu.jsp" />

    <h2>Écrire et exécuter une requête SQL</h2>
    <form action="execute.jsp" method="post">
        <textarea name="sqlQuery" rows="10" cols="80" placeholder="Entrez votre requête SQL ici"></textarea><br><br>
        <input type="submit" value="Exécuter">
    </form>
</body>
</html>
