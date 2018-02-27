/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jk;
import javax.swing.JOptionPane;
import java.sql.DriverManager;
import java.sql.Connection;

/**
 *
 * @author Nigel Itotia
 */

public class db {
    
    Connection conn = null;
    
    public static Connection java_db(){
        try{
            
          Class.forName("org.sqlite.JDBC");
          
          String url = "jdbc:mysql://localhost/102366_oop1";
          String user = "root", pass = "mshamba";
          
          Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Nigel Itotia\\Documents\\NetBeansProjects\\Login2\\102366_oop1");
          JOptionPane.showMessageDialog(null, "OK");
          return conn;  
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
            return null;
        }
    }
    
}
