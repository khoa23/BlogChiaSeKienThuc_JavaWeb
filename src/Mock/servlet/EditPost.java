package Mock.servlet;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Mock.model.Post;
import Mock.dao.CategoryDao;
import Mock.dao.PostDao;
import Mock.model.Category;
import Mock.utils.MyUtils;
@MultipartConfig(
	      fileSizeThreshold = 1024 * 1024 * 10,
	      maxFileSize = 1024 * 1024 * 50,
	      maxRequestSize = 1024 * 1024 * 100
	)
@WebServlet(urlPatterns = { "/editPost" })
public class EditPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  public static final String SAVE_DIRECTORY = "Images";
	public EditPost() {
		super();
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = MyUtils.getStoredConnection(request);
		Long postID = Long.parseLong(request.getParameter("postID"));
		Post post = null;

		String errorString = null;
		List<Category> list = null;
		Category nameCategory = null;
		//find post
		try {
			post = PostDao.findPost(conn, postID);
			//System.out.println(post);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		//list category
		try {
			list = CategoryDao.getListCategory(conn);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		
		//find category name
		try {
			nameCategory = CategoryDao.findCategoryByPostID(conn, postID);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		
		// If no error.
		// The product does not exist to edit.
		// Redirect to productList page.
		if (errorString != null && post == null) {
			response.sendRedirect(request.getContextPath() + "/postList");
			return;
		}
		request.setAttribute("errorString", errorString);
		request.setAttribute("categoryList", list);
		request.setAttribute("post", post);
		request.setAttribute("categoryName", nameCategory);

		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/admin/editPost.jsp");
		dispatcher.forward(request, response);


		// Store errorString in request attribute, before forward to views.
		
	}
	
	
	 private String extractFileName(Part part) {
	       // form-data; name="file"; filename="C:\file1.zip"
	       // form-data; name="file"; filename="C:\Note\file2.zip"
	       String contentDisp = part.getHeader("content-disposition");
	       String[] items = contentDisp.split(";");
	       for (String s : items) {
	           if (s.trim().startsWith("filename")) {
	               String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
	               clientFileName = clientFileName.replace("\\", "/");
	               int i = clientFileName.lastIndexOf('/');
	               return clientFileName.substring(i + 1);
	           }
	       }
	       return null;
	   }
	 @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 Connection conn = MyUtils.getStoredConnection(request);
		 Long postID = Long.parseLong( request.getParameter("postID"));
	        String categoryIDstr =(String) request.getParameter("categoryID");
	        String title =(String) request.getParameter("title");
	        String content =(String) request.getParameter("content");
	        String userIDstr =(String) request.getParameter("userID");
	        String DateStr =(String) request.getParameter("date");
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Date date = null;
			try {
				date = sdf.parse(DateStr);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        String image="";
	        java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());
	      Long categoryID=Long.parseLong(categoryIDstr);
	      Long userID=Long.parseLong(userIDstr);
	    
			
			 // Đường dẫn tuyệt đối tới thư mục gốc của web app.
			String appPath ="D:/JAVA_PROJECT/MockProject/WebContent";
	        appPath = appPath.replace('\\', '/');
	        appPath = appPath.replace("/",File.separator);
	        

	        // Thư mục để save file tải lên.
	        String fullSavePath = null;
	        if (appPath.endsWith("/")) {
	            fullSavePath = appPath + SAVE_DIRECTORY;
	        } else {
	            fullSavePath = appPath + File.separator + SAVE_DIRECTORY;
	        }


	        // Tạo thư mục nếu nó không tồn tại.
	        File fileSaveDir = new File(fullSavePath);
	       if (!fileSaveDir.exists()) {
	            fileSaveDir.mkdir();
	        }

	        // Danh mục các phần đã upload lên (Có thể là nhiều file).
	        for (Part part : request.getParts()) {
	            String fileName = extractFileName(part);
	            LocalDateTime myDateObj = LocalDateTime.now();
	            DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("ddMMyyyyHHmmss");
	            String ngay = myDateObj.format(myFormatObj);
	            if (fileName != null && fileName.length() > 0) {
	                String filePath = fullSavePath + File.separator + ngay +"_"+fileName;
	                System.out.println("Write attachment to file: " + filePath);

	                // Ghi vào file.
	                part.write(filePath);
	                image=fileName;
	            }
	        }
	        Post post = new Post(postID,categoryID, userID, title, content,image,sqlStartDate);
	                String errorString = null;
	                //String regex = "\\w+";

	                if (errorString == null) {
	        			try {
	        				PostDao.updatePost(conn, post);
	        			} catch (SQLException e) {
	        				e.printStackTrace();
	        				errorString = e.getMessage();
	        			}
	        		}

		// Store infomation to request attribute, before forward to views.
		request.setAttribute("errorString", errorString);
		request.setAttribute("post", post);

		// If error, forward to Edit page.
		if (errorString != null) {
			RequestDispatcher dispatcher = request.getServletContext()
					.getRequestDispatcher("/WEB-INF/views/admin/editPost.jsp");
			dispatcher.forward(request, response);
		}
		// If everything nice.
		// Redirect to the product listing page.
		else {
			response.sendRedirect(request.getContextPath() + "/postList");
		}
	}

}
