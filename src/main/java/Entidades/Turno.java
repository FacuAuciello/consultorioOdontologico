
package Entidades;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Turno implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaHora;
    private String duracionTurno;
    private String monto;
    private String notasOdontologicas;
    @ManyToOne
    private Paciente paciente;

    public Turno() {
    }

    public Turno(Date fechaHora, String duracionTurno, String monto, String notasOdontologicas, Paciente paciente) {
        this.fechaHora = fechaHora;
        this.duracionTurno = duracionTurno;
        this.monto = monto;
        this.notasOdontologicas = notasOdontologicas;
        this.paciente = paciente;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getDuracionTurno() {
        return duracionTurno;
    }

    public void setDuracionTurno(String duracionTurno) {
        this.duracionTurno = duracionTurno;
    }

    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
    }

    public String getNotasOdontologicas() {
        return notasOdontologicas;
    }

    public void setNotasOdontologicas(String notasOdontologicas) {
        this.notasOdontologicas = notasOdontologicas;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }
    
    
    
}
