package com.elon.member.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.elon.member.model.service.BookService;

/**
 * Servlet implementation class AdminRecommendedServlet
 */
@WebServlet("/admin/recommended-book")
public class AdminRecommendedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRecommendedServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		String recommendedYN = request.getParameter("recommendedYN");
		if (recommendedYN.equals("Y")) {
			recommendedYN = "N";
		} else {
			recommendedYN = "Y";
		}
		BookService bService = new BookService();
        int result = bService.recommendedBook(bNo, recommendedYN);
        if(result > 0) {
			response.sendRedirect("/admin/list");
		}else {
			request.setAttribute("errorMsg", "추천 정보가 수정되지 않았습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp")
			.forward(request, response);
		}
		
	}

}
