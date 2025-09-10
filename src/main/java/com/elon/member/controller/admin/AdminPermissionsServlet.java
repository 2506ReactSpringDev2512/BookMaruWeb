package com.elon.member.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.elon.member.model.service.MemberService;
import com.elon.member.model.vo.Member;

/**
 * Servlet implementation class AdminPermissionsServlet
 */
@WebServlet("/admin/permissions")
public class AdminPermissionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPermissionsServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		MemberService mService = new MemberService();
		List<Member> mList = mService.selectAllUsers();
		request.setAttribute("mList", mList);
		request.getRequestDispatcher("/WEB-INF/views/book/adminpermissions.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionAdminYN = (String) session.getAttribute("adminYN");
		if(!"Y".equals(sessionAdminYN) && !"ADMIN".equals(sessionAdminYN)) {
			response.sendRedirect("/member/login");
			return;
		}
		String memberId = request.getParameter("memberId");
		String adminYN = request.getParameter("adminYN");
		if (adminYN.equals("Y")) {
			adminYN = "N";
		} else {
			adminYN = "Y";
		}
		MemberService mService = new MemberService();
        int result = mService.adminpermissions(memberId, adminYN);
        if(result > 0) {
			response.sendRedirect("/admin/permissions");
		}else {
			request.setAttribute("errorMsg", "권한 부여 실패");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp")
			.forward(request, response);
		}
	}

}
