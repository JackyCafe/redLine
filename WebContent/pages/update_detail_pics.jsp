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
		DetailBeanService service = new DetailBeanService(
				new DetailBeanDAOHibernate(HibernateUtil.getSessionFactory()));
		List<DetailBean> lists = service.select();
	%>
	<div data-role="page">
		<div data-role="content">
			<form action='<c:url value="/pages/detailpics.controller" />'
				method='get'>
				<div data-role="fieldcontain">
					<label for="id" hidden='true'>Id</label> <input type="text"
						name="id" id="id" hidden='true' value="1" />

				</div>
				<div data-role="fieldcontain">

					<label for="detail">明細</label> <select name='detail' id='detail'
 						data-msg-required="分類需填寫" required>
						<option>
							<%
								for (DetailBean s : lists)
									out.print("<option>" + s.getDetail() + "</option>");
							%>

						</option>
					</select>
				</div>

				<div data-role="fieldcontain">
					<label for="detail"> 照片 </label> <input type="text" name="pics"
						id="pics" value="${param.pics}" placeholder="請輸入明細" /><br>
				</div>

 

			 
				 
				<br>
				

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