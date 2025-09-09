package com.elon.member.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/main")
public class AdminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminMainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String adminYN = (String) session.getAttribute("adminYN");
		if(!"Y".equals(adminYN) && !"ADMIN".equals(adminYN)) {
			response.sendRedirect("/member/login");
			return;
		}
		request.getRequestDispatcher("/WEB-INF/views/book/adminmain.jsp").forward(request, response);
	}

}