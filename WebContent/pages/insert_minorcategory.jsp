<%@page import="model.PrimaryCategoryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="model.dao.*" %>
<%@page import="model.service.*" %>
<%@page import="model.misc.*" %>

<%@page import="java.util.*" %>
   
 <html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<!--<script src="jquery3.1.1.js"></script>-->
<script type="text/javascript">
	function clearForm() {
		var inputs = document.getElementsByTagName("input");
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == "text") {
				inputs[i].value = "";
			}
		}
	}
</script>

<title>Jacky Big Company</title>

</head>
<body>
	<%PrimaryCategoryBeanService service = new PrimaryCategoryBeanService(
			new PrimaryCategoryBeanDAOHibernate(HibernateUtil.getSessionFactory()));
	List<PrimaryCategoryBean> lists =	service.select();
	%>
	<div data-role="page">
		<div data-role="content">
			<form action='<c:url value="/pages/minor.controller" />' method='post'>
				 
				<div data-role="fieldcontain" class="form-group">
					<label for="category">大分類</label>
					<select name ='category' id='category' value='${param.category}'  class="form-control input-sm">
	 					<option>
						<% for (PrimaryCategoryBean beans : lists)
						out.print("<option>"+beans.getCategory()+"</option>");
						 %>
						</option>
					</select>
				  <%-- <input type="text" name="category"
						id="category" value="${param.category}" placeholder="請輸入大分類" /> --%>
				</div>

				<div data-role="fieldcontain" class="form-group">
					<label for="item"> 小分類 </label>
					<input type="text" name="item" id="item" value="${param.item}" placeholder="請輸入小分類"  class="form-control input-sm" /><br>
				</div>
 				 
				<div class="form-group">
					<div class="btn-group" data-toggle="buttons">
						<input type="submit" name="prodaction" value="Insert" class="btn btn-danger btn-sm">
						<input type="button" value="清除" onclick="clearForm()" class="btn btn-danger btn-sm">
					</div>
				</div>
			</form>
		</div>
		<!-- page content -->
	</div>
	<!-- page -->



	<script src="../jquery.js"></script>
</body>
</html>