package com.database;

import java.sql.ResultSet;

public interface DAO {
public int putData(String data);
public ResultSet getData(String data);
public void closeConnection();

}
