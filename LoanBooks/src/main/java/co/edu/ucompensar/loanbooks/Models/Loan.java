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
    private User idUser;
    private Date loanDate;
    private Date expirationDate;
    private String loanStatus;

    public Loan(int idLoan, User idUser, Date loanDate, Date expirationDate, String loanStatus) {
        this.idLoan = idLoan;
        this.idUser = idUser;
        this.loanDate = loanDate;
        this.expirationDate = expirationDate;
        this.loanStatus = loanStatus;
    }

    public int getIdLoan() {
        return idLoan;
    }

    public User getIdUser() {
        return idUser;
    }

    public Date getLoanDate() {
        return loanDate;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public String getLoanStatus() {
        return loanStatus;
    }

    public void setIdLoan(int idLoan) {
        this.idLoan = idLoan;
    }

    public void setIdUser(User idUser) {
        this.idUser = idUser;
    }

    public void setLoanDate(Date loanDate) {
        this.loanDate = loanDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public void setLoanStatus(String loanStatus) {
        this.loanStatus = loanStatus;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + this.idLoan;
        hash = 89 * hash + Objects.hashCode(this.idUser);
        hash = 89 * hash + Objects.hashCode(this.loanDate);
        hash = 89 * hash + Objects.hashCode(this.expirationDate);
        hash = 89 * hash + Objects.hashCode(this.loanStatus);
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
        final Loan other = (Loan) obj;
        if (this.idLoan != other.idLoan) {
            return false;
        }
        if (!Objects.equals(this.loanStatus, other.loanStatus)) {
            return false;
        }
        if (!Objects.equals(this.idUser, other.idUser)) {
            return false;
        }
        if (!Objects.equals(this.loanDate, other.loanDate)) {
            return false;
        }
        if (!Objects.equals(this.expirationDate, other.expirationDate)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Loan{" + "idLoan=" + idLoan + ", idUser=" + idUser + ", loanDate=" + loanDate + ", expirationDate=" + expirationDate + ", loanStatus=" + loanStatus + '}';
    }
    
    
    
}
