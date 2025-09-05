package com.elon.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import com.elon.member.common.BOOKTemplate;
import com.elon.member.model.dao.BookDAO;
import com.elon.member.model.vo.Book;

public class BookService {
    private BOOKTemplate bookTemplate;
    private BookDAO bDao;

    public BookService() {
        bookTemplate = BOOKTemplate.getInstance();
        bDao = new BookDAO();
    }

    public int insertBook(Book book) {
        int result = 0;
        try {
            Connection conn = bookTemplate.getConnection();
            result = bDao.insertBook(book, conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<Book> selectAllBooks() {
        List<Book> bList = null;
        try {
            Connection conn = bookTemplate.getConnection();
            bList = bDao.selectAllBooks(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bList;
    }

	public List<Book> infoBooks(String bNo) {
		List<Book> bList = null;
        try {
            Connection conn = bookTemplate.getConnection();
            bList = bDao.infoBooks(bNo, conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bList;
	}

	public int updateBook(String bNo, Book book) {
		int result = 0;
        try {
            Connection conn = bookTemplate.getConnection();
            result = bDao.updateBook(bNo, book, conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
	}

}