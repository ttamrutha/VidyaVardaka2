package org.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JdbcConnections {
	public boolean registerUser(String name, String email, String pass) {
		boolean flag = false;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/vidyavardaka";
		String userName = "root";
		String pwd = "root";
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, userName, pwd);
			if (con != null) {
				Statement smt=con.createStatement();
				System.out.println("Connection Establish");
				String query1 = "SELECT * FROM  user_tbl WHERE userEmail='" + email + "'";
				ResultSet resultSet = smt.executeQuery(query1);
				if (!resultSet.next()) {
					String query = "insert into user_tbl(userName,userEmail,userPwd)values('" + name + "','" + email
							+ "','" + pass + "')";

					int row = smt.executeUpdate(query);
					if (row > 0) {
						flag = true;
					}

				} else {
					System.out.println("Fail to Connect ");
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;

	}
}
