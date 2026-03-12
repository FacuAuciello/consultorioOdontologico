
package Servlets;

import Entidades.Paciente;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "editarPacienteServlet", urlPatterns = {"/editarPacienteServlet"})
public class editarPacienteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editarPacienteServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editarPacienteServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        logica.ControladoraLogica cLogica = new logica.ControladoraLogica();
        Paciente paciente = cLogica.buscarPaciente(id);
        request.setAttribute("paciente", paciente);
        request.getRequestDispatcher("editarPaciente.jsp").forward(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String dni = request.getParameter("dni");
    String numeroContacto = request.getParameter("numeroContacto");
    String direccion = request.getParameter("direccion");
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date fechaNacimiento = null;
    try {
        fechaNacimiento = sdf.parse(request.getParameter("fechaNacimiento"));
    } catch (ParseException ex) {
        Logger.getLogger(editarPacienteServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    logica.ControladoraLogica cLogica = new logica.ControladoraLogica();
    Paciente paciente = cLogica.buscarPaciente(id);
    paciente.setNombre(nombre);
    paciente.setApellido(apellido);
    paciente.setDni(dni);
    paciente.setNumeroContacto(numeroContacto);
    paciente.setDireccion(direccion);
    paciente.setFechaNacimiento(fechaNacimiento);
    
    try {
        cLogica.editarPaciente(paciente);
    } catch (Exception ex) {
        Logger.getLogger(editarPacienteServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
    response.sendRedirect("listaPacientesServlet");
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
