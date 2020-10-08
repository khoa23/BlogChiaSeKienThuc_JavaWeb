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


@WebServlet(urlPatterns = { "/home" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Connection conn = MyUtils.getStoredConnection(request);
		//category
		String errorString = null;
		List<Category> list = null;
		try {
			list = CategoryDao.getListCategory(conn);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		//hot new	
		List<Post> hotnews = null;
		try {
			hotnews = PostDao.htmlPost(conn);
			} catch (SQLException e) {
				e.printStackTrace();
				errorString = e.getMessage();
		}
		
		//css post
		List<Post> cssPost = null;
		try {
			cssPost = PostDao.cssPost(conn);
			} catch (SQLException e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}
		
		//JavaScript
		List<Post> javaScriptPost = null;
		try {
			javaScriptPost = PostDao.javaScriptPost(conn);
			} catch (SQLException e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}
		// category
		request.setAttribute("errorString", errorString);
		request.setAttribute("categoryList", list);
		//hot news
		request.setAttribute("hotPostList", hotnews);
		//css post
		request.setAttribute("cssPostList", cssPost);
		//JavaScript
		request.setAttribute("javaScriptPostList", javaScriptPost);
		// Forward to /WEB-INF/views/homeView.jsp
		// (Users can not access directly into JSP pages placed in WEB-INF)
		RequestDispatcher dispatcher = this.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/homeView.jsp");

		dispatcher.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
