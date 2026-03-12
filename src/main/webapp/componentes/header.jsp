<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Consultorio Odontológico</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
    <div id="wrapper">
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                <div class="sidebar-brand-icon">
                    <i class="fas fa-tooth"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Consultorio<br><small>Hernán Crespo</small></div>
            </a>
            <hr class="sidebar-divider my-0">
            <li class="nav-item active">
                <a class="nav-link" href="listaTurnosServlet">
                    <i class="fas fa-calendar-alt"></i>
                    <span>Agenda</span>
                </a>
            </li>
            <hr class="sidebar-divider">
            <div class="sidebar-heading">Gestión</div>
            <li class="nav-item">
                <a class="nav-link" href="listaPacientesServlet">
                    <i class="fas fa-users"></i>
                    <span>Pacientes</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="altaTurnoServlet">
                    <i class="fas fa-plus-circle"></i>
                    <span>Nuevo Turno</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="altaPaciente.jsp">
                    <i class="fas fa-user-plus"></i>
                    <span>Nuevo Paciente</span>
                </a>
            </li>
        </ul>
        <!-- Fin Sidebar -->

        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <!-- Navbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="cerrarSesionServlet">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Cerrar Sesión
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- Fin Navbar -->
                <div class="container-fluid">