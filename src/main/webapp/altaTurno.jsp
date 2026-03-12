<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Paciente"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Nuevo Turno</title></head>
<body>
    <h1>Nuevo Turno</h1>
    <form action="altaTurnoServlet" method="POST">
        <label>Fecha y hora: <input type="datetime-local" name="fechaHora"></label>
        <label>Duración:
            <select name="duracionTurno">
                <option value="30">30 minutos</option>
                <option value="60">1 hora</option>
            </select>
        </label>
        <label>Paciente:
            <select name="idPaciente">
                <c:forEach var="p" items="${pacientes}">
                    <option value="${p.id}">${p.apellido}, ${p.nombre}</option>
                </c:forEach>
            </select>
        </label>
        <label>Monto: <input type="text" name="monto"></label>
        <label>Notas: <textarea name="notasOdontologicas"></textarea></label>
        <button type="submit">Guardar Turno</button>
    </form>
</body>
</html>