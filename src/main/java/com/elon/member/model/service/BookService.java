package com.elon.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.elon.member.common.BOOKTemplate;
import com.elon.member.model.dao.BookDAO;
import com.elon.member.model.vo.Book;
import com.elon.member.model.vo.BookLoan;

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

	public int deleteBook(String bNo) {
		int result = 0;
        try {
            Connection conn = bookTemplate.getConnection();
            result = bDao.deleteBook(bNo, conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
	}

	public int recommendedBook(String bNo, String recommendedYN) {
		int result = 0;
        try {
            Connection conn = bookTemplate.getConnection();
            result = bDao.recommendedBook(bNo, recommendedYN, conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
	}

	public int advertiseBook(String bNo, String advertiseYN) {
		int result = 0;
        try {
            Connection conn = bookTemplate.getConnection();
            result = bDao.advertiseBook(bNo, advertiseYN, conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
	}

	public List<Book> searchBooks(String searchType, String searchTerm) {
		List<Book> bList = null;
        try {
            Connection conn = bookTemplate.getConnection();
            bList = bDao.searchBooks(searchType, searchTerm, conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bList;
	}

	public List<Book> selectRecommendedBooks() {
		List<Book> bList = null;
		Connection conn = null;
        try {
            conn = bookTemplate.getConnection();
            bList = bDao.selectRecommendedBooks(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	try {
        		if (conn != null) conn.close();
        	} catch (SQLException e) {
        		e.printStackTrace();
        	}
        }
        return bList;
	}
	
	public List<Book> selectNewBooks() {
		List<Book> bList = null;
		Connection conn = null;
        try {
            conn = bookTemplate.getConnection();
            bList = bDao.selectNewBooks(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	try {
        		if (conn != null) conn.close();
        	} catch (SQLException e) {
        		e.printStackTrace();
        	}
        }
        return bList;
	}
	
	public List<Book> selectAdvertiseBooks() {
		List<Book> bList = null;
		Connection conn = null;
        try {
            conn = bookTemplate.getConnection();
            bList = bDao.selectAdvertiseBooks(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	try {
        		if (conn != null) conn.close();
        	} catch (SQLException e) {
        		e.printStackTrace();
        	}
        }
        return bList;
	}

	public int loanBook(String bNo, String memberId) {
		int result = 0;
        try {
            Connection conn = bookTemplate.getConnection();
            result = bDao.loanBook(bNo, memberId, conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
	}
	public List<Book> searchBookList(String bookSearchTerm, String searchType) {
		List<Book> bList = new ArrayList<>();
		try {
			Connection conn = bookTemplate.getConnection();
			bList = bDao.searchBookList(bookSearchTerm, searchType, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bList;
	}

	
	// 대출 목록 조회
    public List<BookLoan> getLendList(String memberId) {
        Connection conn = null;
        List<BookLoan> lList = null;
        try {
            conn = bookTemplate.getConnection();
            lList = bDao.getLendList(conn, memberId);
        } catch(Exception e) {
            e.printStackTrace();
        } 
        return lList;
    }

    // 책 반납
    public boolean returnBook(String memberId, String bookNo) {
        Connection conn = null;
        boolean success = false;
        try {
            conn = bookTemplate.getConnection();
            conn.setAutoCommit(false);
            
            int result = bDao.returnBook(conn, memberId, bookNo);
            if(result > 0) {
                conn.commit();
                success = true;
            } else {
                conn.rollback();
            }
        } catch(Exception e) {
            try { 
            	if(conn != null) conn.rollback(); 
            } catch(Exception ex) {}
            e.printStackTrace();
        }
        return success;
    }

}