
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultorio</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="inicioServlet" method="POST">
            <label form="usuario"> Usuario: <input type="text" id="usuario" name="usuario"></label>
            <label form="contrasenia"> Contraseña: <input type="password" id="contrasenia" name="contrasenia"></label>
            <button type="submit"> Ingresar </button>
        </form>
    </body>
</html>
