<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="model.service.*"%>
<%@ page import="java.util.*"%>
<%@page import="model.misc.*"%>
<%@page import="model.dao.*"%>
<%@page import="model.*"%>
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
    MinorCategoryBeanService service = new MinorCategoryBeanService(
			new MinorCategoryBeanDAOHibernate(HibernateUtil.getSessionFactory()));
	List<MinorCategoryBean> minor = service.select();
	request.setAttribute("minor", minor);
	String primary = request.getParameter("primary");
 	request.setAttribute("primary", primary);

    %>
   
    <c:forEach  var="m" items="${minor}" >
     
    	 <c:if test = "${m.category == primary}"> 
    		<option><c:out value="${m.item}"/></option>
    	</c:if>	
    </c:forEach>
</body>
</html>