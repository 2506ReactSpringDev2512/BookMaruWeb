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
 * Servlet implementation class BookDetailServlet
 */
@WebServlet("/book/detail")
public class BookDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bNo = (String) request.getAttribute("bNo");
		if (bNo == null) {
			bNo = request.getParameter("bNo");
		}
		if (bNo != null && !bNo.trim().isEmpty()) {
			request.setAttribute("bNo", bNo);
			BookService bService = new BookService();
			List<Book> bList = bService.infoBooks(bNo);
			request.setAttribute("bList", bList);
			request.getRequestDispatcher("/WEB-INF/views/book/detailbook.jsp").forward(request, response);
		} else {
			response.sendRedirect("/");
		}
	}
}