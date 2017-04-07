<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="model.*"%>

<%@page import="model.dao.*"%>
<%@page import="model.service.*"%>
<%@page import="model.misc.*"%>

<%@page import="java.util.*"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="../jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="../jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
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
	<%
		PrimaryCategoryBeanService service = new PrimaryCategoryBeanService(
				new PrimaryCategoryBeanDAOHibernate(HibernateUtil.getSessionFactory()));
		List<PrimaryCategoryBean> lists = service.select();
	%>
	<div data-role="page">
		<div data-role="content">
			<form action='<c:url value="/pages/primary.controller" />'
				method='post'>
				<div data-role="fieldcontain">
					<label for="id" hidden='true'>Id</label> <input type="text"
						name="id" id="id" hidden='true' value="${param.id}" />

					<div data-role="fieldcontain">
						<label for="prodName"> 客戶名稱 </label> <input type="text" name="prodName"
							id="prodName" value="${param.prodName}" placeholder="請輸入客戶名稱" /><br>
					</div>
				</div>
				<div data-role="fieldcontain">
 					<label for="category">大分類</label> <input type="text" name="category"
						id="category" value="${param.category}" placeholder="請輸入大分類" />
				</div>



				<div class="ui-grid-a">
					<div class="ui-block-a">
						<tr>
							<td><input type="submit" name="prodaction" value="Update"></td>
							<td><input type="button" value="清除" onclick="clearForm()"></td>
						</tr>
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