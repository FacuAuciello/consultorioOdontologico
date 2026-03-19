<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="componentes/header.jsp"%>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Nuevo Paciente</h1>
</div>

<div class="card shadow mb-4">
    <div class="card-body">
        <form action="altaPacienteServlet" method="POST">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" class="form-control" name="nombre" required>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Apellido</label>
                        <input type="text" class="form-control" name="apellido" required>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>DNI</label>
                        <input type="text" class="form-control" name="dni" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Teléfono</label>
                        <input type="text" class="form-control" name="numeroContacto">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Dirección</label>
                        <input type="text" class="form-control" name="direccion">
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
            <button type="submit" class="btn btn-primary">Guardar Paciente</button>
        </form>
    </div>
</div>

<%@include file="componentes/footer.jsp"%>p"%>