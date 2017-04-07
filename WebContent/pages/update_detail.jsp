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
		MinorCategoryBeanService service = new MinorCategoryBeanService(
				new MinorCategoryBeanDAOHibernate(HibernateUtil.getSessionFactory()));
		List<MinorCategoryBean> lists = service.select();
	%>
	<div data-role="page">
		<div data-role="content">
			<form action='<c:url value="/pages/detail.controller" />' enctype="multipart/form-data"
				method='post'>
				<div data-role="fieldcontain">
					<label for="id" hidden='true'>Id</label> <input type="text"
						name="id" id="id" hidden='true' value="${param.id}" />

				</div>
				<div data-role="fieldcontain">

					<label for="item">小分類</label> <select name='item' id='item'
 						data-msg-required="分類需填寫" required>
						<option>
							<%
								for (MinorCategoryBean s : lists)
									out.print("<option>" + s.getItem() + "</option>");
							%>

						</option>
					</select>
				</div>

				<div data-role="fieldcontain">
					<label for="prod_id"> 產品編號 </label> <input type="text" name="prod_id"
						id=""prod_id"" value="${param.prod_id}" placeholder="請輸入產品編號" /><br>
				</div>




				<div data-role="fieldcontain">
					<label for="detail"> 明細 </label> <input type="text" name="detail"
						id="detail" value="${param.detail}" placeholder="請輸入明細" /><br>
				</div>


				<div data-role="fieldcontain">
					<label for="color"> Color: </label> <input type="text" name="color"
						id="color" value="${param.color}" placeholder="color" /><br>
				</div>

				<div data-role="fieldcontain">
					<label for="size"> Size:</label> <select name=size>
						<option>S</option>
						<option>M</option>
						<option>L</option>
						<option>XL</option>
						<option>XXL</option>

					</select> <br>
				</div>
				<div data-role="fieldcontain">
					<label for="qty"> 數量 : </label> <input type ="text" name="qty"
						id="qty" value="${param.qty}" placeholder="數量" /><br>
				</div>
				
				<div data-role="fieldcontain">
					<label for="pics"> 照片 : </label> <input type="file" name="pics"
						id="pics" value="${param.pics}" placeholder="照片" /><br>
				</div>

				<div data-role="fieldcontain">
					<label for="price"> 價格 : </label> <input type="price" name="price"
						id="price" value="${param.price}" placeholder="價格" /><br>
				</div>
				<div data-role="fieldcontain">
					<label for="proddesc"> 產品描述:</label>
					<textarea rows="10" cols="80" name="proddesc" id="proddesc"
					  placeholder="產品名稱"><c:out value="${param.proddesc}" />
					</textarea>
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