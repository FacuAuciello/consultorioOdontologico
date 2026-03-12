<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Turnos</title></head>
<body>
    <h1>Agenda de Turnos</h1>
    <a href="altaTurnoServlet">Nuevo Turno</a>
    <table border="1">
        <tr>
            <th>Fecha y Hora</th>
            <th>Duración</th>
            <th>Paciente</th>
            <th>Monto</th>
            <th>Notas</th>
            <th>Acciones</th>
        </tr>
        <c:forEach var="t" items="${turnos}">
            <tr>
                <td>${t.fechaHora}</td>
                <td>${t.duracionTurno} min</td>
                <td>${t.paciente.apellido}, ${t.paciente.nombre}</td>
                <td>${t.monto}</td>
                <td>${t.notasOdontologicas}</td>
                <td>
                    <a href="editarTurnoServlet?id=${t.id}">Editar</a>
                    <a href="eliminarTurnoServlet?id=${t.id}">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>