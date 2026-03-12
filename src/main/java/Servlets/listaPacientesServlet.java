
package Servlets;

import Entidades.Paciente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "listaPacientesServlet", urlPatterns = {"/listaPacientesServlet"})
public class listaPacientesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet listaPacientesServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet listaPacientesServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        logica.ControladoraLogica CLogica = new logica.ControladoraLogica();
        
        //llamar a traer pacientes, guardar lal ista y mandarla al JSP de lista pacientes
        List <Paciente> listaPacientes = CLogica.traerPacientes();
        System.out.println("Cantidad de pacientes: " + listaPacientes.size());

        request.setAttribute("pacientes", listaPacientes);
        //enviando jsp con requestDispatcher, el repartidor
        request.getRequestDispatcher("listaPacientes.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
