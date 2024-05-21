package com.emergentes.controlador;

import com.emergentes.dao.PostsDAO;
import com.emergentes.dao.PostsDAOimpl;
import com.emergentes.modelo.Posts;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PostsController", urlPatterns = {"/PostsController"})
public class PostsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PostsDAO dao = (PostsDAO) new PostsDAOimpl();
            Posts pst = new Posts();
            int id;
            
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            
            switch (action) {
                case "add":
                    request.setAttribute("Posts", pst);
                    request.getRequestDispatcher("frmposts.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    try {
                        pst = dao.getById(id);
                        request.setAttribute("Posts", pst);
                        request.getRequestDispatcher("frmposts.jsp").forward(request, response);
                    } catch (Exception ex) {
                        System.out.println("Error al editar los datos " + ex.getMessage());
                    }
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    try {
                        dao.delete(id);
                    } catch (Exception ex) {
                        System.out.println("Error al eliminar los datos " + ex.getMessage());
                    }
                    response.sendRedirect("PostsController");
                    break;
                case "view" :
                    List<Posts> lista = dao.getAll();
                    request.setAttribute(("Posts"), lista);
                    request.getRequestDispatcher("PostsInicio.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            Logger.getLogger(PostsController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        String fecha = request.getParameter("fecha");
        String titulo = request.getParameter("titulo");
        String contenido = request.getParameter("contenido");

        Posts pst = new Posts();
        
        pst.setId(id);
        pst.setFecha(fecha);
        pst.setTitulo(titulo);
        pst.setContenido(contenido);
        
        PostsDAO dao = new PostsDAOimpl();
        
        if (id == 0) {
            try {
                dao.insert(pst);
            } catch (Exception ex) {
                System.out.println("Error al insertar datos " + ex.getMessage());
            }
        } else {
            try {
                dao.update(pst);
            } catch (Exception ex) {
                System.out.println("Error al actualizar los datos " + ex.getMessage());
            }
        }
        response.sendRedirect("PostsController?action=view");
    }
}
