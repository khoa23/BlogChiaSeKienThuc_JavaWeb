package Mock.servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Mock.dao.RoleDAO;
import Mock.dao.UserDAO;
import Mock.model.Role;
import Mock.model.UserAccount;
import Mock.utils.MyUtils;

@WebServlet(urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	// Show Login page.
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/WEB-INF/views/user/loginUser.jsp");

			dispatcher.forward(request, response);
	}

	// When the user enters userName & password, and click Submit.
	// This method will be executed.
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String rememberMeStr = request.getParameter("rememberMe");
		boolean remember = "Y".equals(rememberMeStr);
		String passwordmd5 = getMd5(password);//md5 string
		
		UserAccount user = null;
		Role role = null;
		boolean hasError = false;
		String errorString = null;

		if (userName == null || password == null || userName.length() == 0 || password.length() == 0) {
			hasError = true;
			errorString = "Required username and password!";
		} else {
			Connection conn = MyUtils.getStoredConnection(request);
			try {
				// Find the user in the DB.
				user = UserDAO.findUser(conn, userName, passwordmd5);
				// find role
				role = RoleDAO.findRole(conn, userName);
				if (user == null) {
					hasError = true;
					errorString = "User Name or password invalid";
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				hasError = true;
				errorString = e.getMessage();
			}
		}
		// If error, forward to /WEB-INF/views/login.jsp
		if (hasError) {
			user = new UserAccount();
			user.setUserName(userName);
			user.setPassword(password);

			// Store information in request attribute, before forward.
			request.setAttribute("errorString", errorString);
			request.setAttribute("user", user);
			
			// Forward to /WEB-INF/views/login.jsp
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/WEB-INF/views/user/loginUser.jsp");

			dispatcher.forward(request, response);
		}
		// If no error
		// Store user information in Session
		// And redirect to userInfo page.
		else {
			//save session
			HttpSession session = request.getSession();
			//session userName
			session.setAttribute("userName", userName);
			MyUtils.storeLoginedUser(session, user);
			//session role
			String roleName = role.getRoleName();
			session.setAttribute("roleName", roleName);
			MyUtils.storeLoginedRole(session, role);
			//System.out.print(role.getRoleName());
			// If user checked "Remember me".
			if (remember) {
				MyUtils.storeUserCookie(response, user);
				//MyUtils.storeRoleCookie(response, role);
			}
			// Else delete cookie.
			else {
				MyUtils.deleteUserCookie(response);
			}

			// Redirect to userInfo page.
			//response.sendRedirect(request.getContextPath() + "/home");
			
			
			if(role.getRoleName().equals("admin")){
				//session.setAttribute("admin", user);
				response.sendRedirect("homeAdmin");
				
				//dispatcher.forward(request, response);
			}else if(role.getRoleName().equals("user")){					
					//session.setAttribute("user", user);
					response.sendRedirect("home");
				}
		}
	}
	
	public static String getMd5(String input) 
    { 
        try {
            // Static getInstance method is called with hashing MD5 
            MessageDigest md = MessageDigest.getInstance( "MD5" ); 

            // digest() method is called to calculate message digest 
            //  of an input digest() return array of byte 
            byte [] messageDigest = md.digest(input.getBytes()); 

            // Convert byte array into signum representation 
            BigInteger no =  new BigInteger( 1 , messageDigest); 

            // Convert message digest into hex value 
            String hashtext = no.toString( 16 ); 

            while (hashtext.length() <  32 ) {
                hashtext =  "0" + hashtext;
            } 

            return hashtext; 
        }  

        // For specifying wrong message digest algorithms 
        catch (NoSuchAlgorithmException e) { 
            throw new RuntimeException(e); 
        } 
    }


}
