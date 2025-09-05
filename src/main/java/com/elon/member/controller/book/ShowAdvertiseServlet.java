package com.elon.member.controller.book;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.elon.member.model.service.BookService;
import com.elon.member.model.vo.Book;

/**
 * 광고 섹션용 추천 도서 조회 서블릿
 * 추천여부가 'Y'인 책 4개를 조회하여 메인 광고 섹션에 표시
 */
@WebServlet("/showAdvertise.bo")
public class ShowAdvertiseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ShowAdvertiseServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 추천여부가 'Y'인 책 4개 조회
        List<Book> advertiseBooks = new BookService().selectAdvertiseBooks();
        
        // request에 데이터 저장
        request.setAttribute("advertiseBooks", advertiseBooks);
        
        // JSON 응답으로 반환
        response.setContentType("application/json;charset=UTF-8");
        
        StringBuilder jsonResponse = new StringBuilder();
        jsonResponse.append("{\"books\":[");
        
        if (advertiseBooks != null && !advertiseBooks.isEmpty()) {
            for (int i = 0; i < advertiseBooks.size(); i++) {
                Book book = advertiseBooks.get(i);
                if (i > 0) jsonResponse.append(",");
                jsonResponse.append("{")
                    .append("\"bookNo\":").append(book.getBookNo()).append(",")
                    .append("\"bookName\":\"").append(escapeJson(book.getBookName())).append("\",")
                    .append("\"author\":\"").append(escapeJson(book.getAuthor())).append("\",")
                    .append("\"publisher\":\"").append(escapeJson(book.getPublisher())).append("\"")
                    .append("}");
            }
        }
        
        jsonResponse.append("]}");
        
        response.getWriter().write(jsonResponse.toString());
    }
    
    private String escapeJson(String str) {
        if (str == null) return "";
        return str.replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}