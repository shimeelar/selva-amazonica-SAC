/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.Ciudad;
import proy.modelo.entidad.Color;
import proy.modelo.entidad.Conductor;
import proy.modelo.entidad.Marca;
import proy.modelo.entidad.Modelo;
import proy.modelo.entidad.Pasajero;
import proy.modelo.entidad.Persona;
import proy.modelo.entidad.Usuario;
import proy.modelo.entidad.Vehiculo;
import proy.modelo.entidad.Viajes;

public interface personaDao {
    

    public boolean agregarpersona(Persona persona);
    public List<Modelo> listarModelo();
    public List<Marca> listarMarca();
    public List<Color> listarColor();
    public boolean insertarVehiculo(Vehiculo vehiculo);
    public List<Vehiculo> listarVehiculo();
    public Persona Obtenerid(String dni);
    public boolean insertarUsuario(Usuario usuario);
    public boolean insertarPasajero(Pasajero pasajero);
    public boolean insertarConductor(Conductor conductor);
    public boolean regViajes (Viajes viajes);
    public boolean deletePersona(String id);
    public List<Persona> listarPersona();
  
    
   
}
