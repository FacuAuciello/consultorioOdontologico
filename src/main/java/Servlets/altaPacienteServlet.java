
package Servlets;

import Entidades.Paciente;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

        String nombre        = request.getParameter("nombre");
        String apellido      = request.getParameter("apellido");
        String dni           = request.getParameter("dni");
        String numeroContacto = request.getParameter("numeroContacto");
        String direccion     = request.getParameter("direccion");
        String fnDia         = request.getParameter("fnDia");
        String fnMes         = request.getParameter("fnMes");
        String fnAnio        = request.getParameter("fnAnio");

        String error = validar(nombre, apellido, dni, numeroContacto, direccion, fnDia, fnMes, fnAnio);
        if (error != null) {
            request.setAttribute("error", error);
            request.getRequestDispatcher("altaPaciente.jsp").forward(request, response);
            return;
        }

        Date fechaNacimiento = parsearFecha(fnDia, fnMes, fnAnio);
        Paciente paciente = new Paciente(nombre.trim(), apellido.trim(), dni.trim(),
                numeroContacto.trim(), direccion.trim(), fechaNacimiento);
        logica.ControladoraLogica cLogica = new logica.ControladoraLogica();
        cLogica.guardarPaciente(paciente);
        request.getSession().setAttribute("flash",
                "Paciente <strong>" + apellido.trim() + ", " + nombre.trim() + "</strong> guardado correctamente.");
        response.sendRedirect("listaPacientesServlet");
    }

    private String validar(String nombre, String apellido, String dni,
            String numeroContacto, String direccion,
            String fnDia, String fnMes, String fnAnio) {

        List<String> errores = new ArrayList<>();

        // Nombre
        if (nombre == null || nombre.trim().isEmpty()) {
            errores.add("El nombre es obligatorio.");
        } else if (!nombre.trim().matches("[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ ]+")) {
            errores.add("El nombre solo puede contener letras y espacios.");
        }

        // Apellido
        if (apellido == null || apellido.trim().isEmpty()) {
            errores.add("El apellido es obligatorio.");
        } else if (!apellido.trim().matches("[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ ]+")) {
            errores.add("El apellido solo puede contener letras y espacios.");
        }

        // DNI
        if (dni == null || dni.trim().isEmpty()) {
            errores.add("El DNI es obligatorio.");
        }

        // Teléfono
        if (numeroContacto == null || numeroContacto.trim().isEmpty()) {
            errores.add("El teléfono es obligatorio.");
        }

        // Dirección
        if (direccion == null || direccion.trim().isEmpty()) {
            errores.add("La dirección es obligatoria.");
        }

        // Fecha de nacimiento
        if (fnDia == null || fnDia.trim().isEmpty()
                || fnMes == null || fnMes.trim().isEmpty()
                || fnAnio == null || fnAnio.trim().isEmpty()) {
            errores.add("La fecha de nacimiento es obligatoria (día, mes y año).");
        } else {
            try {
                int dia  = Integer.parseInt(fnDia.trim());
                int mes  = Integer.parseInt(fnMes.trim());
                int anio = Integer.parseInt(fnAnio.trim());
                int anioActual = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);

                if (dia < 1 || dia > 31) {
                    errores.add("El día de nacimiento debe estar entre 1 y 31.");
                } else if (mes < 1 || mes > 12) {
                    errores.add("El mes de nacimiento debe estar entre 1 y 12.");
                } else if (anio < 1900 || anio > anioActual) {
                    errores.add("El año de nacimiento debe estar entre 1900 y " + anioActual + ".");
                } else {
                    // Valida fecha real en el calendario (ej: no existe el 30 de febrero)
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    sdf.setLenient(false);
                    try {
                        sdf.parse(String.format("%04d-%02d-%02d", anio, mes, dia));
                    } catch (ParseException ex) {
                        errores.add("La fecha de nacimiento no es válida (revisá el día y mes).");
                    }
                }
            } catch (NumberFormatException ex) {
                errores.add("La fecha de nacimiento debe contener solo números.");
            }
        }

        if (errores.isEmpty()) return null;
        if (errores.size() == 1) return errores.get(0);

        StringBuilder sb = new StringBuilder("<ul class='mb-0 mt-1'>");
        for (String e : errores) sb.append("<li>").append(e).append("</li>");
        sb.append("</ul>");
        return sb.toString();
    }

    private Date parsearFecha(String fnDia, String fnMes, String fnAnio) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            sdf.setLenient(false);
            return sdf.parse(String.format("%04d-%02d-%02d",
                    Integer.parseInt(fnAnio.trim()),
                    Integer.parseInt(fnMes.trim()),
                    Integer.parseInt(fnDia.trim())));
        } catch (Exception ex) {
            return null;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
