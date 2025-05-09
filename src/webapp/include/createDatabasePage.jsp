<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>

<%
    String nom = request.getParameter("nom");
    if (nom != null && !nom.trim().isEmpty()) {
        List<String> noms = (List<String>) session.getAttribute("noms");
        if (noms == null) {
            noms = new ArrayList<>();
        }
        noms.add(nom);
        session.setAttribute("noms", noms);
    }
    response.sendRedirect("../index.jsp");
%>
