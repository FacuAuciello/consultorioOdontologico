
package persistencia;

public class ControladoraPersistencia {
    
    private PacienteJpaController pacienteJPA = new PacienteJpaController();
    private TurnoJpaController turnoJPA = new TurnoJpaController();
    private UsuarioLoginJpaController usuLoginJPA = new UsuarioLoginJpaController();

    public PacienteJpaController getPacienteJPA() {
        return pacienteJPA;
    }

    public TurnoJpaController getTurnoJPA() {
        return turnoJPA;
    }

    public UsuarioLoginJpaController getUsuLoginJPA() {
        return usuLoginJPA;
    }
    
    
    
}
