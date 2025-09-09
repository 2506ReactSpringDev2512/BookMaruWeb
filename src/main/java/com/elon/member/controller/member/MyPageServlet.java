package com.elon.member.controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.elon.member.model.service.BookService;
import com.elon.member.model.vo.Book;
import com.elon.member.model.vo.BookLoan;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/member/mypage")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
	    BookService bService = new BookService();
	    List<BookLoan> lendList = bService.getLendList(memberId);
	    List<Book> recommendedBooks = bService.selectRecommendedBooks();
	    request.setAttribute("lendList", lendList);
	    request.setAttribute("recommendedBooks", recommendedBooks);
	    request.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(request, response);
	}
}
