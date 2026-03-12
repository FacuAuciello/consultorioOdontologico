
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

@WebServlet(name = "altaPacienteServlet", urlPatterns = {"/altaPacienteServlet"})
public class altaPacienteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet altaPacienteServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet altaPacienteServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
     //lectura valores ingresados
     String nombre = request.getParameter("nombre");
     String apellido = request.getParameter("apellido");
     String dni = request.getParameter("dni");
     String numeroContacto = request.getParameter("numeroContacto");
     String direccion = request.getParameter("direccion");
     //de string a date. el sdf.parse lanza una excepcion checked, la tengo que manjear con try/catch
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
     //declarada afuera y asignada dentro
     Date fechaNacimiento = null;
        try {
            fechaNacimiento = sdf.parse(request.getParameter("fechaNacimiento"));
        } catch (ParseException ex) {
            Logger.getLogger(altaPacienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
     //creo el paciente
     Paciente paciente = new Paciente(nombre, apellido, dni, numeroContacto, direccion, fechaNacimiento);
     
     //guardar el paciente dentro de la BD
     logica.ControladoraLogica cLogica = new logica.ControladoraLogica();
     cLogica.guardarPaciente(paciente);
     //creacion exitosa del usuario, redirije a la pagina donde estan todos los usuarios
     response.sendRedirect("listaPacientes.jsp");
     
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
