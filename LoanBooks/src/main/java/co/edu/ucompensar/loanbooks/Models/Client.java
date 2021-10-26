/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.ucompensar.loanbooks.Models;

import java.util.Objects;

/**
 *
 * @author blakc
 */
public class Client {
    private int idClient;
    private int document;
    private String name;
    private String lastName;
    private String status;

    public Client(int idClient, int document, String name, String lastName, String status) {
        this.idClient = idClient;
        this.document = document;
        this.name = name;
        this.lastName = lastName;
        this.status = status;
    }

    public int getIdClient() {
        return idClient;
    }

    public int getDocument() {
        return document;
    }

    public String getName() {
        return name;
    }

    public String getLastName() {
        return lastName;
    }

    public String getStatus() {
        return status;
    }

    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }

    public void setDocument(int document) {
        this.document = document;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 43 * hash + this.idClient;
        hash = 43 * hash + this.document;
        hash = 43 * hash + Objects.hashCode(this.name);
        hash = 43 * hash + Objects.hashCode(this.lastName);
        hash = 43 * hash + Objects.hashCode(this.status);
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
        final Client other = (Client) obj;
        if (this.idClient != other.idClient) {
            return false;
        }
        if (this.document != other.document) {
            return false;
        }
        if (!Objects.equals(this.name, other.name)) {
            return false;
        }
        if (!Objects.equals(this.lastName, other.lastName)) {
            return false;
        }
        if (!Objects.equals(this.status, other.status)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Client{" + "idClient=" + idClient + ", document=" + document + ", name=" + name + ", lastName=" + lastName + ", status=" + status + '}';
    }
    
    
    
}
