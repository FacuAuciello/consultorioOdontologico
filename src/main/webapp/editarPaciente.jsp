<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidades.Paciente"%>
<!DOCTYPE html>
<html>
<head><title>Editar Paciente</title></head>
<body>
    <h1>Editar Paciente</h1>
    <%
        Paciente p = (Paciente) request.getAttribute("paciente");
    %>
    <form action="editarPacienteServlet" method="POST">
        <input type="hidden" name="id" value="<%=p.getId()%>">
        <label>Nombre: <input type="text" name="nombre" value="<%=p.getNombre()%>"></label>
        <label>Apellido: <input type="text" name="apellido" value="<%=p.getApellido()%>"></label>
        <label>DNI: <input type="text" name="dni" value="<%=p.getDni()%>"></label>
        <label>Teléfono: <input type="text" name="numeroContacto" value="<%=p.getNumeroContacto()%>"></label>
        <label>Dirección: <input type="text" name="direccion" value="<%=p.getDireccion()%>"></label>
        <label>Fecha nacimiento: <input type="date" name="fechaNacimiento"></label>
        <button type="submit">Guardar cambios</button>
    </form>
</body>
</html>