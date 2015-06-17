/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.conexion;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author CARSA COMPUTO
 */
public class ConectarOracle {
     public  static Connection conectar()
    {
        Connection conn = null;
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","proyecto","proy");
        } catch (Exception e) {
            e.printStackTrace();
        }        
        
        return conn;
    }
    
}

    

