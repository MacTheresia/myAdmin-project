<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>

<%
    List<String> noms = (List<String>) session.getAttribute("noms");
    if (noms != null && !noms.isEmpty()) {
%>
    <ul class="name-list">
    <%
        for (int i = 0; i < noms.size(); i++) {
            String nom = noms.get(i);
    %>
        <li class="name-item">
            <div class="name-info">
                <button class="toggle-btn" onclick="toggle('details<%=i%>')">+</button>
                <strong><%= nom %></strong>
            </div>
            <div id="details<%=i%>" class="details">
                Aucun détail disponible.
            </div>
        </li>
    <%
        }
    %>
    </ul>
<%
    } else {
%>
    <p style="text-align: center; color: #999;">Aucun nom ajouté.</p>
<%
    }
%>

<script>
    function toggle(id) {
        const el = document.getElementById(id);
        if (el.style.display === "none" || el.style.display === "") {
            el.style.display = "block";
        } else {
            el.style.display = "none";
        }
    }
</script>
