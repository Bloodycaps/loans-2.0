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
public class LoanBooks {

    private int idLoanBook;
    private Books idBook;
    private Loan idLoan;

    public LoanBooks(int idLoanBook, Books idBook, Loan idLoan) {
        this.idLoanBook = idLoanBook;
        this.idBook = idBook;
        this.idLoan = idLoan;
    }

    public int getIdLoanBook() {
        return idLoanBook;
    }

    public Books getIdBook() {
        return idBook;
    }

    public Loan getIdLoan() {
        return idLoan;
    }

    public void setIdLoanBook(int idLoanBook) {
        this.idLoanBook = idLoanBook;
    }

    public void setIdBook(Books idBook) {
        this.idBook = idBook;
    }

    public void setIdLoan(Loan idLoan) {
        this.idLoan = idLoan;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 41 * hash + this.idLoanBook;
        hash = 41 * hash + Objects.hashCode(this.idBook);
        hash = 41 * hash + Objects.hashCode(this.idLoan);
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
        final LoanBooks other = (LoanBooks) obj;
        if (this.idLoanBook != other.idLoanBook) {
            return false;
        }
        if (!Objects.equals(this.idBook, other.idBook)) {
            return false;
        }
        if (!Objects.equals(this.idLoan, other.idLoan)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "LoanBooks{" + "idLoanBook=" + idLoanBook + ", idBook=" + idBook + ", idLoan=" + idLoan + '}';
    }

}
