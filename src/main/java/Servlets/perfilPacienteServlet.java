package Servlets;

import Entidades.Paciente;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "perfilPacienteServlet", urlPatterns = {"/perfilPacienteServlet"})
public class perfilPacienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        logica.ControladoraLogica cLogica = new logica.ControladoraLogica();
        Paciente paciente = cLogica.buscarPaciente(id);
        request.setAttribute("paciente", paciente);
        request.getRequestDispatcher("perfilPaciente.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String historiaClinica = request.getParameter("historiaClinica");

        logica.ControladoraLogica cLogica = new logica.ControladoraLogica();
        Paciente paciente = cLogica.buscarPaciente(id);
        paciente.setHistoriaClinica(historiaClinica);

        try {
            cLogica.editarPaciente(paciente);
        } catch (Exception ex) {
            Logger.getLogger(perfilPacienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("perfilPacienteServlet?id=" + id + "&guardado=1");
    }
}
