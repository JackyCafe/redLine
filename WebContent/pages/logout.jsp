<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>Jacky Big Company</title>
<%
	HttpSession userSession = request.getSession();
    userSession.invalidate();
    response.sendRedirect("../redLine/index.jsp");
    
%>
  </head>
<body>

    <script src="../jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>