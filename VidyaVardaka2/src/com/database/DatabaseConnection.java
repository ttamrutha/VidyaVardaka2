package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection implements DAO {
	EstablishConnection establishConnection;
	Statement statement=null;
	ResultSet resultSet;
	int flag;
	String driver;
	String url;
	String userName;
	String pwd;
	Connection connection;

	public DatabaseConnection() {
		// TODO Auto-generated constructor stub
		driver = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://localhost/vidyavardaka";
		userName = "root";
		pwd = "root";
		establishConnection=new EstablishConnection();
		connection=getConnection();
		flag=-1;
		resultSet=null;
		
		
		
	}

	@Override
	public int putData(String data) {
		// TODO Auto-generated method stub
		try {
			statement=connection.createStatement();
			flag=statement.executeUpdate(data);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public ResultSet getData(String data) {
		// TODO Auto-generated method stub
		try {
			statement=connection.createStatement();
			resultSet=statement.executeQuery(data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultSet;
	}

	@Override
	public void closeConnection() {
		// TODO Auto-generated method stub
		if(connection!=null)
		{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public Connection getConnection() {
		try {
			//System.out.println("Inside Con" +url);
			Class.forName(driver);
			connection = DriverManager.getConnection(url, userName, pwd);
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
}
