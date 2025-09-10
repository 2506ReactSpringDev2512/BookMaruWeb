package com.elon.member.controller.admin;

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

/**
 * Servlet implementation class AdminListServlet
 */
@WebServlet("/admin/list")
public class AdminListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String adminYN = (String) session.getAttribute("adminYN");
		if(!"Y".equals(adminYN) && !"ADMIN".equals(adminYN)) {
			response.sendRedirect("/member/login");
			return;
		}
		BookService bService = new BookService();
		List<Book> bList = bService.selectAllBooks();
		request.setAttribute("bList", bList);
		request.getRequestDispatcher("/WEB-INF/views/admin/adminlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String adminYN = (String) session.getAttribute("adminYN");
		if(!"Y".equals(adminYN) && !"ADMIN".equals(adminYN)) {
			response.sendRedirect("/member/login");
			return;
		}
		String bNo = request.getParameter("bNo");
		if (bNo != null && !bNo.trim().isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/admin/edit?bNo=" + bNo);
		} else {
			doGet(request, response);
		}
	}
	
	

}