package com.user.beans;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONException;
import org.json.JSONObject;

import com.database.DAO;
import com.database.DatabaseConnection;

public class User implements Serializable {
	private int userId;
	private String userName, userEmail, userPwd;
	DAO  dao;
	private boolean flag;
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public User() {
		// TODO Auto-generated constructor stub
		userEmail="";
		userPwd="";
		userName="";
		flag=false;
		dao=new DatabaseConnection();
	}
	public JSONObject  checkLog()
	{
		JSONObject jsonObject=new JSONObject();
		String query1 = "SELECT * FROM  user_tbl WHERE userEmail='" + getUserEmail() + "' and userPwd='"+getUserPwd()+"'";
		ResultSet resultSet =dao.getData(query1);
		try
		{
		if (!resultSet.next()) {
			/*String query = "insert into user_tbl(userName,userEmail,userPwd)values('" + getUserName() + "','" + getUserEmail()
					+ "','" + getUserPwd() + "')";

			int row =dao.putData(query);
			if (row > 0) {
				flag = true;*/
			jsonObject.put("status", -1);
			
			}
		else
		{
			jsonObject.put("status", 1);
			jsonObject.put("userId", resultSet.getInt(1));
	

		} 
	}
 catch ( SQLException | JSONException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
return jsonObject;

}
}
