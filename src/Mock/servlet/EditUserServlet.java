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
import javax.servlet.http.HttpSession;

import Mock.dao.UserDAO;
import Mock.model.UserAccount;
import Mock.utils.MyUtils;

@WebServlet(urlPatterns = { "/edituser" })
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditUserServlet() {
		super();
	}

	// Show product edit page.
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		UserAccount user = null;
		String errorString = null;

		try {
			user = UserDAO.findUser(conn, userName);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}

		
		// Store errorString in request attribute, before forward to views.
		request.setAttribute("errorString", errorString);
		request.setAttribute("user", user);

		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/user/edituser.jsp");
		dispatcher.forward(request, response);

	}

	// After the user modifies the product information, and click Submit.
	// This method will be executed.
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);

		String fullname = (String) request.getParameter("fullname");
		String email = (String) request.getParameter("email");
		String phone = (String) request.getParameter("phone");
		String address = (String) request.getParameter("address");
		//String newpass = (String) request.getParameter("newpass");
//		HttpSession session = request.getSession();
//		String userName = (String) session.getAttribute("userName");	
		
		UserAccount user = new UserAccount(email, null, 2, fullname, phone, address);

		String errorString = null;
		

		try {
			UserDAO.updateUser(conn, user);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		// Store infomation to request attribute, before forward to views.
		request.setAttribute("errorString", errorString);
		request.setAttribute("user", user);

		// If error, forward to Edit page.
		if (errorString != null) {
			RequestDispatcher dispatcher = request.getServletContext()
					.getRequestDispatcher("/WEB-INF/views/user/edituser.jsp");
			dispatcher.forward(request, response);
		}
		// If everything nice.
		// Redirect to the product listing page.
		else {
			response.sendRedirect(request.getContextPath() + "/home");
		}
	}

}