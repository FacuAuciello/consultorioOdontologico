
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="altaPacienteServlet" method="POST">
            <label form="nombre"> Nombre: <input type="text" id="nombre" name="nombre"></label>
            <label form="apellido"> Apellido: <input type="text" id="apellido" name="apellido"></label>
            <label>DNI: <input type="text" id="dni" name="dni"></label>
            <label>Telefono: <input type="text" id="numeroContacto" name="numeroContacto"></label>
            <label>Direccion: <input type="text" id="direccion" name="direccion"></label>
            <label>Fecha de nacimiento: <input type="date" id="fechaNacimiento" name="fechaNacimiento"></label>
            <button type="submit"> Crear Paciente </button>
        </form>
    </body>
</html>
