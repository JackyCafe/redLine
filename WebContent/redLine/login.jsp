<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>Jacky Big Company</title>
 </head>
 <body>
   	<sql:setDataSource url="jdbc:mysql://localhost/redLine?useUnicode=true&amp;characterEncoding=UTF8"
		driver="com.mysql.jdbc.Driver" user="root" password="root"
		var="redLine" scope="session" />
  		<sql:query var="result" dataSource="${redLine}"
			sql="Select * from User where user_name= ? and password =?">
			<sql:param value="${param.user }" />
			<sql:param value="${param.passwd }" />
			
		</sql:query>
		<c:choose>
		
		<c:when test="${result.rowCount == 1}">
				<%HttpSession userSession =request.getSession() ;
				  userSession.setAttribute("user", request.getParameter("user"));	
				%>
				<jsp:forward page="index.jsp"/>
		 </c:when>
		<c:otherwise> 
			帳號或密碼錯誤
		</c:otherwise>
	</c:choose>
 </body>
 </html>