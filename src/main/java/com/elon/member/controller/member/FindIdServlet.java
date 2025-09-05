package com.elon.member.controller.member;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.elon.member.model.service.MemberService;
import com.elon.member.model.vo.Member;

@WebServlet("/member/find-id")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FindIdServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/findid.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberName = request.getParameter("memberName");
		String Phone = request.getParameter("Phone");
		Member member = new Member();
		member.setMemberName(memberName);
		member.setPhone(Phone);
		MemberService mService = new MemberService();
		String result = mService.findid(member);
		if (result != null) {
			request.setAttribute("foundId", result);
			request.getRequestDispatcher("/WEB-INF/views/member/findid.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "일치하는 회원이 없습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
		}
	}
}