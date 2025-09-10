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
 * Servlet implementation class MainServlet
 */
@WebServlet("/book/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookService bService = new BookService();
        List<Book> recommendedBooks = bService.selectRecommendedBooks();
        List<Book> newBooks = bService.selectNewBooks();
        List<Book> advertiseBooks = bService.selectAdvertiseBooks();
        
        request.setAttribute("recommendedBooks", recommendedBooks);
        request.setAttribute("newBooks", newBooks);
        request.setAttribute("advertiseBooks", advertiseBooks);
		request.getRequestDispatcher("/WEB-INF/views/common/main.jsp").forward(request, response);
	}

}
