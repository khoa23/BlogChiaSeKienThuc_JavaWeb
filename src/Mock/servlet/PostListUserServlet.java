package Mock.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mock.model.Category;
import Mock.model.Post;
import Mock.dao.CategoryDao;
import Mock.dao.PostDao;
import Mock.utils.MyUtils;
@WebServlet(urlPatterns = { "/postListByCategory" })
public class PostListUserServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public  PostListUserServlet() {
		super();
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);

		String code = (String) request.getParameter("code");
		String errorString = null;
		List<Post> list = null;
		try {
			list = PostDao.getListPostByName(conn, code);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		
		//category
		List<Category> listCategory = null;
		try {
			listCategory = CategoryDao.getListCategory(conn);
			} catch (SQLException e) {
				e.printStackTrace();
				errorString = e.getMessage();
		}
		// Store info in request attribute, before forward to views
		request.setAttribute("errorString", errorString);
		request.setAttribute("postList", list);
		// category
		request.setAttribute("categoryList", listCategory);
		
		// Forward to /WEB-INF/views/productListView.jsp
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/user/postListView.jsp");
		dispatcher.forward(request, response);
	}
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
	}


}
