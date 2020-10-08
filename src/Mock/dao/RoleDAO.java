package Mock.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Mock.model.Role;

public class RoleDAO {
	public static Role findRole(Connection conn, String userName) throws SQLException {

		String sql = "SELECT r.* FROM users u, roles r WHERE u.ID_ROLE = r.ID_ROLE AND u.USERNAME = ? ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userName);

		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			int roleID = rs.getInt("ID_ROLE");
			String roleName = rs.getString("NAME_ROLE");
			
			Role role = new Role();
			role.setRoleID(roleID);
			role.setRoleName(roleName);
		
			return role;
		}
		return null;
	}
}