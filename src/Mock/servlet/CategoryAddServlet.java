package Mock.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mock.dao.CategoryDao;
import Mock.model.Category;
import Mock.utils.MyUtils;
@WebServlet(urlPatterns = { "/categoryAdd" })

public class CategoryAddServlet extends HttpServlet{
	private static final long serialVersionUID = 1L; 
	  
	public CategoryAddServlet() {
		super();
	}
	@Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {		
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/admin/insertCategory.jsp");
		dispatcher.forward(request, response);
	}
	  
	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Connection conn = MyUtils.getStoredConnection(request);
		 
		 	//String categoryName = request.getParameter("categoryname");
		 	String namecategory = request.getParameter("categoryname");
		 	Category category = new Category(namecategory);
		 	String errorString = null;
		 	
		 	System.out.println(namecategory);

			if (namecategory == null ) {
				errorString = "Category name invalid!";
			}
		 	
			if (errorString == null) {
				try {
					CategoryDao.insertCategory(conn, category);
				} catch (SQLException e) {
					e.printStackTrace();
					errorString = e.getMessage();
				}
			}
					
			// Store infomation to request attribute, before forward to views.
			request.setAttribute("errorString", errorString);
			request.setAttribute("category", category);

			// If error, forward to Edit page.
			if (errorString != null) {
				RequestDispatcher dispatcher = request.getServletContext()
						.getRequestDispatcher("/WEB-INF/views/admin/insertCategory.jsp");
				dispatcher.forward(request, response);
			}
			// If everything nice.
			// Redirect to the product listing page.
			else {
				response.sendRedirect(request.getContextPath() + "/home");
			}
	 }
	        		        	    	 
}
