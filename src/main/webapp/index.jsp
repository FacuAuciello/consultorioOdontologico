<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="componentes/header.jsp"%>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Agenda</h1>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Semana actual</h6>
    </div>
    <div class="card-body p-0">
        <div id="calendario"></div>
    </div>
</div>

<%@include file="componentes/footer.jsp"%>

<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales/es.js"></script>

<style>
    #calendario {
        font-family: 'Nunito', sans-serif;
        font-size: 0.9em;
        padding: 15px;
    }
    .fc-timegrid-slot {
        height: 28px !important;
        cursor: pointer;
        background-color: white !important;
        border-bottom: 1px solid #e3e6f0 !important;
    }
    .fc-timegrid-slot-minor {
        border-top-style: dashed !important;
        border-top-color: #dddfeb !important;
    }
    .fc-timegrid-slot-label {
        font-size: 1em !important;
        color: #666 !important;
        vertical-align: top !important;
    }
    .fc-timegrid-now-indicator-container {
        display: none !important;
    }
    .fc-now-indicator {
        display: none !important;
    }
    .fc-bg-event {
        display: none !important;
    }
    .fc-highlight {
        background-color: #eaecf4 !important;
    }
    .fc-event {
        border-radius: 6px !important;
        border: none !important;
        padding: 2px 6px !important;
        font-size: 0.95em !important;
        background-color: #4e73df !important;
        cursor: pointer !important;
        font-family: 'Nunito', sans-serif !important;
    }
    .fc-event:hover {
        background-color: #2e59d9 !important;
        transform: scale(1.02);
        transition: all 0.1s ease;
    }
    .fc-col-header-cell {
        background-color: #4e73df;
        color: white !important;
        padding: 8px !important;
    }
    .fc-col-header-cell a {
        color: white !important;
        font-weight: bold;
        font-family: 'Nunito', sans-serif !important;
    }
    .fc-toolbar-title {
        font-size: 1.2em !important;
        color: #4e73df;
        font-weight: bold;
        font-family: 'Nunito', sans-serif !important;
    }
    .fc-button-primary {
        background-color: #4e73df !important;
        border-color: #4e73df !important;
        font-family: 'Nunito', sans-serif !important;
    }
    .fc-button-primary:hover {
        background-color: #2e59d9 !important;
        border-color: #2e59d9 !important;
    }
    .fc-timegrid-col {
        border-left: 1px solid #b0b7d4 !important;
        border-right: 1px solid #b0b7d4 !important;
    }
    .fc-scrollgrid td, .fc-scrollgrid th {
        border-color: #b0b7d4 !important;
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendario');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'timeGridWeek',
            locale: 'es',
            slotMinTime: '08:00:00',
            slotMaxTime: '12:31:00',
            slotDuration: '00:30:00',
            slotLabelInterval: '00:30:00',
            expandRows: true,
            hiddenDays: [0, 6],
            nowIndicator: false,
            allDaySlot: false,
            height: 'auto',
            selectable: true,
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'timeGridWeek'
            },
            slotLabelFormat: {
                hour: '2-digit',
                minute: '2-digit',
                hour12: false
            },
            eventTimeFormat: {
                hour: '2-digit',
                minute: '2-digit',
                hour12: false
            },
            events: [
                <c:forEach var="t" items="${turnos}">
                {
    id: '${t.id}',
    title: '${t.paciente.apellido}, ${t.paciente.nombre}',
    start: '<fmt:formatDate value="${t.fechaHora}" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${t.fechaHora}" pattern="HH:mm:ss"/>',
end: '<fmt:formatDate value="${t.fechaFin}" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${t.fechaFin}" pattern="HH:mm:ss"/>',
url: 'editarTurnoServlet?id=${t.id}',
    backgroundColor: '#4e73df',
    borderColor: '#4e73df'
},
                </c:forEach>
            ],
            dateClick: function(info) {
                window.location.href = 'altaTurnoServlet?fechaHora=' + info.dateStr;
            },
            eventClick: function(info) {
                info.jsEvent.preventDefault();
                window.location.href = info.event.url;
            }
        });
        calendar.render();
    });
</script>