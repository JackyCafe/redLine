
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
<link href="../css/bootstrap.min.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>Display</title>
</head>
<body>

		<div style="padding: 20px 0">
<!-- 		<a href='javascript:void(0)' class='btn btn-primary btn-sm example-p-5' role='button'>新增資料</a>
 -->		 <a href="<c:url value="/pages/insert_minorcategory.jsp" />" 
 class='btn btn-primary btn-sm' role='button'>新增資料 </a> 
		</div>
<%-- 	<c:if test="${empty select}">
 --%>	<%
		MinorCategoryBeanService service = new MinorCategoryBeanService(
				new MinorCategoryBeanDAOHibernate(HibernateUtil.getSessionFactory()));
 		int pages;
 		if (request.getParameter("pages")==null) {
 			pages = 1;
 		} else
 		{
 			pages = Integer.valueOf(request.getParameter("pages"));
 		}
 		System.out.print(pages);
		List<MinorCategoryBean> select = service.SelectByPage(pages);
		request.setAttribute("select", select);
	%>	
	
<%-- 	</c:if>  
 --%>	<c:if test="${not empty select}">
 	
		<table class="table table-hover">
			<thead>
				<tr>
					<th></th>
					<th>大分類</th>
					<th>小分類</th>
				 	<th>修改</th>
					<th>刪除</th>

				</tr>
			</thead>

			<tbody>

				<c:forEach var="row" items="${select}">
 					<c:url value="/pages/maintain.jsp" var="update_path">
					 	<c:param name="id" value="${row.id}" />
						<c:param name="category" value="${row.category}" />
						<c:param name="item" value="${row.item}" />
					 
					</c:url>
					<c:url value="/pages/minor.controller" var="delete_path">
						<c:param name="prodaction" value="Delete" />
					 	<c:param name="id" value="${row.id}" />
						<c:param name="item" value="${row.category}" />
						<c:param name="detail" value="${row.item}" />
						/>
						 
						
					</c:url>   
					
						<tr>
							<td><input name='id' value="${row.id }"  hidden='true'
							/> </td>
							<td> ${row.category} </td>
							<td> ${row.item}  </td>
							 <td>
							  <a href="${update_path}" class="btn btn-danger btn-sm" role="button">更新</a>
							 	</td> 
 							<td>
 							   <a href="${delete_path}" class="btn btn-danger btn-sm" role="button">刪除</a>
 							
  							
  							</td> 
 							
						</tr>
 				</c:forEach>
			

 			</tbody>
			
		</table>
		<% 		
		int	size = service.Count();
		int totalPages = (int) (size /5)+1 ;
		for (int i=1;i<=totalPages;i++)
 			//out.print("<a href = 'MinorCategory_display.jsp?pages='"+i+"/>"+i+"</a>");
			out.print("<a href = 'maintain.jsp?pages="+i+"'/>"+ i +"</a>");
		%>

		<h6>小分類資料 : ${fn:length(select)} row(s)
					selected</h3>
				</h6>
		</form>
	</c:if>
<script type="text/javascript">
   $('.example-p-5').on('click', function () {
       $.dialog({
           title: '新增小分類資料',
           content: 'url:insert_minorcategory.jsp',
           animation: 'zoom',
           columnClass: 'medium',
           closeAnimation: 'scale',
           backgroundDismiss: true,
       });
   });
</script>		

</body>
</html>