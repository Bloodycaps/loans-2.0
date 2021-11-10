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
    private int idLoan;
    private String nameBook;
    private String loanDate;
    private String statusLoan;

    public LoanBooks(int idLoanBook, int idLoan, String nameBook, String loanDate, String statusLoan) {
        this.idLoanBook = idLoanBook;        
        this.idLoan = idLoan;
        this.nameBook = nameBook;
        this.loanDate = loanDate;
        this.statusLoan = statusLoan;
    }    

    public int getIdLoanBook() {
        return idLoanBook;
    }

    public void setIdLoanBook(int idLoanBook) {
        this.idLoanBook = idLoanBook;
    }

    public int getIdLoan() {
        return idLoan;
    }

    public void setIdLoan(int idLoan) {
        this.idLoan = idLoan;
    }

    public String getNameBook() {
        return nameBook;
    }

    public void setNameBook(String nameBook) {
        this.nameBook = nameBook;
    }

    public String getLoanDate() {
        return loanDate;
    }

    public void setLoanDate(String loanDate) {
        this.loanDate = loanDate;
    }

    public String getStatusLoan() {
        return statusLoan;
    }

    public void setStatusLoan(String statusLoan) {
        this.statusLoan = statusLoan;
    }

    @Override
    public String toString() {
        return "LoanBooks{" + "idLoanBook=" + idLoanBook + ", idLoan=" + idLoan + ", nameBook=" + nameBook + ", loanDate=" + loanDate + ", statusLoan=" + statusLoan + '}';
    }
    
    
    

}
