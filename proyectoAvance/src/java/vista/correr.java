
package vista;

import proy.modelo.dao.Impl.PersonaDaoImpl;
import proy.modelo.dao.personaDao;
import proy.modelo.entidad.Persona;
import proy.modelo.entidad.Vehiculo;

public class correr {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
      
        
        correr corr = new correr();
//        corr.agregpersona();
           corr.insertarvehiculo();
        
    }
    public void agregpersona()
    {
        personaDao personaDao = new PersonaDaoImpl();
        
        Persona persona = new Persona();
        
        persona.setNombres("ped");
        persona.setApellidos("gomez ");
        persona.setDni("79823642");
        persona.setGenero("M");
        persona.setFecNacimiento("09/12/1990");
        persona.setDireccion("sdfgsdfg");
        persona.setTelefono("123366789");
        
        
        if(personaDao.agregarpersona(persona)){
            System.out.println("se agrego");
        }else{System.out.println("no se agrego");}
    }
    
    public void insertarvehiculo()
    {
        personaDao dao=new PersonaDaoImpl();
        Vehiculo vehiculo = new Vehiculo();
        
//        vehiculo.setIdVehiculo("1");
        vehiculo.setIdModelo("0004");
        vehiculo.setIdMarca("0003");
        vehiculo.setIdColor("0005");
        vehiculo.setNroPlaca("kadaksd"); 
        
         if(dao.insertarVehiculo(vehiculo))
         {
             System.out.println("se inserto");  
         }else{System.out.println("no se inserto ");}
         
         
        
    }
}
