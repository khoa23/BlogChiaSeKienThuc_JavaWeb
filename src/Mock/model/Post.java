package Mock.model;

import java.sql.Date;

public class Post {
	private long postID;
	private long categoryID;
	private long userID;
	private String title;
	private String content;
	private String image;
	private Date date;
	public Post() {

	}
	public Post(long postID,long categoryID,long userID,String title, String content, String image, Date date2) {
		this.postID = postID;
		this.categoryID =categoryID;
		this.userID =userID;
		this.title =title;
		this.content = content;
		this.image =image;
		this.date = date2;
		
	}
	public long getPostID() {
		return postID;
	}
	public void setPostID(long postID) {
		this.postID = postID;
	}
	public long getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(long categoryID) {
		this.categoryID = categoryID;
	}
	public long getUserID() {
		return userID;
	}
	public void setUserID(long userID) {
		this.userID = userID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
}
