
<%@page import="javax.persistence.metamodel.SetAttribute"%>
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
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="../jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />  
<title>Display</title>
</head>
<body>
 	<c:if test="${empty pics}">
	<%
		DetailPicsBeanService service = new DetailPicsBeanService(
				new DetailPicsBeanDAOHibernate(HibernateUtil.getSessionFactory()));;
		List<DetailPicsBean> pics = service.select( );
		request.setAttribute("pics", pics);
	%>	
	
	</c:if>  
	<c:if test="${not empty pics}">
		<form action="detailpics.controller" method ='post'>
	
		<table>
			<thead>
				<tr>
					<th></th>
 					<th>明細</th>
 					<th>照片</th>
 					<th>修改</th>
					<th>刪除</th>

				</tr>
			</thead>

			<tbody>

				<c:forEach var="row" items="${pics}">
				<form  action ="detailpics.controller" method ='post'>
					<c:url value="/pages/update_detail_pics.jsp" var="update_path">
					 	<<c:param name="id" value="${row.id}" />
 						<c:param name="detail" value="${row.detail}" />
 						<c:param name="pics" value="${row.pics}" />
 					</c:url>
					<c:url value="/pages/detailpics.controller" var="delete_path">
						<c:param name="prodaction" value="Delete" />
						<c:param name="id" value="${row.id}" />
 						<c:param name="detail" value="${row.detail}" />
 						<c:param name="upload" value="${row.pics}" />
 						/>
						 
						
					</c:url>   
					
						<tr>
							<td><input name='id' value="${row.id }"   
							/> </td>
 							<td> ${row.detail}  </td>
 							<td> ${row.pics}  </td>
 
  							<%-- <td><a href="${delete_path}"  class="button">刪除</a></td>    --%>
 							<td>
 							   <a href="${update_path}" class="btn btn-primary" role="button">更新</a>
 							
  							</td> 
 							<td>
  								<a href="${delete_path}" class="btn btn-primary" role="button">刪除</a>
  							
 								<!-- <input type=submit name='prodaction' value='Delete'> -->
 							</td> 
 							
						</tr>
						</form>
				</c:forEach>

			</tbody>
			
		</table>
		</form>
	</c:if>
	共 : ${fn:length(pics)} 筆資料

</body>
</html>