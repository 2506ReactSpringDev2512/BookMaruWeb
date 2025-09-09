package com.elon.member.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.elon.member.model.service.BookService;

@WebServlet("/book/loan")
public class BookLoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookLoanServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/");
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		if (memberId == null) {
			response.sendRedirect("/member/login");
			return;
		}
		String bNo = request.getParameter("bookNo");
		if (bNo == null || bNo.trim().isEmpty()) {
			response.sendRedirect("/book/detail?bNo=" + bNo);
			return;
		}
		BookService bService = new BookService();
		try {
			int result = bService.loanBook(bNo, memberId);
			if (result > 0) {
				session.setAttribute("alertMsg", "도서 대출이 완료되었습니다.");
			} else {
				session.setAttribute("alertMsg", "도서 대출에 실패했습니다. 재고 또는 중복 대출을 확인해주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMsg", "도서 대출 중 오류가 발생했습니다.");
		}
		response.sendRedirect(request.getContextPath() + "/book/detail?bNo=" + bNo);
	}
}
