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

import Mock.dao.UserDAO;
import Mock.model.UserAccount;
import Mock.utils.MyUtils;

@WebServlet(urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	// Show product creation page.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = req.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/user/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = MyUtils.getStoredConnection(req);
		
		String fullname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String createpassword = req.getParameter("createpassword");
		String repeatpassword = req.getParameter("repeatpassword");
//		System.out.println(createpassword);
//		System.out.print(repeatpassword);
//		boolean hasError = false;
		String errorString = null;

		if(createpassword.equals(repeatpassword))
		{
			String password = getMd5(createpassword);//md5 string
			UserAccount p = new UserAccount(email, password, 2, fullname, phone, null);
		      
			try {
					UserDAO.insertUser(conn, p);
			} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			}
			
			resp.sendRedirect(req.getContextPath() + "/home");
		}
		else{
			errorString = "Password and re-enter password do not match";	
			req.setAttribute("errorString", errorString);
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/user/register.jsp");
			dispatcher.forward(req, resp);
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
