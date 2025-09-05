package com.elon.member.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

import com.elon.member.model.service.BookService;
import com.elon.member.model.vo.Book;

@WebServlet("/admin/insert-book")
@MultipartConfig(maxFileSize = 1024*1024*10)
public class InsertBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertBookServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/book/insertbook.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part filePart = request.getPart("bookImage");
		String bookNo = request.getParameter("BOOK_NO");
		String bookName = request.getParameter("BOOK_NAME");
		String author = request.getParameter("AUTHOR");
		String publisher = request.getParameter("PUBLISHER");
		String category = request.getParameter("CATEGORY");
		int bookCount = Integer.parseInt(request.getParameter("BOOK_COUNT"));
		String bookIntroTitle = request.getParameter("BOOK_INTRO_TITLE");
		String bookIntroContent = request.getParameter("BOOK_INTRO_CONTENT");
		String recommendedYN = request.getParameter("RECOMMENDED_YN");
		String advertiseYN = request.getParameter("ADVERTISE_YN");
		Book book = new Book(bookNo, bookName, author, publisher, category, bookCount, bookIntroTitle, bookIntroContent, recommendedYN, advertiseYN);
		BookService bService = new BookService();
		int result = bService.insertBook(book);
		if(result > 0) {
			if (filePart != null && filePart.getSize() > 0) {
				try {
					String fileName = filePart.getSubmittedFileName();
					String fileExtension = fileName.substring(fileName.lastIndexOf("."));
					String newFileName = bookNo + fileExtension;
					String uploadPath = "C:\\Users\\user\\Desktop\\backend\\webworkspace\\BookWeb\\src\\main\\webapp\\BOOK-IMG\\";
					File uploadDir = new File(uploadPath);
					if (!uploadDir.exists()) uploadDir.mkdirs();
					filePart.write(uploadPath + newFileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			response.sendRedirect("/admin/main");
		} else {
			request.setAttribute("errorMessage", "책 등록에 실패했습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
		}
	}
}