
package Servlets;

import Entidades.Paciente;
import Entidades.Turno;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "altaTurnoServlet", urlPatterns = {"/altaTurnoServlet"})
public class altaTurnoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet altaTurnoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet altaTurnoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    logica.ControladoraLogica cLogica = new logica.ControladoraLogica();
    List<Paciente> pacientes = cLogica.traerPacientes();
    request.setAttribute("pacientes", pacientes);
    request.getRequestDispatcher("altaTurno.jsp").forward(request, response);
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
    Date fechaHora = null;
    try {
        fechaHora = sdf.parse(request.getParameter("fechaHora"));
    } catch (ParseException ex) {
        Logger.getLogger(altaTurnoServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
    String duracion = request.getParameter("duracionTurno");
    String monto = request.getParameter("monto");
    String notas = request.getParameter("notasOdontologicas");
    int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
    
    logica.ControladoraLogica cLogica = new logica.ControladoraLogica();
    Paciente paciente = cLogica.buscarPaciente(idPaciente);
    
    Turno turno = new Turno(fechaHora, duracion, monto, notas, paciente);
    cLogica.guardarTurno(turno);
    response.sendRedirect("listaTurnosServlet");
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
