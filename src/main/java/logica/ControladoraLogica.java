
package logica;

import Entidades.UsuarioLogin;
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
}

