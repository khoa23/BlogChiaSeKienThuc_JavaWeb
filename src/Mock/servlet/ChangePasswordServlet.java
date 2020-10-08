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

import Mock.dao.UserDAO;
import Mock.model.UserAccount;
import Mock.utils.MyUtils;

@WebServlet(urlPatterns = { "/changePassword" })
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChangePasswordServlet() {
		super();
	}

	// Show product edit page.
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/user/changePassword.jsp");
		dispatcher.forward(request, response);

	}

	// After the user modifies the product information, and click Submit.
	// This method will be executed.
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		
		HttpSession session = request.getSession(true);
		String username = (String)session.getAttribute("userName");
		
		String oldpassword = request.getParameter("oldpassword");
		String createpassword = request.getParameter("createpassword");
		String repeatpassword = request.getParameter("repeatpassword");

		String errorString = null;
		UserAccount user;
		
		try {
			user = UserDAO.findUser(conn, username);
			
			if(user.getPassword().equals(getMd5(oldpassword)))
			{	
				if(createpassword.equals(repeatpassword))//so sánh 2 mật khẩu mới
				{
					String password = getMd5(createpassword);//md5 string
					UserAccount p = new UserAccount(username, password, 2, null, null, null);
				      
					try {
							UserDAO.updatePassword(conn, p);
					} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
					}
					
					response.sendRedirect(request.getContextPath() + "/home");
				}
				else{
					errorString = "Password and re-enter password do not match";	
					request.setAttribute("errorString", errorString);
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/user/changePassword.jsp");
					dispatcher.forward(request, response);
				}	
			}
			else{
				errorString = "Old passwords do not match";	
				request.setAttribute("errorString", errorString);
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/user/changePassword.jsp");
				dispatcher.forward(request, response);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
