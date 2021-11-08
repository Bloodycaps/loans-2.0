/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ucompensar.loanbooks.Controller;

import co.edu.ucompensar.loanbooks.Models.Books;
import co.edu.ucompensar.loanbooks.Models.Client;
import co.edu.ucompensar.loanbooks.Models.User;
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
public class PostLoansBDBooks {
    
    /**
     * Metodo encargado de registrar libros en la base de datos.
     */
    public void readBook (){
        String spName ="sp_get_books";
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
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_get_books" + e.toString(), "Error", 0);
        }        
    }  
    
    /**
     * Metodo encargado de registrar libros en la base de datos.
     */
    public void insertBook (Books book){
        String spName ="sp_insert_books";
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "(?,?,?,?,?,?)}");
            
            statement.setString("@nameBook", book.getName());
            statement.setString("@author", book.getAuthor());
            statement.setString("@editorial", book.getEditorial());
            statement.setString("@category", book.getCategory());
            statement.setInt("@year", book.getYear());
            statement.setInt("@cuantity", book.getQuantity());
            
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
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_update_books" + e.toString(), "Error", 0);
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
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_delete_books" + e.toString(), "Error", 0);
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
            
            statement.setLong("@document", client.getDocument());
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
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_insert_clients" + e.toString(), "Error", 0);
        } 
    }
    
    /**
     * Metodo encargado de Mostrar clientes de la base de datos.
     */    
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
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_get_clients" + e.toString(), "Error", 0);
        }        
        return clientList;
    }
    
    /**
     * Metodo encargado de consultar clientes en la base de datos por documento.
     */
    public ArrayList getClient (long document){
        String spName ="sp_get_client";
        ArrayList<Client> clientList = new ArrayList<>(); 
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "(?)}");            
            
            statement.setLong("@document", document);
                                    
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                Client client = new Client(result.getInt(1), result.getInt(2), result.getString(3),result.getString(4), result.getString(5));                
                clientList.add(client);                
            }                          
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_get_client" + e.toString(), "Error", 0);
        } 
        
        return clientList;
    }

    /**
     * Metodo encargado de Actualizar clientes en la base de datos.
     */
    public void updateClients (Client client){
        String spName ="sp_update_clients";
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "(?,?,?,?,?)}");
            int response = 1;
            
            statement.setLong("@document", client.getDocument());
            statement.setString("@nameClient", client.getName());
            statement.setString("@lastNameClient", client.getLastName());
            statement.setString("@status", client.getStatus());
            statement.setInt("@idClient", client.getIdClient());
                        
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                response = result.getInt(1);             
            }
            
            if(response == 0){
                JOptionPane.showMessageDialog(null, "El usuario " + client.getDocument() + " se actualizo correctamente");
            }else{
                JOptionPane.showMessageDialog(null, "Ocurrio un error intentando actualizar el usuario", "Error", 0);                
            }
                        
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_update_clients" + e.toString(), "Error", 0);
        } 
    }
    
    /**
     * Metodo encargado de eliminar clientes en la base de datos.
     */
    public void deleteClients (int idClient){
        String spName ="sp_delete_clients";
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "(?)}");
            int response = 1;
            
            statement.setInt("@idClient", idClient);                        
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                response = result.getInt(1);             
            }
            
            if(response == 0){
                JOptionPane.showMessageDialog(null, "El usuario se Elimino correctamente");
            }else{
                JOptionPane.showMessageDialog(null, "Ocurrio un error intentando Eliminar el usuario", "Error", 0);                
            }
                        
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_delete_clients" + e.toString(), "Error", 0);
        } 
    }
    
    /**
     * Metodo encargado de traer los documentos de la base de datos.
     */    
    public ArrayList getDocuments(){
        String spName ="sp_get_documents";
        ArrayList<Long> documentList = new ArrayList<>(); 
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "}");
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                documentList.add(result.getLong(1));                                
            }                        
            result.close();           
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_get_documents" + e.toString(), "Error", 0);
        }        
        return documentList;
    }
    
    /**
     * Metodo encargado de registrar usuarios en la base de datos.
     */
    public void insertUsers (User user){
        String spName ="sp_insert_users";
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "(?,?,?,?)}");
            int response = 1;
            
            statement.setLong("@client", user.getIdClient());
            statement.setString("@password", user.getPassword());
            statement.setString("@rol", user.getRol());
            statement.setString("@status", user.getStatus());
                        
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                response = result.getInt(1);             
            }
            
            if(response == 0){
                JOptionPane.showMessageDialog(null, "El usuario " + user.getIdClient()+ " se registro correctamente");
            }else{
                JOptionPane.showMessageDialog(null, "Ocurrio un error intentando registrar el usuario", "Error", 0);                
            }
                        
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_insert_users" + e.toString(), "Error", 0);
        } 
    }
    
     /**
     * Metodo encargado de Mostrar usuarios de la base de datos.
     */    
    public ArrayList getUsers (){
        String spName ="sp_get_users";
        ArrayList<User> userList = new ArrayList<>(); 
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "}");
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                User user = new User(result.getInt(1), result.getInt(2), result.getString(3),result.getString(4),result.getString(5));                
                userList.add(user);                
            }                        
            result.close();           
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_get_users" + e.toString(), "Error", 0);
        }        
        return userList;
    }
    
    /**
     * Metodo encargado de consultar usuaruis en la base de datos por documento.
     */
    public ArrayList getUser (long document){
        String spName ="sp_get_user";
        ArrayList<User> userList = new ArrayList<>(); 
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "(?)}");            
            
            statement.setLong("@document", document);
                                    
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
               User user = new User(result.getInt(1), result.getInt(2), result.getString(3),result.getString(4),result.getString(5));                                
                userList.add(user);                
            }                          
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_get_user" + e.toString(), "Error", 0);
        } 
        
        return userList;
    }
    
    /**
     * Metodo encargado de Actualizar usuarios en la base de datos.
     */
    public void updateUsers (User user){
        String spName ="sp_update_data_users";
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "(?,?,?)}");
            int response = 1;
            
            statement.setString("@rol", user.getRol());
            statement.setString("@status", user.getStatus());
            statement.setInt("@idUser", user.getIdUser());
                        
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                response = result.getInt(1);             
            }
            
            if(response == 0){
                JOptionPane.showMessageDialog(null, "El usuario se actualizo correctamente");
            }else{
                JOptionPane.showMessageDialog(null, "Ocurrio un error intentando actualizar el usuario", "Error", 0);                
            }
                        
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_update_data_users" + e.toString(), "Error", 0);
        } 
    }
    
    /**
     * Metodo encargado de eliminar usuarios en la base de datos.
     */
    public void deleteUsers (int idUser){
        String spName ="sp_delete_users";
        try{
            Connection connection;
            DBConnection conn = new DBConnection();
            connection = conn.starConnection();        
            CallableStatement statement = connection.prepareCall("{call " + spName + "(?)}");
            int response = 1;
            
            statement.setInt("@idUser", idUser);                        
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                response = result.getInt(1);             
            }
            
            if(response == 0){
                JOptionPane.showMessageDialog(null, "El usuario se Elimino correctamente");
            }else{
                JOptionPane.showMessageDialog(null, "Ocurrio un error intentando Eliminar el usuario", "Error", 0);                
            }
                        
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Ocurrio un error en el Procedimiento Almacenado: sp_delete_users" + e.toString(), "Error", 0);
        } 
    }
    
}