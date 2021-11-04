/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucompensar.loanbooks.Controller;

import co.edu.ucompensar.loanbooks.Models.Client;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
            
            statement.setInt("@idBook", idBook);
                
            statement.execute();
            
            System.out.println("Ok");            
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_insert_books" + e.toString(), "Error", 0);
        } 
    }
    
    /**
     * Metodo encargado de registrar clientes en la base de datos.
     */
    public void insertClients (Client client){
        String spName ="sp_insert_clients";
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "(?,?,?,?)}");
            int response = 1;
            
            statement.setInt("@document", client.getDocument());
            statement.setString("@nameClient", client.getName());
            statement.setString("@lastNameCliente", client.getLastName());
            statement.setString("@status", client.getStatus());
                        
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                response = result.getInt(1);             
            }
            
            if(response == 0){
                JOptionPane.showMessageDialog(null, "El usuario " + client.getDocument() + " se registro correctamente");
            }else{
                JOptionPane.showMessageDialog(null, "Ocurrio un error intentando registrar el usuario", "Error", 0);                
            }
                        
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_insert_books" + e.toString(), "Error", 0);
        } 
    }
    
    public ArrayList getClients (){
        String spName ="sp_get_clients";
        ArrayList<Client> clientList = new ArrayList<>(); 
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "}");
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                Client client = new Client(result.getInt(1), result.getInt(2), result.getString(3),result.getString(4), result.getString(5));                
                clientList.add(client);                
            }                        
            result.close();           
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_read_books" + e.toString(), "Error", 0);
        }        
        return clientList;
    }
}
