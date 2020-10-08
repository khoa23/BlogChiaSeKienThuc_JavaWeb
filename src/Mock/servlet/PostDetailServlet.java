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
@WebServlet(urlPatterns = { "/postDetail" })
public class PostDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public  PostDetailServlet() {
		super();
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);

		//post
		Long postID = Long.parseLong(request.getParameter("code"));
		String errorString = null;
		Post post = null;
		List<Post> postCategory = null;
		//find post
		try {
			post = PostDao.findPost(conn, postID);
			postCategory = PostDao.findListPostByIDCategory(conn, postID);//tìm bài chung chuyên mục
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		
		
		//recentpost	
		Post recentpost = null;
		try {
			recentpost = PostDao.recentPost(conn);
			} catch (SQLException e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}
		
		//category
		List<Category> list = null;
		try {
			list = CategoryDao.getListCategory(conn);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		// category
		request.setAttribute("errorString", errorString);
		request.setAttribute("categoryList", list);
		
		// show post
		request.setAttribute("errorString", errorString);
		request.setAttribute("post", post);
		
		// show recentpost
		request.setAttribute("recentpost", recentpost);
		
		//show bài cùng chuyên mục
		request.setAttribute("postCate", postCategory);
		

		// Forward to /WEB-INF/views/productListView.jsp
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/user/detailPost.jsp");
		dispatcher.forward(request, response);
	}
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
	}


}
