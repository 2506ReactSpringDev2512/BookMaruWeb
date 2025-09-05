package com.elon.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.elon.member.model.vo.Book;

public class BookDAO {

    public int insertBook(Book book, Connection conn) throws SQLException {
        PreparedStatement pstmt = null;
        int result = 0;
        String query = "INSERT INTO BOOK_TBL VALUES(?,?,?,?,?,?,?,?,SYSDATE,?,?)";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, book.getBookNo());
        pstmt.setString(2, book.getBookName());
        pstmt.setString(3, book.getAuthor());
        pstmt.setString(4, book.getPublisher());
        pstmt.setString(5, book.getCategory());
        pstmt.setInt(6, book.getBookCount());
        pstmt.setString(7, book.getBookIntroTitle());
        pstmt.setString(8, book.getBookIntroContent());
        pstmt.setString(9, book.getRecommendedYN());
        pstmt.setString(10, book.getAdvertiseYN());
        result = pstmt.executeUpdate();
        pstmt.close();
        conn.close();
        return result;
    }

    public List<Book> selectAllBooks(Connection conn) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Book> bList = new ArrayList<>();
        String query = "SELECT BOOK_NO, BOOK_NAME, RECOMMENDED_YN, ADVERTISE_YN FROM BOOK_TBL";
        pstmt = conn.prepareStatement(query);
        rset = pstmt.executeQuery();
        while(rset.next()) {
            String bookNo   = rset.getString("BOOK_NO");
            String bookName   = rset.getString("BOOK_NAME");
            String recommendedYN = rset.getString("RECOMMENDED_YN");
            String advertiseYN = rset.getString("ADVERTISE_YN");
            Book book = new Book(bookNo, bookName, recommendedYN, advertiseYN);
            bList.add(book);
        }
        rset.close();
        pstmt.close();
        return bList;
    }

	public List<Book> infoBooks(String bNo, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Book> bList = new ArrayList<>();
        String query = "SELECT BOOK_NAME, AUTHOR, PUBLISHER, CATEGORY, BOOK_COUNT, BOOK_INTRO_TITLE, BOOK_INTRO_CONTENT FROM BOOK_TBL WHERE BOOK_NO = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, bNo);
        rset = pstmt.executeQuery();
        while(rset.next()) {
            String bookName   = rset.getString("BOOK_NAME");
            String author   = rset.getString("AUTHOR");
            String publisher = rset.getString("PUBLISHER");
            String category = rset.getString("CATEGORY");
            int bookCount = rset.getInt("BOOK_COUNT");
            String bookIntroTitle = rset.getString("BOOK_INTRO_TITLE");
            String bookIntroContent = rset.getString("BOOK_INTRO_CONTENT");
            Book book = new Book(bookName, author, publisher, category, bookCount, bookIntroTitle, bookIntroContent);
            bList.add(book);
        }
        rset.close();
        pstmt.close();
        conn.close();
        return bList;
	}

	public int updateBook(String bNo, Book book, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
        int result = 0;
        String query = "UPDATE BOOK_TBL SET BOOK_NAME = ?, AUTHOR =?, PUBLISHER = ?, CATEGORY = ?, BOOK_COUNT = ?, BOOK_INTRO_TITLE = ?, BOOK_INTRO_CONTENT = ? WHERE BOOK_NO = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, book.getBookName());
        pstmt.setString(2, book.getAuthor());
        pstmt.setString(3, book.getPublisher());
        pstmt.setString(4, book.getCategory());
        pstmt.setInt(5, book.getBookCount());
        pstmt.setString(6, book.getBookIntroTitle());
        pstmt.setString(7, book.getBookIntroContent());
        pstmt.setString(8, bNo);
        result = pstmt.executeUpdate();
        pstmt.close();
        conn.close();
        return result;
	}

	public int deleteBook(String bNo, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
        int result = 0;
        String query = "DELETE FROM BOOK_TBL WHERE BOOK_NO = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, bNo);
        result = pstmt.executeUpdate();
        pstmt.close();
        conn.close();
        return result;
	}

	public int recommendedBook(String bNo, String recommendedYN, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
        int result = 0;
        String query = "UPDATE BOOK_TBL SET RECOMMENDED_YN = ? WHERE BOOK_NO = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, recommendedYN);
        pstmt.setString(2, bNo);
        result = pstmt.executeUpdate();
        pstmt.close();
        conn.close();
        return result;
	}

	public int advertiseBook(String bNo, String advertiseYN, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
        int result = 0;
        String query = "UPDATE BOOK_TBL SET ADVERTISE_YN = ? WHERE BOOK_NO = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, advertiseYN);
        pstmt.setString(2, bNo);
        result = pstmt.executeUpdate();
        pstmt.close();
        conn.close();
        return result;
	}

	public List<Book> searchBooks(String searchType, String searchTerm, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Book> bList = new ArrayList<>();
        String query = "";
        
        if ("name".equals(searchType)) {
            query = "SELECT * FROM BOOK_TBL WHERE BOOK_NAME LIKE ?";
        } else if ("author".equals(searchType)) {
            query = "SELECT * FROM BOOK_TBL WHERE AUTHOR LIKE ?";
        } else {
            query = "SELECT * FROM BOOK_TBL WHERE BOOK_NAME LIKE ? OR AUTHOR LIKE ?";
        }
        
        pstmt = conn.prepareStatement(query);
        if ("all".equals(searchType)) {
            pstmt.setString(1, "%" + searchTerm + "%");
            pstmt.setString(2, "%" + searchTerm + "%");
        } else {
            pstmt.setString(1, "%" + searchTerm + "%");
        }
        
        rset = pstmt.executeQuery();
        while(rset.next()) {
            String bookNo = rset.getString("BOOK_NO");
            String bookIntroTitle = rset.getString("BOOK_INTRO_TITLE");
            Book book = new Book(bookNo, bookIntroTitle);
            bList.add(book);
        }
        rset.close();
        pstmt.close();
        conn.close();
        return bList;
	}

    public List<Book> selectRecommendedBooks(Connection conn) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Book> bList = new ArrayList<>();
        String query = "SELECT * FROM BOOK_TBL WHERE RECOMMENDED_YN = 'Y'";
        pstmt = conn.prepareStatement(query);
        rset = pstmt.executeQuery();
        while(rset.next()) {
            String bookNo = rset.getString("BOOK_NO");
            String bookName = rset.getString("BOOK_NAME");
            String author = rset.getString("AUTHOR");
            String publisher = rset.getString("PUBLISHER");
            String category = rset.getString("CATEGORY");
            int bookCount = rset.getInt("BOOK_COUNT");
            String bookIntroTitle = rset.getString("BOOK_INTRO_TITLE");
            String bookIntroContent = rset.getString("BOOK_INTRO_CONTENT");
            String recommendedYN = rset.getString("RECOMMENDED_YN");
            String advertiseYN = rset.getString("ADVERTISE_YN");
            Book book = new Book(bookNo, bookName, author, publisher, category, bookCount, bookIntroTitle, bookIntroContent, recommendedYN, advertiseYN);
            bList.add(book);
        }
        rset.close();
        pstmt.close();
        return bList;
    }
    
    public List<Book> selectNewBooks(Connection conn) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Book> bList = new ArrayList<>();
        String query = "SELECT * FROM BOOK_TBL ORDER BY Entrance_DATE DESC";
        pstmt = conn.prepareStatement(query);
        rset = pstmt.executeQuery();
        while(rset.next()) {
            String bookNo = rset.getString("BOOK_NO");
            String bookName = rset.getString("BOOK_NAME");
            String author = rset.getString("AUTHOR");
            String publisher = rset.getString("PUBLISHER");
            String category = rset.getString("CATEGORY");
            int bookCount = rset.getInt("BOOK_COUNT");
            String bookIntroTitle = rset.getString("BOOK_INTRO_TITLE");
            String bookIntroContent = rset.getString("BOOK_INTRO_CONTENT");
            String recommendedYN = rset.getString("RECOMMENDED_YN");
            String advertiseYN = rset.getString("ADVERTISE_YN");
            Book book = new Book(bookNo, bookName, author, publisher, category, bookCount, bookIntroTitle, bookIntroContent, recommendedYN, advertiseYN);
            bList.add(book);
        }
        rset.close();
        pstmt.close();
        return bList;
    }
    
    public List<Book> selectAdvertiseBooks(Connection conn) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        List<Book> bList = new ArrayList<>();
        String query = "SELECT * FROM BOOK_TBL WHERE ADVERTISE_YN = 'Y' AND ROWNUM <= 5";
        pstmt = conn.prepareStatement(query);
        rset = pstmt.executeQuery();
        while(rset.next()) {
            String bookNo = rset.getString("BOOK_NO");
            String bookName = rset.getString("BOOK_NAME");
            String author = rset.getString("AUTHOR");
            String publisher = rset.getString("PUBLISHER");
            String category = rset.getString("CATEGORY");
            int bookCount = rset.getInt("BOOK_COUNT");
            String bookIntroTitle = rset.getString("BOOK_INTRO_TITLE");
            String bookIntroContent = rset.getString("BOOK_INTRO_CONTENT");
            String recommendedYN = rset.getString("RECOMMENDED_YN");
            String advertiseYN = rset.getString("ADVERTISE_YN");
            
            Book book = new Book(bookNo, bookName, author, publisher, category, bookCount, 
                               bookIntroTitle, bookIntroContent, recommendedYN, advertiseYN);
            bList.add(book);
        }
        rset.close();
        pstmt.close();
        return bList;
    }
}