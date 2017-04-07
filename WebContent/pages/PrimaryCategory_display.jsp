
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
<link href="../css/bootstrap.css" rel="stylesheet">
 
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>Display</title>
</head>
<body>
		<div style="padding: 20px 0">
<!-- 		<a href="javascript:void(0)" class='btn btn-primary btn-sm example-p-4' role='button'>新增資料 </a>
 --> 		 <a href="<c:url value="/pages/insert_primarycategory.jsp" />" 
 class='btn btn-primary btn-sm' role='button'>新增資料 </a> 
 		</div>
  	<%
		PrimaryCategoryBeanService service = new PrimaryCategoryBeanService(
				new PrimaryCategoryBeanDAOHibernate(HibernateUtil.getSessionFactory()));;
		HttpSession userSession = request.getSession();
		String prod = userSession.getAttribute("user").toString();
		List<PrimaryCategoryBean> select = service.selectCategoryByProd(prod);
		System.out.print(select);

		request.setAttribute("select", select);
	%>	
	
 	<c:if test="${not empty select}">
 	
		<table class="table table-hover">
			<thead>
				<tr>
					<th></th>
					<th>客戶名稱</th>
					<th>大分類</th>
				 	<th>修改</th>
					<th>刪除</th>

				</tr>
			</thead>

			<tbody>
			<c:if test="${select!=null}">
				<c:forEach var="row" items="${select}">
 					<c:url value="/pages/update_primarycategory.jsp" var="update_path">
					 	<c:param name="id" value="${row.id}" />
					 	<c:param name="prodName" value="${row.prodName}" />
						<c:param name="category" value="${row.category}" />
						
					 
					</c:url>
					<c:url value="/pages/primary.controller" var="delete_path">
						<c:param name="prodaction" value="Delete" />
					 	<c:param name="id" value="${row.id}" />
						<c:param name="prodName" value="${row.prodName}" />
						<c:param name="category" value="${row.category}" />
						/>
						 
						
					</c:url>   
					
						<tr>
							<td><input name='id' value="${row.id }"  hidden='true'
							/> </td>
							<td> ${row.prodName}  </td>
							<td> ${row.category} </td>
							
							 <td>
							  <a href="${update_path}" class="btn btn-danger btn-sm" role="button">更新</a>
							 
  							</td> 
 							<td>
 							   <a href="${delete_path}" class="btn btn-danger btn-sm" role="button">刪除</a>
 							 </td> 
 							
						</tr>
 				</c:forEach>
			</c:if>
			</tbody>
			
		</table>
		<h6>大分類資料 : ${fn:length(select)} row(s)
		selected</h6>

	<h3>
		</form>
	</c:if>

<script type="text/javascript">
   $('.example-p-4').on('click', function () {
       $.dialog({
           title: '新增大分類資料',
           content: 'url:insert_primarycategory.jsp',
           animation: 'zoom',
           columnClass: 'medium',
           closeAnimation: 'scale',
           backgroundDismiss: true,
       });
   });
</script>	

</body>
</html>