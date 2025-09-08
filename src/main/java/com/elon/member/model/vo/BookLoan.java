package com.elon.member.model.vo;

import java.sql.Date;

public class BookLoan {
	private String bookNo;
	private String bookName;
    private String author;
    private Date lendDate;
    private Date returnDate;
    
    public BookLoan() {
    	
    }
    
    public BookLoan(String bookNo, String bookName, String author, String lendDate, String returnDate) {
		
	}

	// Getter & Setter
    public String getBookNo() { 
    	return bookNo; 
    	}
    public void setBookNo(String bookNo) { 
    	this.bookNo = bookNo; 
    }

    public String getBookName() {
    	return bookName;
    }
    
    public void setBookName(String bookName) {
    	this.bookName = bookName;
    }
    
    public String getAuthor() { 
    	return author; 
    }
    public void setAuthor(String author) { 
    	this.author = author; 
    }

    public Date getLendDate() { 
    	return lendDate; 
    }
    public void setLendDate(Date lendDate) { 
    	this.lendDate = lendDate; 
    }

    public Date getReturnDate() {
    	return returnDate;
    }
    public void setReturnDate(Date returnDate) {
    	this.returnDate = returnDate;
    }
    
    @Override
	public String toString() {
		return "BookLoan [bookNo=" + bookNo + ", author=" + author + ", lendDate=" + lendDate + ", returnDate="
				+ returnDate + "]";
	}

}
