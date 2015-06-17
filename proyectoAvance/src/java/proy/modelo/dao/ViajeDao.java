/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.Boleto;
import proy.modelo.entidad.Ciudad;
import proy.modelo.entidad.Conductor;
import proy.modelo.entidad.Persona;
import proy.modelo.entidad.Vehiculo;
import proy.modelo.entidad.Viajes;

/**
 *
 * @author CARSA COMPUTO
 */
public interface ViajeDao {
    
    public List<Ciudad> listarCiudad();
      public List<Persona> listarConductor();
    public boolean RegistrarViaje(Viajes viajes);
    public List<Vehiculo> listarVehiPlaca();
    public List<Conductor> listarConductorViaje(String id);
    public boolean eliminarViajes(String id_viajes);
    public List<Persona> buscarPasajero(String dni);
    public boolean RegistrarBoleto(Boleto boleto);
    
}
