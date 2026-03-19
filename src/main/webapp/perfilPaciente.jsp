<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="componentes/header.jsp"%>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">
        <i class="fas fa-user-circle mr-2 text-primary"></i>
        ${paciente.apellido}, ${paciente.nombre}
    </h1>
    <div>
        <a href="editarPacienteServlet?id=${paciente.id}" class="btn btn-warning btn-sm shadow-sm mr-2">
            <i class="fas fa-edit fa-sm"></i> Editar datos
        </a>
        <a href="listaPacientesServlet" class="btn btn-secondary btn-sm shadow-sm">
            <i class="fas fa-arrow-left fa-sm"></i> Volver
        </a>
    </div>
</div>

<c:if test="${param.guardado == '1'}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <i class="fas fa-check-circle mr-1"></i> Historia clínica guardada correctamente.
        <button type="button" class="close" data-dismiss="alert">
            <span>&times;</span>
        </button>
    </div>
</c:if>

<!-- Datos personales -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Datos Personales</h6>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-4">
                <p class="mb-1 small text-uppercase text-muted font-weight-bold">DNI</p>
                <p class="mb-3">${paciente.dni}</p>
            </div>
            <div class="col-md-4">
                <p class="mb-1 small text-uppercase text-muted font-weight-bold">Teléfono</p>
                <p class="mb-3">${paciente.numeroContacto}</p>
            </div>
            <div class="col-md-4">
                <p class="mb-1 small text-uppercase text-muted font-weight-bold">Fecha de Nacimiento</p>
                <p class="mb-3">
                    <fmt:formatDate value="${paciente.fechaNacimiento}" pattern="dd/MM/yyyy"/>
                </p>
            </div>
            <div class="col-md-8">
                <p class="mb-1 small text-uppercase text-muted font-weight-bold">Dirección</p>
                <p class="mb-0">${paciente.direccion}</p>
            </div>
        </div>
    </div>
</div>

<!-- Historia clínica -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Historia Clínica</h6>
    </div>
    <div class="card-body">
        <form action="perfilPacienteServlet" method="POST">
            <input type="hidden" name="id" value="${paciente.id}">
            <div class="form-group">
                <textarea class="form-control" name="historiaClinica" rows="14"
                          placeholder="Notas clínicas del paciente...">${paciente.historiaClinica}</textarea>
            </div>
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save mr-1"></i> Guardar Historia Clínica
            </button>
        </form>
    </div>
</div>

<%@include file="componentes/footer.jsp"%>
