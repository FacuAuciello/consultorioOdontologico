<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidades.Turno"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="componentes/header.jsp"%>

<%
    Turno t = (Turno) request.getAttribute("turno");
%>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Editar Turno</h1>
</div>

<div class="card shadow mb-4">
    <div class="card-body">
        <form action="editarTurnoServlet" method="POST">
            <input type="hidden" name="id" value="<%=t.getId()%>">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Duración</label>
                        <select class="form-control" name="duracionTurno">
                            <option value="30" <%=t.getDuracionTurno().equals("30") ? "selected" : ""%>>30 minutos</option>
                            <option value="60" <%=t.getDuracionTurno().equals("60") ? "selected" : ""%>>1 hora</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Paciente</label>
                        <select class="form-control select2" name="idPaciente" style="width:100%">
                            <c:forEach var="p" items="${pacientes}">
                                <option value="${p.id}" ${p.id == turno.paciente.id ? 'selected' : ''}>${p.apellido}, ${p.nombre}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Monto</label>
                        <input type="text" class="form-control" name="monto" value="<%=t.getMonto() != null ? t.getMonto() : ""%>">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Notas Clínicas</label>
                        <textarea class="form-control" name="notasOdontologicas" rows="4"><%=t.getNotasOdontologicas() != null ? t.getNotasOdontologicas() : ""%></textarea>
                    </div>
                </div>
            </div>
            <fmt:formatDate var="fechaWA" value="${turno.fechaHora}" pattern="dd/MM/yyyy"/>
            <fmt:formatDate var="horaWA"  value="${turno.fechaHora}" pattern="HH:mm"/>
            <a href="inicioServlet" class="btn btn-secondary">Cancelar</a>
            <a href="eliminarTurnoServlet?id=<%=t.getId()%>" class="btn btn-danger" onclick="return confirm('¿Eliminar este turno?')">Eliminar</a>
            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
            <a href="https://wa.me/54${turno.paciente.numeroContacto}?text=Hola%20${turno.paciente.nombre}%20${turno.paciente.apellido}%2C%20le%20recordamos%20su%20turno%20en%20el%20consultorio%20del%20Dr.%20Hern%C3%A1n%20Crespo%20el%20d%C3%ADa%20${fechaWA}%20a%20las%20${horaWA}hs.%20Ante%20cualquier%20consulta%20com%C3%BAn%C3%ADquese%20con%20nosotros."
               target="_blank" class="btn btn-success">
                <i class="fab fa-whatsapp"></i> Recordar turno por WhatsApp
            </a>
        </form>
    </div>
</div>

<%@include file="componentes/footer.jsp"%>

<link href="vendor/select2/css/select2.min.css" rel="stylesheet">
<script src="vendor/select2/js/select2.min.js"></script>
<script>
    $(document).ready(function() {
        $('.select2').select2({
            placeholder: 'Buscar paciente...',
            allowClear: true
        });
    });
</script>