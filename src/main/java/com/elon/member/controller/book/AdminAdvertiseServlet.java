package com.elon.member.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.elon.member.model.service.BookService;

/**
 * Servlet implementation class AdminAdvertiseServlet
 */
@WebServlet("/admin/advertise-book")
public class AdminAdvertiseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdvertiseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bNo = request.getParameter("bNo");
		String advertiseYN = request.getParameter("advertiseYN");
		if (advertiseYN.equals("Y")) {
			advertiseYN = "N";
		} else {
			advertiseYN = "Y";
		}
		BookService bService = new BookService();
        int result = bService.advertiseBook(bNo, advertiseYN);
        if(result > 0) {
			response.sendRedirect("/admin/list");
		}else {
			request.setAttribute("errorMsg", "추천 정보가 수정되지 않았습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp")
			.forward(request, response);
		}
	}

}