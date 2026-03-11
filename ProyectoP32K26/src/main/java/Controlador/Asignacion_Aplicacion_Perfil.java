/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

/**
 *
 * @author Jorge Reyes
 */
public class Asignacion_Aplicacion_Perfil {
    public Asignacion_Aplicacion_Perfil(int AplCódigo, int UsuCódigo) {
        this.AplCódigo = AplCódigo;
        this.UsuCódigo = UsuCódigo;
    }

    public int getAplCódigo() {
        return AplCódigo;
    }

    public void setAplCódigo(int AplCódigo) {
        this.AplCódigo = AplCódigo;
    }

    public int getUsuCódigo() {
        return UsuCódigo;
    }

    public void setUsuCódigo(int UsuCódigo) {
        this.UsuCódigo = UsuCódigo;
    }

    @Override
    public String toString() {
        return "Asignacion_Aplicacion_Perfil{" + "AplCódigo=" + AplCódigo + ", UsuCódigo=" + UsuCódigo + '}';
    }


    int AplCódigo, UsuCódigo;
    
    
    public Asignacion_Aplicacion_Perfil(){
    
}
    
}
