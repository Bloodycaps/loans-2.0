/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.ucompensar.loanbooks.Models;

import java.util.Date;

import java.util.Objects;

/**
 *
 * @author blakc
 */
public class Loan {
    private int idLoan;
    private long user;
    private String  loanDate;
    private String  expirationDate;
    private String loanStatus;

    public Loan(int idLoan, long user, String  loanDate, String  expirationDate, String loanStatus) {
        this.idLoan = idLoan;
        this.user = user;
        this.loanDate = loanDate;
        this.expirationDate = expirationDate;
        this.loanStatus = loanStatus;
    }
    
    public Loan(long user, String  loanDate, String  expirationDate, String loanStatus) {        
        this.user = user;
        this.loanDate = loanDate;
        this.expirationDate = expirationDate;
        this.loanStatus = loanStatus;
    }

    public int getIdLoan() {
        return idLoan;
    }

    public long getUser() {
        return user;
    }

    public String  getLoanDate() {
        return loanDate;
    }

    public String  getExpirationDate() {
        return expirationDate;
    }

    public String getLoanStatus() {
        return loanStatus;
    }

    public void setIdLoan(int idLoan) {
        this.idLoan = idLoan;
    }

    public void setUser(long user) {
        this.user = user;
    }

    public void setLoanDate(String  loanDate) {
        this.loanDate = loanDate;
    }

    public void setExpirationDate(String  expirationDate) {
        this.expirationDate = expirationDate;
    }

    public void setLoanStatus(String loanStatus) {
        this.loanStatus = loanStatus;
    }

   

    @Override
    public String toString() {
        return "Loan{" + "idLoan=" + idLoan + ", idUser=" + user + ", loanDate=" + loanDate + ", expirationDate=" + expirationDate + ", loanStatus=" + loanStatus + '}';
    }
    
    
    
}
