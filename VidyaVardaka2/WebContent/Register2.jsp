<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here    </title>
</head>
<body>
<jsp:useBean id="user" class="com.user.beans.User"></jsp:useBean>
<form action="">

		<table>
			<tr>
				<th>Name</th>
				<td><input type="text" name="userName"  /></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="email" name="userEmail" /></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="userPwd" /></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="submit" value="Register" name="register" /></td>
			</tr>
		</table>
	</form>
	<%
	if(request.getParameter("register")!=null)
	{
		%>
		<jsp:setProperty property="*" name="user"/>
		<%
		boolean flag=user.disply();
		if (flag) {
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