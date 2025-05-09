package org.example.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chemin relatif à partir de la racine de webapp
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }
}
