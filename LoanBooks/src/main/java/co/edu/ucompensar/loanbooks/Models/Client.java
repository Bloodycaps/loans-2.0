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

    public Client(int document, String name, String lastName, String status) {
        this.idClient = idClient;
        this.document = document;
        this.name = name;
        this.lastName = lastName;
        this.status = status;
    }
    
    public Client(int idClient,int document, String name, String lastName, String status) {
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
    public String toString() {
        return "Client{" + "idClient=" + idClient + ", document=" + document + ", name=" + name + ", lastName=" + lastName + ", status=" + status + '}';
    }
    
    
    
}
