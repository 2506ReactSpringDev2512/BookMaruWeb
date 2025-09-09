package com.elon.member.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

import com.elon.member.model.service.BookService;

@WebServlet("/admin/delete")
public class AdminDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminDeleteServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bNo = request.getParameter("bNo");
        
        if (bNo != null && !bNo.trim().isEmpty()) {
            BookService bService = new BookService();
            int result = bService.deleteBook(bNo);
            if (result > 0) {
                // DB 삭제 성공 시 이미지 파일도 삭제
                try {
                    String uploadPath = "C:\\Users\\user\\Desktop\\backend\\webworkspace\\BookWeb\\src\\main\\webapp\\BOOK-IMG\\";
                    File uploadDir = new File(uploadPath);
                    
                    // 해당 도서번호로 시작하는 모든 이미지 파일 삭제
                    File[] existingFiles = uploadDir.listFiles((dir, name) -> name.startsWith(bNo + "."));
                    if (existingFiles != null) {
                        for (File existingFile : existingFiles) {
                            existingFile.delete();
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
                response.sendRedirect("/admin/list");
            } else {
                request.setAttribute("errorMessage", "책 삭제에 실패했습니다.");
                request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/admin/list");
        }
    }
}