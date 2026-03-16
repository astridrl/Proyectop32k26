/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

/**
 *
 * @author Roli isaias Cedillo Chay 9959-24-1672
 */
import java.sql.Timestamp;

public class AsignacionPerfilUsuario{
   private int USU_CODIGO;
    private int PER_CODIGO;

    public AsignacionPerfilUsuario() {}

    public AsignacionPerfilUsuario(int USU_CODIGO, int PER_CODIGO) {
        this.USU_CODIGO = USU_CODIGO;
        this.PER_CODIGO = PER_CODIGO;
    }

    // Getters y Setters
    public int getUSU_CODIGO() {
        return USU_CODIGO;
    }

    public void setUSU_CODIGO(int USU_CODIGO) {
        this.USU_CODIGO = USU_CODIGO;
    }

    public int getPER_CODIGO() {
        return PER_CODIGO;
    }

    public void setPER_CODIGO(int PER_CODIGO) {
        this.PER_CODIGO = PER_CODIGO;
    }

    

}