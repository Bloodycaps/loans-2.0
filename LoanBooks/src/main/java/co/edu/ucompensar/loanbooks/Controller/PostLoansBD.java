/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucompensar.loanbooks.Controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Santiago
 */
public class PostLoansBD {
    
    /**
     * Metodo encargado de registrar libros en la base de datos.
     */
    public void readBook (){
        String spName ="sp_read_books";
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "}");
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                System.out.println(result.getString(1)+" "+result.getString(2)+" "+result.getString(3)+" ");
            }
            
            result.close();           
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_read_books" + e.toString(), "Error", 0);
        }        
    }  
    
    /**
     * Metodo encargado de registrar libros en la base de datos.
     */
    public void insertBook (String nameBook, String author, String editorial,
            String category, int year, int cuantity){
        String spName ="sp_insert_books";
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "(?,?,?,?,?,?)}");
            
            statement.setString("@nameBook", nameBook);
            statement.setString("@author", author);
            statement.setString("@editorial", editorial);
            statement.setString("@category", category);
            statement.setInt("@year", year);
            statement.setInt("@cuantity", cuantity);
            
            statement.execute();
            
            System.out.println("Ok");            
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_insert_books" + e.toString(), "Error", 0);
        } 
    }
    
    public void updateBook (String nameBook, String author, String editorial,
            String category, int year, int cuantity, int idBook){
        String spName ="sp_update_books";
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "(?,?,?,?,?,?,?)}");
            
            statement.setString("@nameBook", nameBook);
            statement.setString("@author", author);
            statement.setString("@editorial", editorial);
            statement.setString("@category", category);
            statement.setInt("@year", year);
            statement.setInt("@cuantity", cuantity);
            statement.setInt("@idBook", idBook);
            
            statement.execute();
            
            System.out.println("Ok");            
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_insert_books" + e.toString(), "Error", 0);
        } 
    }
    public void deleteBook (int idBook ){
        String spName ="sp_delete_books";
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "(?)}");
            
            statement.setString("@idBook", idBook);
                
            statement.execute();
            
            System.out.println("Ok");            
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_insert_books" + e.toString(), "Error", 0);
        } 
    }
    
    
}
