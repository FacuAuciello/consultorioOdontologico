<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidades.Turno"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Paciente"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Editar Turno</title></head>
<body>
    <h1>Editar Turno</h1>
    <%
        Turno t = (Turno) request.getAttribute("turno");
    %>
    <form action="editarTurnoServlet" method="POST">
        <input type="hidden" name="id" value="<%=t.getId()%>">
        <label>Duración:
            <select name="duracionTurno">
                <option value="30">30 minutos</option>
                <option value="60">1 hora</option>
            </select>
        </label>
        <label>Monto: <input type="text" name="monto" value="<%=t.getMonto()%>"></label>
        <label>Notas: <textarea name="notasOdontologicas"><%=t.getNotasOdontologicas()%></textarea></label>
        <label>Paciente:
            <select name="idPaciente">
                <c:forEach var="p" items="${pacientes}">
                    <option value="${p.id}" ${p.id == t.paciente.id ? 'selected' : ''}>${p.apellido}, ${p.nombre}</option>
                </c:forEach>
            </select>
        </label>
        <button type="submit">Guardar cambios</button>
    </form>
</body>
</html>