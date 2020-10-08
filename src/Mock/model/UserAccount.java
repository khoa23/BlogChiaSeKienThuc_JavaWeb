package Mock.model;

public class UserAccount {
	private long userID;
	private String userName;
	private String password;
	private int roleID;
	private String fullname;
	private String phone;
	private String address;
	private Role role = new Role();
	
	public UserAccount() {

	}
	public UserAccount(String userName, String password, int role, String fullname, String phone, String address) {
		this.userName = userName;
		this.password = password;
		this.roleID = role;
		this.fullname = fullname;
		this.phone = phone;
		this.address = address;
		
	}
	public long getUserID() {
		return userID;
	}
	public void setUserID(long userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRoleID() {
		return roleID;
	}
	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
}
