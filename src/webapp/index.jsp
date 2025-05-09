<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>SQL Interface</title>
    <style>
        body { margin: 0; font-family: Arial, sans-serif; }
        .container { display: flex; height: 100vh; }
        .sidebar {
            width: 20%; background-color: #f1f1f1;
            padding: 10px; overflow-y: auto;
            border-right: 1px solid #ccc;
        }
        .main {
            flex: 1; padding: 20px;
        }
        .db-link { display: block; margin: 5px 0; color: blue; cursor: pointer; }
        .sql-area { width: 100%; height: 100px; }
        .tables-container { margin-top: 20px; }
        .btn { padding: 5px 10px; margin-top: 10px; cursor: pointer; }
    </style>
    <script>
        function loadTables(dbName) {
            const xhr = new XMLHttpRequest();
            xhr.open("GET", "loadTables.jsp?db=" + dbName, true);
            xhr.onload = function () {
                document.getElementById("tablesContainer").innerHTML = this.responseText;
                document.getElementById("selectedDb").value = dbName;
            };
            xhr.send();
        }

        function executeSQL() {
            const form = document.getElementById("sqlForm");
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "executeQuery.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onload = function () {
                document.getElementById("sqlResult").innerHTML = this.responseText;
            };
            const query = encodeURIComponent(form.sqlQuery.value);
            const db = encodeURIComponent(form.db.value);
            xhr.send("sqlQuery=" + query + "&db=" + db);
        }

        function showCreateTableForm() {
            const db = document.getElementById("selectedDb").value;
            const xhr = new XMLHttpRequest();
            xhr.open("GET", "createTableForm.jsp?db=" + db, true);
            xhr.onload = function () {
                document.getElementById("createTableContainer").innerHTML = this.responseText;
            };
            xhr.send();
        }
    </script>
</head>
<body>
<div class="container">
    <div class="sidebar">
        <h3>Bases de données</h3>
        <h3>Créer une base</h3>
        <form action="include/createDatabase.jsp" method="post">
            <input type="text" name="dbName" placeholder="Nom de la base">
            <input type="submit" value="Créer">
        </form>

    </div>

    <div class="main">
        <h2>Requête SQL</h2>
        <form id="sqlForm" onsubmit="event.preventDefault(); executeSQL();">
            <input type="hidden" name="db" id="selectedDb" value="">
            <textarea class="sql-area" name="sqlQuery" placeholder="Entrez votre requête SQL ici..."></textarea><br>
            <button class="btn" type="submit">Exécuter</button>
        </form>

        <div id="sqlResult" style="margin-top:20px;"></div>

        <div class="tables-container" id="tablesContainer">
            <!-- Les tables seront affichées ici -->
        </div>

        <div style="margin-top:20px;">
            <button class="btn" onclick="showCreateTableForm()">+ Créer une table</button>
            <div id="createTableContainer"></div>
        </div>
    </div>
</div>
</body>
</html>
