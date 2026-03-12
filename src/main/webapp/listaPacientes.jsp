<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="componentes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Pacientes</h1>
    <a href="altaPaciente.jsp" class="btn btn-primary btn-sm shadow-sm">
        <i class="fas fa-user-plus fa-sm text-white-50"></i> Nuevo Paciente
    </a>
</div>

<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="tablaPacientes" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Apellido</th>
                        <th>Nombre</th>
                        <th>DNI</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Fecha Nacimiento</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${pacientes}">
                        <tr>
                            <td>${p.apellido}</td>
                            <td>${p.nombre}</td>
                            <td>${p.dni}</td>
                            <td>${p.numeroContacto}</td>
                            <td>${p.direccion}</td>
                            <td>
                            <fmt:formatDate value="${p.fechaNacimiento}" pattern="dd/MM/yyyy"/>
                            </td>
                            <td>
                                <a href="editarPacienteServlet?id=${p.id}" class="btn btn-warning btn-sm">
                                    <i class="fas fa-edit"></i> Editar
                                </a>
                                <a href="eliminarPacienteServlet?id=${p.id}" class="btn btn-danger btn-sm"
                                   onclick="return confirm('¿Eliminar este paciente?')">
                                    <i class="fas fa-trash"></i> Eliminar
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@include file="componentes/footer.jsp"%>


<!-- DataTables -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tablaPacientes').DataTable({
            order: [[0, 'asc']], // ordena por apellido A-Z
            language: {
                url: '//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json'
            }
        });
    });
</script>