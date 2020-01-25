<%@page import="com.database.DatabaseConnection"%>
<%@page import="com.database.DAO"%>
<%@page import="org.jdbc.JdbcConnections"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!DAO dao = new DatabaseConnection();%>
	<form action="">
		<table>
			<tr>
				<th>Name</th>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="email" name="email" /></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="pwd" /></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="submit" value="Register" name="register" /></td>
			</tr>
		</table>
	</form>
	<%
		if (request.getParameter("register") != null) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");
			String query = "insert into user_tbl(userName,userEmail,userPwd)values('" + name + "','" + email + "','"
					+ pwd + "')";
			int flag = dao.putData(query);
			if (flag > 0) {
	%>
	<script type="text/javascript">
		alert("successfully registered");
		window.location.href = "Register.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("fail to  registered");
	</script>
	<%
		}
		}
	%>
</body>
</html>