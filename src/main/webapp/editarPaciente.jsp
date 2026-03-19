<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidades.Paciente"%>
<%@include file="componentes/header.jsp"%>

<%
    Paciente p = (Paciente) request.getAttribute("paciente");
%>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Editar Paciente</h1>
</div>

<div class="card shadow mb-4">
    <div class="card-body">
        <form action="editarPacienteServlet" method="POST">
            <input type="hidden" name="id" value="<%=p.getId()%>">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" class="form-control" name="nombre" value="<%=p.getNombre()%>" required>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Apellido</label>
                        <input type="text" class="form-control" name="apellido" value="<%=p.getApellido()%>" required>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>DNI</label>
                        <input type="text" class="form-control" name="dni" value="<%=p.getDni()%>" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Teléfono</label>
                        <input type="text" class="form-control" name="numeroContacto" value="<%=p.getNumeroContacto()%>">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Dirección</label>
                        <input type="text" class="form-control" name="direccion" value="<%=p.getDireccion()%>">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Fecha de Nacimiento</label>
                        <input type="date" class="form-control" name="fechaNacimiento">
                    </div>
                </div>
            </div>
            <a href="listaPacientesServlet" class="btn btn-secondary">Cancelar</a>
            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
        </form>
    </div>
</div>

<%@include file="componentes/footer.jsp"%>