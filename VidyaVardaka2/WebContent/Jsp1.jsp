<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
h1 {
	color: red;
}
</style>
</head>

<body>
	<h1><%=new Date().toString()%></h1>
	<%
		int table = 2;
		for (int i = 1; i <= 10; i++) {
			int result = table * i;
	%>
	<h1><%=table%>*<%=i%>=<%=result%></h1>

	<%
		}
	%>

</body>
</html>