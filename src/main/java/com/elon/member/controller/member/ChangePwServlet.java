package com.elon.member.controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.elon.member.model.service.MemberService;
import com.elon.member.model.vo.Member;

@WebServlet("/member/change-pw")
public class ChangePwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangePwServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/changepw.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String check = request.getParameter("check");
		MemberService mService = new MemberService();
		
		if("verify".equals(check)) {
			String memberId = request.getParameter("memberId");
			String memberName = request.getParameter("memberName");
			
			Member member = new Member();
			member.setMemberId(memberId);
			member.setMemberName(memberName);
			
			boolean isMember = mService.check(member);
			
			if(isMember) {
				request.setAttribute("verified", true);
				request.setAttribute("memberId", memberId);
				request.getRequestDispatcher("/WEB-INF/views/member/changepw.jsp").forward(request, response);
			} else {
				request.setAttribute("errorMsg", "일치하는 회원 정보가 없습니다.");
				request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
			}
			
		} else if("change".equals(check)) {
			String memberId = request.getParameter("memberId");
			String newPassword = request.getParameter("newPassword");
			
			Member member = new Member();
			member.setMemberId(memberId);
			member.setMemberPwd(newPassword);
			
			boolean isChanged = mService.changePassword(member);
			
			if(isChanged) {
				request.setAttribute("successMsg", "비밀번호가 성공적으로 변경되었습니다.");
				response.sendRedirect(request.getContextPath() + "/member/login");
			} else {
				request.setAttribute("errorMsg", "비밀번호 변경에 실패했습니다.");
				request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
			}
		}
	}
}