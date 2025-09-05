package com.elon.member.model.vo;

import java.sql.Date;

public class Book {
    private String bookNo;
    private String bookName;
    private String author;
    private String publisher;
    private String category;
    private int bookCount;
    private String bookIntroTitle;
    private String bookIntroContent;
    private Date enteranceDate;
    private String recommendedYN;
    private String advertiseYN;
    

    public Book() {
    }


	public Book(String bookNo, String bookName, String author, String publisher, String category, int bookCount,
			String bookIntroTitle, String bookIntroContent, String recommendedYN, String advertiseYN) {
		this.bookNo = bookNo;
		this.bookName = bookName;
		this.author = author;
		this.publisher = publisher;
		this.category = category;
		this.bookCount = bookCount;
		this.bookIntroTitle = bookIntroTitle;
		this.bookIntroContent = bookIntroContent;
		this.recommendedYN = recommendedYN;
		this.advertiseYN = advertiseYN;
		
	}

	public Book(String bookNo, String bookName,String recommendedYN, String advertiseYN) {
		this.bookNo = bookNo;
		this.bookName = bookName;
		this.recommendedYN = recommendedYN;
		this.advertiseYN = advertiseYN;
	}

	public Book(String bookName, String author, String publisher, String category, int bookCount,
			String bookIntroTitle, String bookIntroContent) {
		this.bookName = bookName;
		this.author = author;
		this.publisher = publisher;
		this.category = category;
		this.bookCount = bookCount;
		this.bookIntroTitle = bookIntroTitle;
		this.bookIntroContent = bookIntroContent;
	}


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


	public String getPublisher() {
		return publisher;
	}


	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getBookCount() {
		return bookCount;
	}


	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}


	public String getBookIntroTitle() {
		return bookIntroTitle;
	}


	public void setBookIntroTitle(String bookIntroTitle) {
		this.bookIntroTitle = bookIntroTitle;
	}


	public String getBookIntroContent() {
		return bookIntroContent;
	}


	public void setBookIntroContent(String bookIntroContent) {
		this.bookIntroContent = bookIntroContent;
	}


	public Date getEnteranceDate() {
		return enteranceDate;
	}


	public void setEnteranceDate(Date enteranceDate) {
		this.enteranceDate = enteranceDate;
	}


	public String getRecommendedYN() {
		return recommendedYN;
	}


	public void setRecommendedYN(String recommendedYN) {
		this.recommendedYN = recommendedYN;
	}


	public String getAdvertiseYN() {
		return advertiseYN;
	}


	public void setAdvertiseYN(String advertiseYN) {
		this.advertiseYN = advertiseYN;
	}


	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", bookName=" + bookName + ", author=" + author + ", publisher=" + publisher
				+ ", category=" + category + ", bookCount=" + bookCount + ", bookIntroTitle=" + bookIntroTitle
				+ ", bookIntroContent=" + bookIntroContent + ", enteranceDate=" + enteranceDate + ", recommendedYN="
				+ recommendedYN + ", advertiseYN=" + advertiseYN + "]";
	}

}