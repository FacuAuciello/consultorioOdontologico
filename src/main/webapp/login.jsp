<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Consultorio Odontológico — Ingresar</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-6 col-md-8">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <div class="p-5">

                            <div class="text-center mb-4">
                                <i class="fas fa-tooth fa-3x text-primary mb-3"></i>
                                <h1 class="h4 text-gray-900 mb-1">Consultorio Odontológico</h1>
                                <p class="text-muted small">Dr. Hernán Crespo</p>
                            </div>

                            <% if ("1".equals(request.getParameter("error"))) { %>
                            <div class="alert alert-danger text-center small" role="alert">
                                <i class="fas fa-exclamation-circle mr-1"></i>
                                Usuario o contraseña incorrectos.
                            </div>
                            <% } %>

                            <form action="inicioServlet" method="POST">
                                <div class="form-group">
                                    <label class="small font-weight-bold text-uppercase text-muted">Usuario</label>
                                    <input type="text" class="form-control form-control-user"
                                           name="usuario" placeholder="Nombre de usuario" required autofocus>
                                </div>
                                <div class="form-group">
                                    <label class="small font-weight-bold text-uppercase text-muted">Contraseña</label>
                                    <input type="password" class="form-control form-control-user"
                                           name="contrasenia" placeholder="••••••••" required>
                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                    Ingresar
                                </button>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="js/sb-admin-2.min.js"></script>
</body>
</html>
