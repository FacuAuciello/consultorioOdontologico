<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="componentes/header.jsp"%>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Nuevo Turno</h1>
</div>

<div class="card shadow mb-4">
    <div class="card-body">
        <form action="altaTurnoServlet" method="POST">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Fecha y Hora</label>
                        <input type="text" class="form-control" name="fechaHora" value="${fechaHora}" readonly required>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Duración</label>
                        <select class="form-control" name="duracionTurno">
                            <option value="30">30 minutos</option>
                            <option value="60">1 hora</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Paciente</label>
                        <select class="form-control select2" name="idPaciente" style="width:100%">
                            <c:forEach var="p" items="${pacientes}">
                                <option value="${p.id}">${p.apellido}, ${p.nombre}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <a href="inicioServlet" class="btn btn-secondary">Cancelar</a>
            <button type="submit" class="btn btn-primary">Guardar Turno</button>
        </form>
    </div>
</div>

<%@include file="componentes/footer.jsp"%>

<link href="vendor/select2/css/select2.min.css" rel="stylesheet">
<link href="vendor/select2-bootstrap4-theme/select2-bootstrap4.min.css" rel="stylesheet">
<script src="vendor/select2/js/select2.min.js"></script>
<script>
    $(document).ready(function() {
        $('.select2').select2({
            theme: 'bootstrap4',
            placeholder: 'Buscar paciente...'
        });
    });
</script>