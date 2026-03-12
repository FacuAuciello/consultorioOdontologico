
package Servlets;

import Entidades.Paciente;
import Entidades.Turno;
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

@WebServlet(name = "editarTurnoServlet", urlPatterns = {"/editarTurnoServlet"})
public class editarTurnoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editarTurnoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editarTurnoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    logica.ControladoraLogica cLogica = new logica.ControladoraLogica();
    Turno turno = cLogica.buscarTurno(id);
    List<Paciente> pacientes = cLogica.traerPacientes();
    request.setAttribute("pacientes", pacientes);
    request.setAttribute("turno", turno);
    request.getRequestDispatcher("editarTurno.jsp").forward(request, response);
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    String duracion = request.getParameter("duracionTurno");
    String monto = request.getParameter("monto");
    String notas = request.getParameter("notasOdontologicas");
    
    logica.ControladoraLogica cLogica = new logica.ControladoraLogica();
    Turno turno = cLogica.buscarTurno(id);
    turno.setDuracionTurno(duracion);
    turno.setMonto(monto);
    turno.setNotasOdontologicas(notas);
    
    int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
    Paciente paciente = cLogica.buscarPaciente(idPaciente);
    turno.setPaciente(paciente);
    
    try {
        cLogica.editarTurno(turno);
    } catch (Exception ex) {
        Logger.getLogger(editarTurnoServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
    response.sendRedirect("listaTurnosServlet");
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
