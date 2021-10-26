/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.ucompensar.loanbooks.Models;

import java.util.Objects;
import sun.security.util.Password;

/**
 *
 * @author blakc
 */
public class User {
    private int idUser;
    private Client idClient;
    private Password password;
    private String rol;
    private String status;

    public User(int idUser, Client idClient, Password password, String rol, String status) {
        this.idUser = idUser;
        this.idClient = idClient;
        this.password = password;
        this.rol = rol;
        this.status = status;
    }

    public int getIdUser() {
        return idUser;
    }

    public Client getIdClient() {
        return idClient;
    }

    public Password getPassword() {
        return password;
    }

    public String getRol() {
        return rol;
    }

    public String getStatus() {
        return status;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public void setIdClient(Client idClient) {
        this.idClient = idClient;
    }

    public void setPassword(Password password) {
        this.password = password;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 29 * hash + this.idUser;
        hash = 29 * hash + Objects.hashCode(this.idClient);
        hash = 29 * hash + Objects.hashCode(this.password);
        hash = 29 * hash + Objects.hashCode(this.rol);
        hash = 29 * hash + Objects.hashCode(this.status);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final User other = (User) obj;
        if (this.idUser != other.idUser) {
            return false;
        }
        if (!Objects.equals(this.rol, other.rol)) {
            return false;
        }
        if (!Objects.equals(this.status, other.status)) {
            return false;
        }
        if (!Objects.equals(this.idClient, other.idClient)) {
            return false;
        }
        if (!Objects.equals(this.password, other.password)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "User{" + "idUser=" + idUser + ", idClient=" + idClient + ", password=" + password + ", rol=" + rol + ", status=" + status + '}';
    }
    
    

    
}
