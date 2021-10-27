/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucompensar.loanbooks.Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/**
 *
 * @author Santiago
 */
public class DBConnection {
    
    Connection connection = null;
    
    private static String USER = "loans";
    private static String PASSWORD = "loans";
    private static String DATABASE = "Loans";
    private static String IP = "localhost";
    private static String PORT = "1433";       
    
    public Connection starConnection(){
        try{
            String command = "jdbc:sqlserver://" + IP + ":" + PORT + ";databaseName=" + DATABASE;
            connection = DriverManager.getConnection(command,USER,PASSWORD);           
            JOptionPane.showMessageDialog(null, "Se conecto correctamente a Loans");
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "No se establecio correctamente la conexión :" + e.toString(), "Error", 0);
        }
        return connection;
    }
        
    
}
