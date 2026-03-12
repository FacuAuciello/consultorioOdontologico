<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista Pacientes</h1>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <table>
            <tr>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>DNI</th>
                <th>Teléfono</th>
                <th>Dirección</th>
                <th>Fecha Nacimiento</th>
                <th>Acciones</th>
            </tr>
            <%--cforeach recorre la lista que manda el servlet y por cada paciente, crea una fila. --%>
        <c:forEach var="p" items="${pacientes}">
                <tr>
                    <td>${p.nombre}</td>
                    <td>${p.apellido}</td>
                    <td>${p.dni}</td>
                    <td>${p.numeroContacto}</td>
                    <td>${p.direccion}</td>
                    <td>${p.fechaNacimiento}</td>
                </tr>
            <td>
                <a href="eliminarPacienteServlet?id=${p.id}">Eliminar</a>
                <a href="editarPacienteServlet?id=${p.id}">Editar</a>
            </td>
        </c:forEach>
        </table>
    </body>
</html>
