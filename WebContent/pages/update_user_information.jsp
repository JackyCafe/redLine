<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix ="sql" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<c:out value = "${param.user}" />
<c:out value = "${param.style}" />

<sql:setDataSource url="jdbc:mysql://localhost/RedLine"
		driver="com.mysql.jdbc.Driver" user="root" password="root"
		var="redLine" scope="session" />
  		<sql:update var="result" dataSource="${redLine}"
			sql="update User set style =?  where user_name= ?" > 
			 <sql:param value="${param.style }" />
		     <sql:param value="${param.user }" />
			
		</sql:update>
		<jsp:forward page='maintain.jsp'/> 
<title>Jacky Big Company</title>
</head>
<body>

    <script src="../jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>