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
 * Servlet implementation class SearchBookServlet
 */
@WebServlet("/book/searchbook")
public class SearchBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBookServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String bookSearchTerm = request.getParameter("bookSearchTerm");
		String searchType = request.getParameter("searchType");
		
		// searchType이 null이면 기본값 "all"로 설정
		if (searchType == null || searchType.trim().isEmpty()) {
			searchType = "all";
		}
		
		BookService bService = new BookService();
		List<Book> bookList = bService.searchBooks(searchType, bookSearchTerm.trim());
		request.setAttribute("bookList", bookList);
		request.setAttribute("bookSearchTerm", bookSearchTerm);
		request.setAttribute("searchType", searchType);
		request.getRequestDispatcher("/WEB-INF/views/book/searchbook.jsp").forward(request, response);
	}
}