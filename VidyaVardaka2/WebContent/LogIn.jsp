<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.DatabaseConnection"%>
<%@page import="com.database.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="">
<table>
<tr>
<th>Enter User Name</th>
<td><input type="text" name="userName">
</tr>
<tr>
<th>Enter Password</th>
<td><input type="password" name="userPass">
</tr>
<tr>
<th></th>
<td><input type="submit" name="userLog" value="LogIn">
</tr>
</table>
</form>
<%
if(request.getParameter("userLog")!=null)
{
String name=request.getParameter("userName");
String pass=request.getParameter("userPass");
System.out.println("Name="+name);
System.out.println("Password="+pass);
boolean flag=false;
DAO dao=new DatabaseConnection();
//String query="select * from user_tbl where userName='"+name+"' and userPwd='"+pass+"'";
String query="select * from user_tbl";
ResultSet resultSet=dao.getData(query);
while(resultSet.next())
{
	String dbUser=resultSet.getString("userName");
	String dbPass=resultSet.getString("userPwd");
	if(dbPass.equals(pass)&&dbUser.equals(name))
	{
	flag=true;
	break;
	}
}
if(flag)
{
	System.out.println("Sucessfully LogIn");
}
else
{
	System.out.println("Fail to  LogIn");
}

}
%>
</body>
</html>