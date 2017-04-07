<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@page import="model.*" %>
<%@page import="model.misc.*" %>
<%@page import="model.dao.*" %>
<%@page import="model.service.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/table.css" />

<title>Display</title>
</head>
<body>

	<h3>Select Product Table Result : ${fn:length(select)} row(s)
		selected</h3>

	<h3>
		<a href="<c:url value="/pages/Register.jsp" />">Customer Table</a>
	</h3>
	<%
		UserBeanService service = new UserBeanService(
				new UserBeanDAOHibernate(HibernateUtil.getSessionFactory()));;
		List<UserBean> select = service.select();
		request.setAttribute("select", select);
	%>	

	<c:if test="${not empty select}">
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Product Name</th>
					<th>Password</th>
					<th>Email</th>
					<th>Address</th>
					<th>Birthday</th>
					<th>Product Name</th>
					<th>Tel</th>
					<th>Mobile</th>
					<th>Style</th>
					<th>Story</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach var="row" items="${select}">
					<c:url value="/pages/Register.jsp" var="path">
						<c:param name="id" value="${row.id}" />
						<c:param name="user_Name" value="${row.user_Name}" />
						<c:param name="password" value="${row.password}" />
						<c:param name="email" value="${row.email}" />
						<c:param name="address" value="${row.address}" />
						<c:param name="birthday" value="${row.birthday}" />
						<c:param name="prod_name" value="${row.prod_name}" />
						<c:param name="tel" value="${row.tel}" />
						<c:param name="mobile" value="${row.mobile}" />
						<c:param name="style" value="${row.style}" />
						<c:param name="brand_desc" value="${row.brand_desc}" />

					</c:url>
					<tr>
						<td><a href="${path}">${row.id}</a></td>
						<td>${row.user_Name}</td>
						<td>${row.password}</td>
						<td>${row.email}</td>
						<td>${row.address}</td>
						<td>${row.birthday}</td>

						<td>${row.prod_name}</td>
						<td>${row.tel}</td>
						<td>${row.mobile}</td>
						<td>${row.style}</td>

						<td>${row.brand_desc}</td>

					</tr>
				</c:forEach>

			</tbody>
		</table>
	</c:if>


</body>
</html>