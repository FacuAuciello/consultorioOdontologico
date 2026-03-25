<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="componentes/header.jsp"%>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Nuevo Paciente</h1>
</div>

<% String errorAlta = (String) request.getAttribute("error"); %>
<% if (errorAlta != null) { %>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <i class="fas fa-exclamation-triangle"></i> <%= errorAlta %>
    <button type="button" class="close" data-dismiss="alert"><span>&times;</span></button>
</div>
<% } %>

<div class="card shadow mb-4">
    <div class="card-body">
        <form action="altaPacienteServlet" method="POST">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Nombre <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="nombre" value="${param.nombre}"
                               pattern="[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ ]+" title="Solo letras y espacios" required>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Apellido <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="apellido" value="${param.apellido}"
                               pattern="[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ ]+" title="Solo letras y espacios" required>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>DNI <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="dni" value="${param.dni}" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Teléfono <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="numeroContacto" value="${param.numeroContacto}" required>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Dirección <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="direccion" value="${param.direccion}" required>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Fecha de Nacimiento <span class="text-danger">*</span></label>
                        <input type="hidden" name="fechaNacimiento" id="fechaNacimiento">
                        <div class="d-flex">
                            <input type="number" id="fnDia" name="fnDia" class="form-control text-center mr-1" placeholder="DD" min="1" max="31" style="width:70px" value="${param.fnDia}">
                            <input type="number" id="fnMes" name="fnMes" class="form-control text-center mr-1" placeholder="MM" min="1" max="12" style="width:70px" value="${param.fnMes}">
                            <input type="number" id="fnAnio" name="fnAnio" class="form-control text-center" placeholder="AAAA" min="1900" max="2100" style="width:90px" value="${param.fnAnio}">
                        </div>
                    </div>
                </div>
            </div>
            <a href="listaPacientesServlet" class="btn btn-secondary">Cancelar</a>
            <button type="submit" class="btn btn-primary">Guardar Paciente</button>
        </form>
    </div>
</div>

<%@include file="componentes/footer.jsp"%>

<script>
    // Auto-avanza el foco al siguiente campo
    document.getElementById('fnDia').addEventListener('input', function() {
        if (this.value.length === 2) document.getElementById('fnMes').focus();
    });
    document.getElementById('fnMes').addEventListener('input', function() {
        if (this.value.length === 2) document.getElementById('fnAnio').focus();
    });

    // Ensambla el campo oculto yyyy-MM-dd antes de enviar
    document.querySelector('form').addEventListener('submit', function() {
        var dia = document.getElementById('fnDia').value.padStart(2, '0');
        var mes = document.getElementById('fnMes').value.padStart(2, '0');
        var anio = document.getElementById('fnAnio').value;
        if (dia && mes && anio) {
            document.getElementById('fechaNacimiento').value = anio + '-' + mes + '-' + dia;
        }
    });
</script>