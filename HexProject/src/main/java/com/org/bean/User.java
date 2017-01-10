package com.org.bean;

import java.sql.Date;

public class User {
	private Long userId;
	private Long roleId;
	private String roleName;
	private String userName;
	private String userPassword;
	private Date regDate;
	
	public User(){}
	
	public User (Long userId, Long roleId, String roleName, String userName, String userPassword, Date regDate){
		this.userId = userId;
		this.roleId = roleId;
		this.roleName = roleName;
		this.userName = userName;
		this.userPassword = userPassword;
		this.regDate = regDate;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getUserId() {
		return userId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", roleId=" + roleId + ", roleName=" + roleName + ", userName=" + userName
				+ ", userPassword=" + userPassword + ", regDate=" + regDate + "]";
	}
	
	

}
