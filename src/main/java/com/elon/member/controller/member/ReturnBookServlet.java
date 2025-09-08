package com.elon.member.controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.elon.member.model.service.BookService;

/**
 * Servlet implementation class ReturnBookServlet
 */
@WebServlet("/member/returnbook")
public class ReturnBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("memberId");
        String bookNo = request.getParameter("bookNo");
        BookService bservice = new BookService();

        int result = bservice.returnBook(memberId, bookNo);

        if(result >0) {
        	response.sendRedirect("/member/mypage");// 성공하면 목록 갱신
        } else {
            request.setAttribute("msg", "반납 실패");
            request.getRequestDispatcher("/WEB-INF/views/common/error.jsp")
            .forward(request, response);
        }
    

	}

}
