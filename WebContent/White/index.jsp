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

  <%
  	HttpSession userSession = request.getSession();
    if (userSession != null)
    {
    	request.setAttribute("user", request.getSession().getAttribute("user"));
    } else
    {
    	request.setAttribute("user","RedLine");

    }
  %>

 	 <sql:setDataSource url="jdbc:mysql://localhost/RedLine"
		driver="com.mysql.jdbc.Driver" user="root" password="root"
		var="redLine" scope="session" />  
		
  		<sql:query var="result" dataSource="${redLine }"
			sql="Select * from User where user_name= ? ">
			<sql:param  value="${user}"/> 
		</sql:query>
		
		<c:forEach var="row" items="${result.rows}">

			<c:choose>
				<c:when test="${row.style=='0'}">
						<c:out value="${row.style}"/>
					 	<jsp:forward page="Standard.jsp"/> 
 				</c:when>
 				<c:when test="${row.style=='1' }">
 										<c:out value="${row.style}"/>
 		
 				 		<jsp:forward page="Panio.jsp"/> 
 			
 				
 				</c:when>		
 				<c:otherwise>					 	<jsp:forward page="Standard.jsp"/> 
 				
 				</c:otherwise>
 		 </c:choose>
		
		</c:forEach>
    <script src="../jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>