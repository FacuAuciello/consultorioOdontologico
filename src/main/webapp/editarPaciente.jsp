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
                        <input type="hidden" name="fechaNacimiento" id="fechaNacimiento">
                        <%
                            String fnDia = "", fnMes = "", fnAnio = "";
                            if (p.getFechaNacimiento() != null) {
                                java.util.Calendar cal = java.util.Calendar.getInstance();
                                cal.setTime(p.getFechaNacimiento());
                                fnDia  = String.valueOf(cal.get(java.util.Calendar.DAY_OF_MONTH));
                                fnMes  = String.valueOf(cal.get(java.util.Calendar.MONTH) + 1);
                                fnAnio = String.valueOf(cal.get(java.util.Calendar.YEAR));
                            }
                        %>
                        <div class="d-flex">
                            <input type="number" id="fnDia" class="form-control text-center mr-1" placeholder="DD" min="1" max="31" style="width:70px" value="<%=fnDia%>">
                            <input type="number" id="fnMes" class="form-control text-center mr-1" placeholder="MM" min="1" max="12" style="width:70px" value="<%=fnMes%>">
                            <input type="number" id="fnAnio" class="form-control text-center" placeholder="AAAA" min="1900" max="2100" style="width:90px" value="<%=fnAnio%>">
                        </div>
                    </div>
                </div>
            </div>
            <a href="listaPacientesServlet" class="btn btn-secondary">Cancelar</a>
            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
        </form>
    </div>
</div>

<%@include file="componentes/footer.jsp"%>

<script>
    document.getElementById('fnDia').addEventListener('input', function() {
        if (this.value.length === 2) document.getElementById('fnMes').focus();
    });
    document.getElementById('fnMes').addEventListener('input', function() {
        if (this.value.length === 2) document.getElementById('fnAnio').focus();
    });

    document.querySelector('form').addEventListener('submit', function() {
        var dia = document.getElementById('fnDia').value.padStart(2, '0');
        var mes = document.getElementById('fnMes').value.padStart(2, '0');
        var anio = document.getElementById('fnAnio').value;
        if (dia && mes && anio) {
            document.getElementById('fechaNacimiento').value = anio + '-' + mes + '-' + dia;
        }
    });
</script>