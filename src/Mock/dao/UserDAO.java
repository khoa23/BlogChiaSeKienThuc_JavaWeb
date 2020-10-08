package Mock.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Mock.model.UserAccount;

public class UserDAO {
	public static UserAccount findUser(Connection conn, String userName, String password) throws SQLException {

		String sql = "Select a.UserName, a.Password, b.id_role from Users a, Roles b " //
				+ " where a.UserName = ? and a.password= ? and a.id_role = b.id_role";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userName);
		pstm.setString(2, password);
		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			int roleID = rs.getInt("ID_Role");
			UserAccount user = new UserAccount();
			user.setUserName(userName);
			user.setPassword(password);
			user.setRoleID(roleID);
			return user;
		}
		return null;
	}

	public static UserAccount findUser(Connection conn, String userName) throws SQLException {

		String sql = "Select * from Users where UserName = ? ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userName);

		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			String password = rs.getString("Password");
			String fullname = rs.getString("FULLNAME");
			String phone = rs.getString("PHONE");
			String address = rs.getString("ADDRESS");
			
			UserAccount user = new UserAccount();
			user.setUserName(userName);
			user.setPassword(password);
			user.setFullname(fullname);
			user.setPhone(phone);
			user.setAddress(address);
		
			return user;
		}
		return null;
	}
	
	public static void insertUser(Connection conn, UserAccount user) throws SQLException {
		String sql = "Insert into USERS (USERNAME, PASSWORD, ID_ROLE, FULLNAME, PHONE)  values (?,?,?,?,?)";

		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);

		pstm.setString(1, user.getUserName());
		pstm.setString(2, user.getPassword());
		pstm.setInt(3, user.getRoleID());
		pstm.setString(4, user.getFullname());
		pstm.setString(5, user.getPhone());
		//pstm.setString(6, user.getAddress());
	
		pstm.executeUpdate();
	}
	
	public static void updateUser(Connection conn, UserAccount user) throws SQLException {
		String sql = "Update users set FULLNAME=?, PHONE=?, ADDRESS=? where USERNAME=?";

		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);

		pstm.setString(1, user.getFullname());
		pstm.setString(2, user.getPhone());
		pstm.setString(3, user.getAddress());
		pstm.setString(4, user.getUserName());
		pstm.executeUpdate();
	}
	
	public  static ArrayList<UserAccount> getListUser(Connection conn) throws SQLException {    
		 String sql = "SELECT * FROM users ";
			 PreparedStatement pstm = conn.prepareStatement(sql);      
	        ResultSet rs = pstm.executeQuery();
	        ArrayList<UserAccount> list = new ArrayList<>();
	        while (rs.next()) {
	        	UserAccount user = new UserAccount();
	      		 user.setUserID(rs.getLong("ID_USER"));
	      		 user.setUserName(rs.getString("USERNAME"));
	      		user.setPassword(rs.getString("PASSWORD"));
	      		user.setRoleID(rs.getInt("ID_ROLE"));
	      		user.setFullname(rs.getString("FULLNAME"));
	      		user.setPhone(rs.getString("PHONE"));
	      		user.setAddress(rs.getString("ADDRESS"));			
	            list.add(user);
	        }
	        return list;
	    }
	public static void deleteUser(Connection conn, long userID) throws SQLException {
		String sql = "Delete from users where ID_USER= ?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setLong(1, userID);
		pstm.executeUpdate();
	}
	
	public static void updatePassword(Connection conn, UserAccount user) throws SQLException {
		String sql = "Update users set PASSWORD=? where USERNAME=?";

		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);

		pstm.setString(1, user.getPassword());
		pstm.setString(2, user.getUserName());
		pstm.executeUpdate();
	}
}
