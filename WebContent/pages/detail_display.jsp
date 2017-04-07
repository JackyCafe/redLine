
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
<link href="../css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="../jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
<link href="../css/jquery-confirm.css" rel="stylesheet">
<script src="../js/jquery-confirm.js"></script>
<title>Display</title>
</head>
<body>
	<div style="padding: 20px 0"></div>
 	<%-- <h3>
		<a href="<c:url value="/pages/insert_detail.jsp" />">新增資料 </a>
	</h3> --%>
	<c:if test="${empty primary}">
	<%
		DetailBeanService service = new DetailBeanService(
				new DetailBeanDAOHibernate(HibernateUtil.getSessionFactory()));;
		int pages = 0 ;
		if (request.getParameter("pages")==null) {
 			pages = 1;
 		} else
 		{
 			pages = Integer.valueOf(request.getParameter("pages"));
 		}
 		System.out.print(pages);
		List<DetailBean> primary = service.selectByPages(pages);
		request.setAttribute("primary", primary);
	
 	%>	
	
	</c:if>  
	<c:if test="${not empty primary}">
		<form action="detail.controller" method ='get'>
	
		<table class="table table-hover">
			<thead>
				<tr>
					<th></th>
					<th>照片</th>
					<th>小分類</th>
					<th>產品編號</th>
					<th>明細</th>
					<th>顏色</th>
					<th>尺寸</th>
					
					<th>數量</th>
					<th>價格</th>
					<th>產品描述</th>
					<th>修改</th>
					<th>刪除</th>

				</tr>
			</thead>

			<tbody>

				<c:forEach var="row" items="${primary}">
				<form  action ="detail.controller" method ='get'>
					<c:url value="/pages/update_detail.jsp" var="update_path">
					 	<<c:param name="id" value="${row.id}" />
						<c:param name="item" value="${row.item}" />
						<c:param name ="prod_id" value="${row.prod_id}" />
						<c:param name="detail" value="${row.detail}" />
						<c:param name="color" value="${row.color }" />
						<c:param name="size" value="${row.size}" />
						<c:param name="pics" value="${row.pics}" />
						<c:param name="qty" value="${row.qty}" />
						<c:param name="price" value="${row.price}" />
						<c:param name="proddesc" value="${row.proddesc}" />
					</c:url>
					<c:url value="/pages/detail.controller" var="delete_path">
						<c:param name="prodaction" value="Delete" />
						<c:param name="id" value="${row.id}" />
						<c:param name="item" value="${row.item}" />
						<c:param name ="prod_id" value="${row.prod_id}" />
 						<c:param name="detail" value="${row.detail}" />
						<c:param name="color" value="${row.color }" />
						<c:param name="size" value="${row.size}" />
						<c:param name="pics" value="${row.pics}" />
						<c:param name="qty" value="${row.qty}" />
						
						<c:param name="price" value="${row.price}" />
						
						<c:param name="proddesc" value="${row.proddesc}"
						/>
						 
						
					</c:url>   
					
						<tr>
							<td><input name='id' value="${row.id }"  hidden='true'
							/> </td>
							<td> <img src='../redLine/images/<c:out value="${row.pics}"/>' width=70 /> </td>

							<td> ${row.item} </td>
							<td> ${row.prod_id}	</td>
							<td> ${row.detail}  </td>
							<td> ${row.color}  </td>
							<td> ${row.size}   </td>
							
							
							<td> ${row.qty} </td>
							<td> ${row.price}  </td>

							<td>${row.proddesc}</td>
 							<%-- <td><a href="${delete_path}"  class="button">刪除</a></td>    --%>
 							<td>
 							   <a href="${update_path}" class="btn btn-danger btn-sm example-p-5" role="button">更新</a>
 							
  							</td> 
 							<td>
  								<a href="${delete_path}" class="btn btn-danger btn-sm" role="button">刪除</a>
  							
 								<!-- <input type=submit name='prodaction' value='Delete'> -->
 							</td> 
 							
						</tr>
						</form>
						
						
				</c:forEach>

			</tbody>
			
		</table>
	<% 		
		DetailBeanService service = new DetailBeanService(
		new DetailBeanDAOHibernate(HibernateUtil.getSessionFactory()));;
		int	size = service.Count();
		
		int totalPages = (int) (size /5)+1 ;
		for (int i=1;i<=totalPages;i++)
 			//out.print("<a href = 'MinorCategory_display.jsp?pages='"+i+"/>"+i+"</a>");
			out.print("<a href = 'maintain.jsp?pages="+i+"'/>"+i+"</a>");
		%>	
		</form>
	</c:if>
	
		<p>
	共 : ${fn:length(select)} 筆資料
</body>
</html>