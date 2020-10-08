package Mock.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import Mock.model.Post;


public class PostDao {
	public static void insertPost(Connection conn, Post post) throws SQLException {
		String sql = "Insert into posts(ID_CATEGORY, TITLE,CONTENT, IMAGE,ID_USER, DATE) values (?,?,?,?,?,?)";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setLong(1, post.getCategoryID());
		pstm.setString(2, post.getTitle());
		pstm.setString(3, post.getContent());
		pstm.setString(4,post.getImage());
		
		pstm.setLong(5, post.getUserID());
		pstm.setDate(6, post.getDate());
		pstm.executeUpdate();
	}
	 public  static ArrayList<Post> getListPost(Connection conn) throws SQLException {    
		 String sql = "SELECT * FROM posts ";
			 PreparedStatement pstm = conn.prepareStatement(sql);      
	        ResultSet rs = pstm.executeQuery();
	        ArrayList<Post> list = new ArrayList<>();
	        while (rs.next()) {
	      		 Post post = new Post();
	      		 post.setPostID(rs.getLong("ID_POST"));
	      		 post.setCategoryID(rs.getLong("ID_CATEGORY"));
	      		post.setTitle(rs.getString("TITLE"));
	      		post.setContent(rs.getString("CONTENT"));
	      		post.setUserID(rs.getLong("ID_USER"));
	      		post.setDate(rs.getDate("DATE"));
	      		post.setImage(rs.getString("IMAGE"));			
	            list.add(post);
	        }
	        return list;
	    }

	public static ArrayList<Post> getListPostByCategory(Connection conn, String categoryID) throws SQLException {
		String sql = "Select * from posts where ID_CATEGORY='"+categoryID+"'";

		PreparedStatement pstm = conn.prepareStatement(sql);
		 ResultSet rs = pstm.executeQuery();
	        ArrayList<Post> list = new ArrayList<>();
	        while (rs.next()) {
	            Post post = new Post();
	            post.setPostID(rs.getLong("ID_POST"));
	            post.setDate(rs.getDate("Date"));
				post.setTitle(rs.getString("Title"));
				post.setContent(rs.getString("Content"));
				post.setUserID(rs.getLong("ID_USER"));
				
				post.setImage(rs.getString("Image")); 
	            list.add(post);
	        }
	        return list;
	    }
	
	public static ArrayList<Post> getListPostByName(Connection conn, String nameCategory) throws SQLException {
		String sql = "SELECT p.* FROM posts p, category c WHERE p.ID_CATEGORY = c.ID_CATEGORY AND c.NAME_CATEGORY='"+nameCategory+"'";

		PreparedStatement pstm = conn.prepareStatement(sql);
		 ResultSet rs = pstm.executeQuery();
	        ArrayList<Post> list = new ArrayList<>();
	        while (rs.next()) {
	            Post post = new Post();
	            post.setPostID(rs.getLong("ID_POST"));
	            post.setDate(rs.getDate("Date"));
				post.setTitle(rs.getString("Title"));
				post.setContent(rs.getString("Content"));
				post.setUserID(rs.getLong("ID_USER"));				
				post.setImage(rs.getString("Image")); 
	            list.add(post);
	        }
	        return list;
	    }
	
	public static ArrayList<Post> searchListPostByName(Connection conn, String name) throws SQLException {
		//full text search
		String sql = "SELECT p.* FROM posts p, category c WHERE MATCH(p.TITLE) AGAINST('"+name+"') OR MATCH(p.CONTENT) AGAINST('"+name+"') OR MATCH(c.NAME_CATEGORY) AGAINST('"+name+"') GROUP BY p.ID_POST";

		PreparedStatement pstm = conn.prepareStatement(sql);
		 ResultSet rs = pstm.executeQuery();
	        ArrayList<Post> list = new ArrayList<>();
	        while (rs.next()) {
	            Post post = new Post();
	            post.setPostID(rs.getLong("ID_POST"));
	            post.setDate(rs.getDate("Date"));
				post.setTitle(rs.getString("Title"));
				post.setContent(rs.getString("Content"));
				post.setUserID(rs.getLong("ID_USER"));				
				post.setImage(rs.getString("Image")); 
	            list.add(post);
	        }
	        return list;
	    }

	//lấy danh sách bài viết
	 public ArrayList<Post> getListPostByNav(Connection conn, long categoryID, int firstResult, int maxResult) throws SQLException {
	        String sql = "SELECT * FROM posts WHERE ID_CATEGORY = '" + categoryID + "' limit ?,?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, firstResult);
	        ps.setInt(2, maxResult);
	        ResultSet rs = ps.executeQuery();
	        ArrayList<Post> list = new ArrayList<>();
	        while (rs.next()) {
	            Post post = new Post();
	            post.setPostID(rs.getLong("PostID"));
	            post.setDate(rs.getDate("Date"));
				post.setTitle(rs.getString("Title"));
				post.setContent(rs.getString("Content"));
				post.setUserID(rs.getLong("UserID"));
				post.setImage(rs.getString("Image"));
	            list.add(post);
	        }
	        return list;
	    }
	 public static Post findPost(Connection conn, Long postID) throws SQLException {
			String sql = "Select * from posts where ID_POST='"+postID+"'";


			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();

			while (rs.next()) {
				Long categoryID = rs.getLong("ID_CATEGORY");
				String title = rs.getString("Title");
				String content = rs.getString("Content");
				Long userID = rs.getLong("ID_USER");
				Date date = rs.getDate("Date");
				String image= rs.getString("Image");
				  Post post = new Post(postID,categoryID, userID, title, content,image,date);
				return post;
			}
			return null;
		}
	 public static void updatePost(Connection conn, Post post) throws SQLException {
			String sql = "Update posts set ID_CATEGORY =?, TITLE=?, CONTENT =?, IMAGE=? ,ID_USER =?, DATE=?  where ID_POST=? ";

			PreparedStatement pstm = conn.prepareStatement(sql);

			
			pstm.setLong(1, post.getCategoryID());
			pstm.setString(2, post.getTitle());
			pstm.setString(3, post.getContent());
			pstm.setString(4, post.getImage());
			pstm.setLong(5, post.getUserID());
			pstm.setDate(6, post.getDate());
			pstm.setLong(7, post.getPostID());
			pstm.executeUpdate();
		}
	 public static void deletePost(Connection conn, long postID) throws SQLException {
			String sql = "Delete from posts where ID_POST= ?";

			PreparedStatement pstm = conn.prepareStatement(sql);

			pstm.setLong(1, postID);

			pstm.executeUpdate();
		}
	 
	 public static Post recentPost(Connection conn) throws SQLException {
			String sql = "SELECT * FROM posts p ORDER BY p.DATE DESC LIMIT 1";


			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();

			while (rs.next()) {
				Long postID = rs.getLong("ID_POST");
				Long categoryID = rs.getLong("ID_CATEGORY");
				String title = rs.getString("Title");
				String content = rs.getString("Content");
				Long userID = rs.getLong("ID_USER");
				Date date = rs.getDate("Date");
				String image= rs.getString("Image");
				  Post post = new Post(postID,categoryID, userID, title, content,image,date);
				return post;
			}
			return null;
		}
	 
	 public static ArrayList<Post> htmlPost(Connection conn) throws SQLException {
			String sql = "SELECT p.* FROM posts p, category c WHERE p.ID_CATEGORY = c.ID_CATEGORY and c.NAME_CATEGORY = 'html' ORDER BY p.DATE ASC LIMIT 3";

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
	        ArrayList<Post> list = new ArrayList<>();
	        while (rs.next()) {
	            Post post = new Post();
	            post.setPostID(rs.getLong("ID_POST"));
	            post.setDate(rs.getDate("Date"));
				post.setTitle(rs.getString("Title"));
				post.setContent(rs.getString("Content"));
				post.setUserID(rs.getLong("ID_USER"));
				post.setImage(rs.getString("Image"));
	            list.add(post);
	        }
	        return list;
		}
	 
	 public static ArrayList<Post> cssPost(Connection conn) throws SQLException {
			String sql = "SELECT p.* FROM posts p, category c WHERE p.ID_CATEGORY = c.ID_CATEGORY and c.NAME_CATEGORY = 'css' ORDER BY p.DATE ASC LIMIT 3";

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
	        ArrayList<Post> list = new ArrayList<>();
	        while (rs.next()) {
	            Post post = new Post();
	            post.setPostID(rs.getLong("ID_POST"));
	            post.setDate(rs.getDate("Date"));
				post.setTitle(rs.getString("Title"));
				post.setContent(rs.getString("Content"));
				post.setUserID(rs.getLong("ID_USER"));
				post.setImage(rs.getString("Image"));
	            list.add(post);
	        }
	        return list;
		}
	 
	 public static ArrayList<Post> javaScriptPost(Connection conn) throws SQLException {
			String sql = "SELECT p.* FROM posts p, category c WHERE p.ID_CATEGORY = c.ID_CATEGORY and c.NAME_CATEGORY = 'javascript' ORDER BY p.DATE ASC LIMIT 3";

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
	        ArrayList<Post> list = new ArrayList<>();
	        while (rs.next()) {
	            Post post = new Post();
	            post.setPostID(rs.getLong("ID_POST"));
	            post.setDate(rs.getDate("Date"));
				post.setTitle(rs.getString("Title"));
				post.setContent(rs.getString("Content"));
				post.setUserID(rs.getLong("ID_USER"));
				post.setImage(rs.getString("Image"));
	            list.add(post);
	        }
	        return list;
		}
	 public static ArrayList<Post> findListPostByIDCategory(Connection conn, long postID) throws SQLException {
			String sql = "SELECT * FROM posts  WHERE ID_CATEGORY = (SELECT ID_CATEGORY FROM posts WHERE ID_POST = '"+postID+"') ORDER BY DATE ASC ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
	        ArrayList<Post> list = new ArrayList<>();
	        while (rs.next()) {
	            Post post = new Post();
	            post.setPostID(rs.getLong("ID_POST"));
				post.setTitle(rs.getString("Title"));				
	            list.add(post);
	        }
	        return list;
		}
}
