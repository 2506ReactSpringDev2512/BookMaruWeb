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
 * Servlet implementation class AdminEditServlet
 */
@WebServlet("/admin/edit")
public class AdminEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEditServlet() {
        super();
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
			request.getRequestDispatcher("/WEB-INF/views/book/adminedit.jsp").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/list");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bNo = request.getParameter("bNo");
		String bookName = request.getParameter("bookName");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String category = request.getParameter("category");
		int bookCount = Integer.parseInt(request.getParameter("bookCount"));
		String bookIntroTitle = request.getParameter("bookIntroTitle");
		String bookIntroContent = request.getParameter("bookIntroContent");
		Book book = new Book(bookName, author, publisher, category, bookCount, bookIntroTitle, bookIntroContent);
		BookService bService = new BookService();
		int result = bService.updateBook(bNo,book);
		if(result > 0) {
			response.sendRedirect("/admin/list");
		}else {
			request.setAttribute("errorMessage", "책정보 수정에 실패했습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
		}

	}

}
