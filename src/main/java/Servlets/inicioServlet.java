
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "inicioServlet", urlPatterns = {"/inicioServlet"})
public class inicioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet inicioServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet inicioServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        logica.ControladoraLogica cLogica = new logica.ControladoraLogica();
        response.sendRedirect("index.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //lectura de los valores que envio el usuario a traves del formulario
        String usuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contrasenia");
        
        logica.ControladoraLogica cLogica = new logica.ControladoraLogica();
        
        if(cLogica.verificarLogin(usuario, contrasenia)){
            //la sesion se crea solo cuando el usuario es correcto y guardo el usuario autenticado
            HttpSession sesionUsuario = request.getSession();
            sesionUsuario.setAttribute("usuario", usuario );
            response.sendRedirect("index.jsp");
        }else{
            //redirijo el error a una pagina
            response.sendRedirect("errorLogin.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
