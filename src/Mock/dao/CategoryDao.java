package Mock.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import Mock.model.Category;
import Mock.model.Post;
import Mock.model.UserAccount;
public class CategoryDao {
	public static List<Category> getListCategory(Connection conn) throws SQLException {
		 String sql = "SELECT * FROM category";
		
		 PreparedStatement pstm = conn.prepareStatement(sql);
		 
		 ResultSet rs = pstm.executeQuery();
		 List<Category> list = new ArrayList<Category>();
		 while (rs.next()) {
			 Category category = new Category();
			 category.setCategoryID(rs.getLong("ID_CATEGORY"));
			 category.setCategoryName(rs.getString("NAME_CATEGORY"));
			 
			 list.add(category);	
		 }
		 return list;
	}
	
	public static Category findCategoryByPostID(Connection conn, Long postID) throws SQLException {
		String sql = "SELECT c.* FROM category c, posts p WHERE p.ID_CATEGORY = c.ID_CATEGORY AND p.ID_POST = '"+postID+"' ";


		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {
			//Long categoryID = rs.getLong("ID_CATEGORY");
			String nameCategory = rs.getString("NAME_CATEGORY");
			Category category = new Category(nameCategory);
		
			return category;
		}
		return null;
	}
	public static void insertCategory(Connection conn, Category name) throws SQLException {
		String sql = "INSERT INTO category(NAME_CATEGORY) VALUES (?)";

		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);

		pstm.setString(1, name.getCategoryName());
		
		
	
		pstm.executeUpdate();
	}

}
