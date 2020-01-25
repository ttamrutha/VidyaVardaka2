<%@page import="com.user.beans.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String name=request.getParameter("user_name");
String pass=request.getParameter("password");
User user=new User();
user.setUserEmail(name);
user.setUserPwd(pass);
String result=user.checkLog().toString();
out.print(result);
%>