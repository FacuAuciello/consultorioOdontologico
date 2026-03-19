
package Servlets;

import Entidades.Turno;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
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
    List<Turno> turnos = cLogica.traerTurnos();
    
    // Calcular fecha fin de cada turno
    for (Turno t : turnos) {
        if (t.getFechaHora() != null && t.getDuracionTurno() != null) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(t.getFechaHora());
            cal.add(Calendar.MINUTE, Integer.parseInt(t.getDuracionTurno()));
            t.setFechaFin(cal.getTime());
        }
    }
    
    request.setAttribute("turnos", turnos);
    request.getRequestDispatcher("index.jsp").forward(request, response);
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
        sesionUsuario.setAttribute("usuario", usuario);
        //redirijo a menu principal pasando por el doGet para cargar los turnos
        response.sendRedirect("inicioServlet");
    }else{
        //redirijo el error a una pagina
        response.sendRedirect("login.jsp?error=1");
    }
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
