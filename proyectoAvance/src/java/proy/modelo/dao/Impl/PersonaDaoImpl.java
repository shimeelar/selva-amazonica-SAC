 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao.Impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import proy.modelo.conexion.ConectarOracle;
import proy.modelo.dao.personaDao;
import proy.modelo.entidad.Color;
import proy.modelo.entidad.Conductor;
import proy.modelo.entidad.Marca;
import proy.modelo.entidad.Modelo;
import proy.modelo.entidad.Pasajero;
import proy.modelo.entidad.Persona;
import proy.modelo.entidad.Usuario;
import proy.modelo.entidad.Vehiculo;
import proy.modelo.entidad.Viajes;

/**
 *
 * @author CARSA COMPUTO
 */
public class PersonaDaoImpl implements personaDao {

   
    public Connection open() {
        return ConectarOracle.conectar();
    }

    @Override
    public boolean agregarpersona(Persona persona) {

        boolean estado = false;
        Statement st = null;
        String query = "insert into persona (nombres,"
                + "apellidos,"
                + "dni,"
                + "genero,"
                + "fec_nacimiento,"
                + "direccion,"
                + "telefono)values('"
                + persona.getNombres() + "','"
                + persona.getApellidos() + "','"
                + persona.getDni() + "','"
                + persona.getGenero() + "','"
                + persona.getFecNacimiento() + "','"
                + persona.getDireccion() + "','"
                + persona.getTelefono() + "')";

        try {
            st = open().createStatement();
            st.executeUpdate(query);
            open().commit();
            open().close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                open().rollback();
                estado = false;
                open().close();
            } catch (Exception ex) {
            }
        }
        return estado;
    }

    @Override
    public List<Modelo> listarModelo() {
        List<Modelo> lista = new ArrayList<>();
        Statement st = null;
        ResultSet rs = null;
        String sql = "select *from modelo";
        Modelo modelo = null;
        try {
            st = open().createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                modelo = new Modelo();
                modelo.setIdModelo(rs.getString("id_modelo"));
                modelo.setNombre(rs.getString("nombre"));
                lista.add(modelo);

            }
            open().close();

        } catch (Exception e) {
            e.printStackTrace();
            try {
                open().close();
            } catch (Exception ex) {
            }
        }
        return lista;
    }

    @Override
    public List<Marca> listarMarca() {
        List<Marca> lista = new ArrayList<>();
        Statement st = null;
        ResultSet rs = null;
        String sql = "select * from marca";
        Marca marca = null;
        try {
            st = open().createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                marca = new Marca();
                marca.setIdMarca(rs.getString("id_marca"));
                marca.setNombre(rs.getString("nombre"));
                lista.add(marca);

            }
            open().close();

        } catch (Exception e) {
            e.printStackTrace();
            try {
                open().close();
            } catch (Exception ex) {
            }
        }
        return lista;
    }

    @Override
    public List<Color> listarColor() {
        List<Color> lista = new ArrayList<>();
        Statement st = null;
        ResultSet rs = null;
        String sql = "select * from color";
        Color color = null;
        try {
            st = open().createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                color = new Color();
                color.setIdColor(rs.getString("id_color"));
                color.setNombre(rs.getString("nombre"));
                lista.add(color);

            }
            open().close();

        } catch (Exception e) {
            e.printStackTrace();
            try {
                open().close();
            } catch (Exception ex) {
            }
        }
        return lista;
    }

    @Override
    public boolean insertarVehiculo(Vehiculo vehiculo) {
        boolean estado = false;
        Statement st = null;
        String query = "insert into vehiculo(id_modelo,"
                + "id_color,"
                + "id_marca,"
                + "nro_placa) values('"
                + vehiculo.getIdModelo()
                + "','" +vehiculo.getIdColor()
                + "','" +vehiculo.getIdMarca()
                + "','" +vehiculo.getNroPlaca() + "')";
        try {
            st = open().createStatement();
            st.executeUpdate(query);
            open().commit();
            open().close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                open().rollback();
                open().close();
                estado = false;
            } catch (Exception ex) {
            }
        }

        return estado;
    }

    @Override
    public List<Vehiculo> listarVehiculo() {

        Statement st;
        ResultSet rs;
        String sql = "select NRO_PLACA from vehiculo" ;
        List<Vehiculo> lista = new ArrayList<Vehiculo>();
        Vehiculo vehiculo = null;
        try {
            st = open().createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                vehiculo = new Vehiculo();

                vehiculo.setNroPlaca(rs.getString("nro_placa"));

                lista.add(vehiculo);
            }
            open().close();
        } catch (Exception e) {
            try {
                e.printStackTrace();
                open().close();
            } catch (SQLException ex) {
                Logger.getLogger(PersonaDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }
    public boolean regViajes(Viajes viajes) {
        boolean estado = false;
        Statement st = null;
        String query = "insert into veh(id_modelo,"
                + "id_color,"
                + "id_marca,"
                + "nro_placa) values('"
                + viajes.getIdConductor()
                + "','" +viajes.getIdVehiculo()
                + "','" +viajes.getIdCiudad()
                 + "','" +viajes.getIdCiudaddestino()
                 + "','" +viajes.getHoraViaje()
                + "','" +viajes.getFechaViaje()+"')";
        try {
            st = open().createStatement();
            st.executeUpdate(query);
            open().commit();
            open().close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                open().rollback();
                open().close();
                estado = false;
            } catch (Exception ex) {
            }
        }

        return estado;
    }
    @Override
    public Persona Obtenerid(String dni) {
        
        Persona persona = null;
        Statement st = null;
        ResultSet rs=null;
        String query = "select id_persona from persona where dni='"+dni+"'";
        try {
            st = open().createStatement();
            rs=st.executeQuery(query);
            if (rs.next()) {
                persona = new Persona();
                persona.setIdPersona(rs.getString("id_persona"));
            }
            open().close();
            
        } catch (Exception e) {
            e.printStackTrace();
            try {
                open().close();
            } catch (Exception ex) {
            }
        }
        return persona;
    }

    @Override
    public boolean insertarUsuario(Usuario usuario) {
              boolean estado = false;
        Statement st = null;
        String query = "insert into usuario(id_usuario,"
                + "login,"
                + "password) values('"
                + usuario.getIdUsuario()
                + "','" +usuario.getLogin()
                + "','" +usuario.getPassword()+ "')";
        try {
            st = open().createStatement();
            st.executeUpdate(query);
            open().commit();
            open().close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                open().rollback();
                open().close();
                estado = false;
            } catch (Exception ex) {
            }
        }

        return estado;
    }

    @Override
    public boolean insertarPasajero(Pasajero pasajero) {
              boolean estado = false;
        Statement st = null;
        String query = "insert into pasajero values('"+pasajero.getIdPasajero()+ "')";
        try {
            st = open().createStatement();
            st.executeUpdate(query);
            open().commit();
            open().close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                open().rollback();
                open().close();
                estado = false;
            } catch (Exception ex) {
            }
        }

        return estado;
    }

    @Override
    public boolean insertarConductor(Conductor conductor) {
              boolean estado = false;
        Statement st = null;
        String query = "insert into conductor(id_conductor,"
                + "nro_licencia) values('"
                + conductor.getIdConductor()
                + "','" +conductor.getNroLicencia() + "')";
        try {
            st = open().createStatement();
            st.executeUpdate(query);
            open().commit();
            open().close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                open().rollback();
                open().close();
                estado = false;
            } catch (Exception ex) {
            }
        }

        return estado;
    }

    @Override
    public boolean deletePersona(String id) {
      boolean estado=false;    
    Statement st=null;    
    String query="DELETE FROM persona WHERE id_persona="+id;
        try {
            st=open().createStatement();
            st.executeUpdate(query);
            open().commit();
            open().close();
            estado=true;
        } catch (Exception e) {
            e.printStackTrace();
            estado=false;
            try {
                open().rollback();
                open().close();
            } catch (Exception ex) {
            }
        }
        return estado;
    }

    @Override
    public List<Persona> listarPersona() {
  Statement st = null;
        ResultSet rs = null;
        String query = "SELECT * FROM persona";
        Persona persona = null;
        List<Persona> lista = new ArrayList<>();
        try {
            st = open().createStatement();
            rs = st.executeQuery(query);
             open().close();
            while (rs.next()) {   
                persona = new Persona();
                persona.setIdPersona(rs.getString("id_persona"));
                persona.setNombres(rs.getString("nombre"));
                persona.setApellidos(rs.getString("apellido"));
                persona.setDni(rs.getString("dni"));
                persona.setDireccion(rs.getString("direccion"));  
                persona.setTelefono(rs.getString("telefono"));
                persona.setFecNacimiento(rs.getString("fecha_nacimiento"));
               persona.setDireccion(rs.getString("direccion"));
                
                lista.add(persona);
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                open().close();
            } catch (Exception ex) {
            }
        }
        return lista;
    }

    
      
       
    

}