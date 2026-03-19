package filtros;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class SesionFiltro implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();

        // Recursos que no requieren sesión
        boolean esRecursoPublico = uri.equals(contextPath + "/login.jsp")
                || uri.equals(contextPath + "/errorLogin.jsp")
                || (uri.equals(contextPath + "/inicioServlet") && "POST".equals(req.getMethod()))
                || uri.startsWith(contextPath + "/vendor/")
                || uri.startsWith(contextPath + "/css/")
                || uri.startsWith(contextPath + "/js/")
                || uri.startsWith(contextPath + "/img/");

        // Redirigir el root al servlet principal
        if (uri.equals(contextPath + "/") || uri.equals(contextPath)) {
            HttpSession session = req.getSession(false);
            if (session != null && session.getAttribute("usuario") != null) {
                res.sendRedirect(contextPath + "/inicioServlet");
            } else {
                res.sendRedirect(contextPath + "/login.jsp");
            }
            return;
        }

        if (esRecursoPublico) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        boolean sesionActiva = session != null && session.getAttribute("usuario") != null;

        if (sesionActiva) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(contextPath + "/login.jsp");
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}
