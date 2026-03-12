
package logica;

import Entidades.Paciente;
import Entidades.Turno;
import Entidades.UsuarioLogin;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import persistencia.ControladoraPersistencia;

public class ControladoraLogica {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public boolean verificarLogin(String usuario, String contrasenia) {
        
        /*en la lista guardo todos los usuarios que existen el la BD
        control persis me llama a el jpa controller de usuario login, 
        donde este tiene el meotod para buscar y consular a la BD, devulve la lista*/
        
        List<UsuarioLogin> usuarios = controlPersis.getUsuLoginJPA().findUsuarioLoginEntities();
        for(UsuarioLogin usu : usuarios){
           if(usu.getNombreUsuario().equals(usuario) && usu.getContrasenia().equals(contrasenia))
               return true;
        }
        return false;
    }
    
    //crud paciente
    public void guardarPaciente(Paciente paciente) {
        
        controlPersis.getPacienteJPA().create(paciente);
        
    }
    
    public  List<Paciente> traerPacientes (){
        return controlPersis.getPacienteJPA().findPacienteEntities();
    }
    
    public void eliminarPaciente(int id) throws Exception {
    
        controlPersis.getPacienteJPA().destroy(id);
    }
    
    public Paciente buscarPaciente(int id) {
    
        return controlPersis.getPacienteJPA().findPaciente(id);
    }

    public void editarPaciente(Paciente paciente) throws Exception {
        
        controlPersis.getPacienteJPA().edit(paciente);
    }
    
    // crud turnos
    
    public void guardarTurno(Turno turno) {
    
        controlPersis.getTurnoJPA().create(turno);
}

    public List<Turno> traerTurnos() {
        
        return controlPersis.getTurnoJPA().findTurnoEntities();
}

    public Turno buscarTurno(int id) {
    
        return controlPersis.getTurnoJPA().findTurno(id);
}

    public void editarTurno(Turno turno) throws Exception {
    
        controlPersis.getTurnoJPA().edit(turno);
}

    public void eliminarTurno(int id) throws Exception {
    
        controlPersis.getTurnoJPA().destroy(id);
}

    public List<Turno> traerTurnosDeHoy() {
        List<Turno> todos = controlPersis.getTurnoJPA().findTurnoEntities();
        List<Turno> hoy = new ArrayList<>();
        Calendar cal = Calendar.getInstance();
        for (Turno t : todos) {
            if (t.getFechaHora() != null) {
                Calendar tCal = Calendar.getInstance();
                tCal.setTime(t.getFechaHora());
            
                if (tCal.get(Calendar.DAY_OF_YEAR) == cal.get(Calendar.DAY_OF_YEAR)
                    && tCal.get(Calendar.YEAR) == cal.get(Calendar.YEAR)) {
                hoy.add(t);
            }
        }
    }
    return hoy;
}
}

