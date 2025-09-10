package com.elon.member.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.List;

import com.elon.member.model.service.BookService;
import com.elon.member.model.vo.Book;

/**
 * Servlet implementation class AdminEditServlet
 */
@WebServlet("/admin/edit")
@MultipartConfig(maxFileSize = 1024*1024*10)
public class AdminEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEditServlet() {
        super();
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
		String bNo = (String) request.getAttribute("bNo");
		if (bNo == null) {
			bNo = request.getParameter("bNo");
		}
		if (bNo != null && !bNo.trim().isEmpty()) {
			request.setAttribute("bNo", bNo);
			BookService bService = new BookService();
			List<Book> bList = bService.infoBooks(bNo);
			request.setAttribute("bList", bList);
			request.getRequestDispatcher("/WEB-INF/views/book/adminedit.jsp").forward(request, response);
		} else {
			response.sendRedirect("/admin/list");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String adminYN = (String) session.getAttribute("adminYN");
		if(!"Y".equals(adminYN) && !"ADMIN".equals(adminYN)) {
			response.sendRedirect("/member/login");
			return;
		}
		// 파일 파트 먼저 가져오기
		Part filePart = request.getPart("bookImage");
		
		// 기본 파라미터들 가져오기
		String bNo = request.getParameter("bNo");
		String bookName = request.getParameter("bookName");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String category = request.getParameter("category");
		int bookCount = Integer.parseInt(request.getParameter("bookCount"));
		String bookIntroTitle = request.getParameter("bookIntroTitle");
		String bookIntroContent = request.getParameter("bookIntroContent");
		
		Book book = new Book(bookName, author, publisher, category, bookCount, bookIntroTitle, bookIntroContent);
		BookService bService = new BookService();
		int result = bService.updateBook(bNo, book);
		
		if(result > 0) {
			// 책 정보 수정 성공 후 이미지 처리
			if (filePart != null && filePart.getSize() > 0) {
				try {
					String fileName = filePart.getSubmittedFileName();
					String fileExtension = fileName.substring(fileName.lastIndexOf("."));
					String newFileName = bNo + fileExtension;
					String uploadPath = "C:\\Users\\user\\Desktop\\backend\\webworkspace\\BookWeb\\src\\main\\webapp\\BOOK-IMG\\";
					
					File uploadDir = new File(uploadPath);
					if (!uploadDir.exists()) uploadDir.mkdirs();
					
					// 기존 이미지 파일들 삭제 (다른 확장자일 수 있으므로)
					File[] existingFiles = uploadDir.listFiles((dir, name) -> name.startsWith(bNo + "."));
					if (existingFiles != null) {
						for (File existingFile : existingFiles) {
							existingFile.delete();
						}
					}
					
					// 새 이미지 저장
					filePart.write(uploadPath + newFileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			response.sendRedirect(request.getContextPath() + "/admin/list");
		} else {
			request.setAttribute("errorMessage", "책정보 수정에 실패했습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
		}
	}

}