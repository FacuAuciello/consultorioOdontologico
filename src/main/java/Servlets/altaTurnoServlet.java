
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
    
    // Lee la fecha que viene del calendario
    String fechaHora = request.getParameter("fechaHora");
    if (fechaHora != null && !fechaHora.isEmpty()) {
        // Convierte formato "2026-03-16T09:00:00" a "2026-03-16T09:00"
        if (fechaHora.length() > 16) {
            fechaHora = fechaHora.substring(0, 16);
        }
        request.setAttribute("fechaHora", fechaHora);
    }
    
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
    String idPacienteParam = request.getParameter("idPaciente");
    if (idPacienteParam == null || idPacienteParam.isEmpty()) {
        response.sendRedirect("altaTurnoServlet");
        return;
    }
    int idPaciente = Integer.parseInt(idPacienteParam);

    logica.ControladoraLogica cLogica = new logica.ControladoraLogica();
    Paciente paciente = cLogica.buscarPaciente(idPaciente);

    Turno turno = new Turno(fechaHora, duracion, monto, notas, paciente);
    cLogica.guardarTurno(turno);

    // Agregar entrada a la historia clínica del paciente
    if ((notas != null && !notas.trim().isEmpty()) || (monto != null && !monto.trim().isEmpty())) {
        java.text.SimpleDateFormat sdfFecha = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm");
        String entrada = "\n--- " + sdfFecha.format(fechaHora) + " | Monto: $" + (monto != null ? monto : "-") + " ---\n" + (notas != null ? notas : "") + "\n";
        String historiaActual = paciente.getHistoriaClinica();
        paciente.setHistoriaClinica((historiaActual != null ? historiaActual : "") + entrada);
        try {
            cLogica.editarPaciente(paciente);
        } catch (Exception ex) {
            Logger.getLogger(altaTurnoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    response.sendRedirect("inicioServlet");
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
