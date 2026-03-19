<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="componentes/header.jsp"%>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Agenda de Turnos</h1>
    <a href="altaTurnoServlet" class="btn btn-primary btn-sm shadow-sm">
        <i class="fas fa-plus fa-sm text-white-50"></i> Nuevo Turno
    </a>
</div>

<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="tablaTurnos" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Fecha y Hora</th>
                        <th>Duración</th>
                        <th>Paciente</th>
                        <th>Monto</th>
                        <th>Notas</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="t" items="${turnos}">
                        <tr>
                            <td><fmt:formatDate value="${t.fechaHora}" pattern="dd/MM/yyyy HH:mm"/></td>
                            <td>${t.duracionTurno} min</td>
                            <td>${t.paciente.apellido}, ${t.paciente.nombre}</td>
                            <td>${t.monto}</td>
                            <td>${t.notasOdontologicas}</td>
                            <td>
                                <a href="editarTurnoServlet?id=${t.id}" class="btn btn-warning btn-sm">
                                    <i class="fas fa-edit"></i> Editar
                                </a>
                                <a href="eliminarTurnoServlet?id=${t.id}" class="btn btn-danger btn-sm"
                                   onclick="return confirm('¿Eliminar este turno?')">
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
        $('#tablaTurnos').DataTable({
            order: [[0, 'asc']],
            language: {
                url: '//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json'
            }
        });
    });
</script>