<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page import="model.service.*"%>
<%@ page import="java.util.*"%>
<%@page import="model.misc.*"%>
<%@page import="model.dao.*"%>
<%@page import="model.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>index</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../bootstrap/css/style.css">

<!-- jasny-Bootstrap -->

<!--jquery順序要放在前面-->
<script src="../bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../jasny-bootstrap/js/jasny-bootstrap.min.js"></script>
<script src="../js/jquery.vmodel.js"></script>

<style>
#sign_out {
	float: right;
}
.thumbnail {
	border: 1px #faebcc solid;
	border-radius: 10px;
	height: 150px;
	width: 1080px;
}

/*待修正*/
.preview {
	border: 2px #faebcc solid;
	border-radius: 10px;
	min-height: 270px;
	width: 100%;
}

input[type="file"] {
	display: inline-block;
}

label {
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
<script>
	$(document).ready(function() {
		//checklong();
		checkPrimary();
	});
	function checkPrimary() {
		var primary = document.getElementById('primary').value;

		$
				.ajax({
					url : 'http://localhost:8080/RedLine/pages/CheckPrimary.jsp?primary='
							+ primary,
					type : 'get',
					success : doSuccess,
				});

	}

	function doSuccess(json) {
		$('#item').html(json);
	}
</script>

</head>

<body>
	<c:choose>
		<c:when test="${sessionScope['user']==null }">
		登入連線遺失，將協助您返回登入頁面
 		<%
			response.sendRedirect("../redLine/index.jsp");
		%>
		</c:when>
		<c:when test="${sessionScope['user']!=null }">
			<div style="background-color: rgba(245,245,245,1); height: 90px; margin-bottom: 10px">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<h1 id="fh5co-logo">
								<a href="../redLine/index.jsp" ><c:out value="${user }"/></a>
							</h1>
						</div>
						<div class="col-md-6" style="padding-top: 25px">
							<a href='logout.jsp' id="sign_out" class="btn btn-default">登出</a>
						</div>
					</div>
				</div>
			</div>

			<div class="container">
				<div class="row">
					<ul class="nav nav-tabs">
						<li><a href="#home" data-toggle="tab">主頁</a></li>
	 					<li><a href="#maintain_primary" data-toggle="tab">大分類維護</a></li>
						<li><a href="#maintain_minor" data-toggle="tab">小分類維護</a></li>
						<li><a href="#product_new" data-toggle="tab">商品新增</a></li>
						<li><a href="#product_list" data-toggle="tab">商品列表</a></li>
					</ul>
				</div>
				 
 
					<div class="tab-content">
						<div class="tab-pane fade" id="home">

						<form action='update_user_information.jsp' method='get'>
 										<div class="form-group">
											<div class="col-xs-12 col-sm-4">

												<label for='standard'>標準版 </label> <input type='radio'
													id='standard' name='style' value=0 class="form-control"
													checked="checked" />
												<p>
											</div>
											<div class="col-xs-12 col-sm-4">

												<label for='paino'>手風琴 </label> <input type='radio'
													id='paino' name='style' value=1 class="form-control" /> <input
													type=hidden class="form-control" name='user'
													value="${sessionScope['user']}" />
											</div>
											<div class="col-xs-12 col-sm-4">
												<br> <br> <input type='submit'
													class="form-control" />
											</div>
										</div>
 
							</form>
 

			</div>
			<div class="tab-pane fade" id="carousel"></div>
			<div class="tab-pane fade" id="product_add"></div>
			<div class="tab-pane fade" id="product_list">
				<jsp:include page="./detail_display.jsp" />
			</div>
			<div class="tab-pane fade" id="maintain_primary">
				<jsp:include page="./PrimaryCategory_display.jsp" />
			</div>
			<div class="tab-pane fade" id="maintain_minor">
				<jsp:include page="./MinorCategory_display.jsp" />
			</div>


			<div class="tab-pane fade" id="product_new">

				<form action='<c:url value="/pages/detail.controller" />'
					method='post' enctype="multipart/form-data">
					<div class="row" id="class_1">
						<!--決定類別-->
						<div class="form-group">
							<!-- begin of 大分類 -->

							<div class="col-xs-12 col-sm-4">

								<label for="sel1">大分類:</label>

								<%
									PrimaryCategoryBeanService primaryService = new PrimaryCategoryBeanService(
													new PrimaryCategoryBeanDAOHibernate(HibernateUtil.getSessionFactory()));
											MinorCategoryBeanService minorService = new MinorCategoryBeanService(
													new MinorCategoryBeanDAOHibernate(HibernateUtil.getSessionFactory()));
											  List<String> primary = primaryService.selectCategory();
											request.setAttribute("primary", primary);
								%>

								<select class="form-control" id="primary"
									onchange="checkPrimary()" name='primary'>
									<c:forEach var="item" items="${primary}">
										<option>
											<c:out value="${item}" /></option>
									</c:forEach>
								</select>
							</div>

							<!-- end of 大分類 -->
							<!-- begin of 小分類 -->
							<div class="col-xs-12 col-sm-4">
								<label for="item">  小類別:</label> <select class="form-control"
									id="item" name='item'>

								</select>
							</div>
							<!-- end of 小分類 -->
							<!-- begin of 產品編號 -->

							<div class="col-xs-12 col-sm-4">
								<label for="prod_id"> 產品編號:</label> <input type='text'
									class="form-control" id="prod_id" name='prod_id' />

							</div>
							<!-- end of 產品編號 -->

							<!-- begin of 產品明細 -->

							<div class="col-xs-12 col-sm-4">
								<label for="detail"> 明細 </label> <input type="text"
									class="form-control" name="detail" id="detail" value=""
									placeholder="請輸入明細" />
							</div>
						</div>
						<!-- end of 產品明細 -->

						<!--顏色  -->
						<div class="col-xs-12 col-sm-4">
							<label for="color"> 顏色: </label> <input type="text"
								class="form-control" name="color" id="color" value=""
								placeholder="color" />
						</div>
						<!-- 顏色 -->

						<!-- Size -->
						<div class="col-xs-12 col-sm-4">
							<label for="size"> Size:</label> <select name='size'
								class="form-control">
								<option>S</option>
								<option>M</option>
								<option>L</option>
								<option>XL</option>
								<option>XXL</option>

							</select>

						</div>
						<!-- End of Size -->

						<!-- Begin of 數量 -->
						<div class="col-xs-12 col-sm-4">
							<label for="qty"> 數量 : </label> <input type="text" name="qty"
								class="form-control" id="qty" value="" placeholder="數量" />
						</div>
						<!-- End of 數量 -->
						<!-- Begin of 價格 -->
						<div class="col-xs-12 col-sm-4">

							<label for="price"> 價格 : </label> <input type="text"
								class="form-control" name="price" id="price" value=""
								placeholder="價格" />
						</div>
						<!-- End of 價格 -->
						<!-- Begin of 照片 -->
						<div class="col-xs-12 col-sm-4">

							<label for="pics"> 圖片上傳 : </label> <input type="file"
								class="form-control" name="pics" id="pics" value=""
								placeholder="價格" />
						</div>
						<!-- End of 價格 -->

						<!-- Begin of 產品描述 -->
						<div class="col-xs-12 col-sm-8">
							<label for="proddesc"> 產品描述:</label>
							<textarea rows="8" cols="80" name="proddesc" id="proddesc"
								class="form-control" value="" placeholder="產品名稱">
								</textarea>
						</div>
						<!-- End of 產品描述 -->

						<div class="col-xs-12 col-sm-4"><br><br>
							<input type="submit" name="prodaction" class="btn btn-danger btn-sm" value="Insert">
							<input type="button" value="清除" class="btn btn-danger btn-sm" onclick="clearForm()">

						</div>
					</div>
				</form>
			</div>
			</div>
 			</div>
			</div>
			<!-- end of tab -content -->


			</div>
		</c:when>
	</c:choose>
	<!--<div class="tab-pane fade" id="product_new">  -->
</body>

</html>
