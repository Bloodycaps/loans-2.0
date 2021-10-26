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
public class Penalty {

    private int idPenalty;
    private Loan idLoan;
    private int amount;
    private String status;

    public Penalty(int idPenalty, Loan idLoan, int amount, String status) {
        this.idPenalty = idPenalty;
        this.idLoan = idLoan;
        this.amount = amount;
        this.status = status;
    }

    public int getIdPenalty() {
        return idPenalty;
    }

    public Loan getIdLoan() {
        return idLoan;
    }

    public int getAmount() {
        return amount;
    }

    public String getStatus() {
        return status;
    }

    public void setIdPenalty(int idPenalty) {
        this.idPenalty = idPenalty;
    }

    public void setIdLoan(Loan idLoan) {
        this.idLoan = idLoan;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 79 * hash + this.idPenalty;
        hash = 79 * hash + Objects.hashCode(this.idLoan);
        hash = 79 * hash + this.amount;
        hash = 79 * hash + Objects.hashCode(this.status);
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
        final Penalty other = (Penalty) obj;
        if (this.idPenalty != other.idPenalty) {
            return false;
        }
        if (this.amount != other.amount) {
            return false;
        }
        if (!Objects.equals(this.status, other.status)) {
            return false;
        }
        if (!Objects.equals(this.idLoan, other.idLoan)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Penalty{" + "idPenalty=" + idPenalty + ", idLoan=" + idLoan + ", amount=" + amount + ", status=" + status + '}';
    }

}
