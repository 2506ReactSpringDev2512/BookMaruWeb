package com.elon.member.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.elon.member.model.service.BookService;
import com.elon.member.model.vo.Book;

/**
 * Servlet implementation class BookSearchServlet
 */
@WebServlet("/book/searchbook")
public class BookSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
		String bookSearchTerm = request.getParameter("bookSearchTerm");
		if(searchType == null || searchType.trim().isEmpty()) {
			searchType = "name";
		}
		
		if (bookSearchTerm == null || bookSearchTerm.trim().isEmpty()) {
            request.getRequestDispatcher("/WEB-INF/views/book/searchbook.jsp")
                   .forward(request, response);
            return;
        }
		BookService bService = new BookService();
		
		List<Book> bookList = bService.searchBookList(bookSearchTerm, searchType);
		
		if(bookList != null) {
			request.setAttribute("bookList", bookList);
			request.setAttribute("bookSearchTerm", bookSearchTerm);
			request.getRequestDispatcher("/WEB-INF/views/book/searchbook.jsp")
			.forward(request, response);
		} else {
            request.setAttribute("errorMsg", "데이터가 존재하지 않습니다");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
