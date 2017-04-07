<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
	<div data-role="page">
		<div data-role="content">
			<form action='<c:url value="/pages/detail.controller" />'
				method='get'>
				<div data-role="fieldcontain">
					<label for="id">Id</label> <input type="text" name="id" id="id"
						value="${param.id}" />

				</div>
				<div data-role="fieldcontain">
					<label for="item">小分類</label> <input type="text" name="item"
						id="item" value="${param.item}" placeholder="請輸入小分類"
						onblur="checkId()" />
					<div id='here' float="left"></div>

				</div>

				<div data-role="fieldcontain">
					<label for="detail"> 明細 </label> <input type="text"
						name="detail" id="detail" value="${param.detail}"
						placeholder="請輸入明細" /><br>
				</div>


				<div data-role="fieldcontain">
					<label for="color"> Color: </label> <input type="text" name="color"
						id="color" value="${param.color}" placeholder="color" /><br>
				</div>

				<div data-role="fieldcontain">
					<label for="size"> Size:</label> <input type="size" name="size"
						id="size" value="${param.size}" placeholder="Size" /><br>
				</div>
				<div data-role="fieldcontain">
					<label for="pics"> 數量 : </label> <input type="pics" name="pics"
						id="pics" value="${param.pics}" placeholder="數量" /><br>
				</div>

				<div data-role="fieldcontain">
					<label for="price"> 價格 : </label> <input type="price" name="price"
						id="price" value="${param.price}" placeholder="價格" /><br>
				</div>
				<div data-role="fieldcontain">
					<label for="proddesc"> 產品描述:</label>
					<textarea rows="10" cols="80"   name="proddesc"
						id="proddesc" value="${param.proddesc}" placeholder="產品名稱">
					</textarea>
				</div>
				<br>


				<div class="ui-grid-a">
					<div class="ui-block-a">
						<tr>
							<td><input type="submit" name="prodaction" value="Insert"></td>
							<td><input type="submit" name="prodaction" value="Update"></td>
							<td><input type="submit" name="prodaction" value="Delete"></td>
							<td><input type="submit" name="prodaction" value="Select"></td>
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