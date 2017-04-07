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


<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><c:out value="${user } "></c:out></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Superfish -->
<link rel="stylesheet" href="css/superfish.css">
<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- Date Picker -->
<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
<!-- CS Select -->
<link rel="stylesheet" href="css/cs-select.css">
<link rel="stylesheet" href="css/cs-skin-border.css">


<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />

<link rel="stylesheet" href="css/style.css">
<style type="text/css">
.login {
	position: fixed;
	top: -200px;
	width: 350px;
	background-color: #fff;
	color: #7F7F7F;
	padding: 20px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	-khtml-border-radius: 5px;
	-moz-box-shadow: 0 3px 5px #333;
	-webkit-box-shadow: 0 3px 5px #333;
	z-index: 101;
}
</style>

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<%
				HttpSession userSession = request.getSession();
				String user = userSession.getAttribute("user").toString();
				request.setAttribute("user", user);
			%>
			<header id="fh5co-header-section" class="sticky-banner">
				<div class="container">
					<div class="nav-header">
						<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
						<div class="col-md-2" style="padding: 0 !important">
							<h1 id="fh5co-logo">
								<a href="index.jsp"><c:out value="${user } "/></a>
							</h1>
						</div>
						<div class="col-md-10" style="height: 50px; padding: 0 !important"
							id="weather-group">
							<div id="weather">
								<ul id="weather-menu">
									<li>日<img src="images/partly_cloudy_day.png" width="20"
										height="20">15-20
									</li>
									<li>一<img src="images/partly_cloudy_night.png" width="20"
										height="20">15-20
									</li>
									<li>二<img src="images/scattered_showers_day_night.png"
										width="20" height="20">15-20
									</li>
									<li>三<img src="images/clear_day.png" width="20"
										height="20">15-20
									</li>
									<li>四<img src="images/partly_cloudy_day.png" width="20"
										height="20">15-20
									</li>
									<li>五<img src="images/partly_cloudy_day.png" width="20"
										height="20">15-20
									</li>
									<li>六<img src="images/clear_day.png" width="20"
										height="20">15-20
									</li>
								</ul>
							</div>
							<span id="search"> <input name="keyWord" type="text"
								id="keyWord" placeholder="Search">
								<button type="submit" class="icon-search2" id="search_btn"></button>
							</span>
						</div>
						<div class="col-md-10" style="padding: 0 !important"
							id="menu-group">
							<!-- START #fh5co-menu-wrap -->
							 	<%		
							 	PrimaryCategoryBeanService primaryService = new PrimaryCategoryBeanService(
										new PrimaryCategoryBeanDAOHibernate(HibernateUtil.getSessionFactory()));
								MinorCategoryBeanService minorService = new MinorCategoryBeanService(
										new MinorCategoryBeanDAOHibernate(HibernateUtil.getSessionFactory()));
 							 	String prod = null;
								if (userSession.getAttribute("user")!=null)
 								{ prod = userSession.getAttribute("user").toString();
 								}else{
 									prod="RedLine";
 								}
								List<PrimaryCategoryBean> primary = primaryService.selectCategoryByProd(prod);

								request.setAttribute("primary", primary);
							%>
	<nav id="fh5co-menu-wrap" role="navigation">
 							
								<ul class="sf-menu" id="fh5co-primary-menu">
									<li><a href='women.jsp?q=<c:out value="${primary[0].category}"/>'><c:out value="${primary[0].getCategory()}" /></a>
										<ul class="fh5co-sub-menu">
											<%
												String category = primary.get(0).getCategory();
												request.setAttribute("category", primary.get(0).getCategory());
												List<MinorCategoryBean> minor = minorService.selectByCategory(category);
												System.out.print(category);

												System.out.print(minor);

												for (MinorCategoryBean m : minor) {
													String url = "<li><a href='detail.jsp?category=" + primary.get(0).getCategory() 
															+ "&primary=" + m.getItem() + "'>" + m.getItem()
															+ "</a></li>";
													out.print(url);
												}
 											%> 
											 
											
										</ul></li>
										<li><a href='women.jsp?q=<c:out value="${primary[1].category}"/>'><c:out value="${primary[1].getCategory()}" /></a>
										<ul class="fh5co-sub-menu">
											<%
												category = primary.get(1).getCategory();
												request.setAttribute("category", primary.get(1).getCategory());
												List<MinorCategoryBean> men = minorService.selectByCategory(category);
												System.out.print(category);

												System.out.print(men);

												for (MinorCategoryBean m : men) {
													String url = "<li><a href='detail.jsp?category=" + primary.get(1).getCategory() 
															+ "&primary=" + m.getItem() + "'>" + m.getItem()
															+ "</a></li>";
													out.print(url);
												}
 											%>
										 </ul></li>
 											
									<li><a href="flight.html"><c:out value="${primary[2].getCategory()}" /></a>
										<ul class="fh5co-sub-menu">
<%
												category = primary.get(2).getCategory();
												request.setAttribute("category", primary.get(2).getCategory());
												List<MinorCategoryBean> kid = minorService.selectByCategory(category);
												System.out.print(category);

												System.out.print(kid);

												for (MinorCategoryBean m : kid) {
													String url = "<li><a href='detail.jsp?category=" + primary.get(2).getCategory() 
															+ "&primary=" + m.getItem() + "'>" + m.getItem()
															+ "</a></li>";
													out.print(url);
												}
 											%>
										
												 
											
										</ul></li>
									<li><a href="hotel.html"><c:out value="${primary[3].getCategory()}" /></a>
										<ul class="fh5co-sub-menu">
									<%
												category = primary.get(3).getCategory();
												request.setAttribute("category", primary.get(3).getCategory());
												List<MinorCategoryBean> sports = minorService.selectByCategory(category);
												System.out.print(category);

												System.out.print(sports);

												for (MinorCategoryBean m : sports) {
													String url = "<li><a href='detail.jsp?category=" + primary.get(3).getCategory() 
															+ "&primary=" + m.getItem() + "'>" + m.getItem()
															+ "</a></li>";
													out.print(url);
												}
 											%>

										</ul></li>
									<li><a href="car.html"><c:out value="${primary[4].getCategory()}" /></a>
										<ul class="fh5co-sub-menu">
									 <%
												category = primary.get(4).getCategory();
												request.setAttribute("category", primary.get(4).getCategory());
												List<MinorCategoryBean> style = minorService.selectByCategory(category);
												System.out.print(category);

												System.out.print(style);

												for (MinorCategoryBean m : style) {
													String url = "<li><a href='detail.jsp?category=" + primary.get(4).getCategory() 
															+ "&primary=" + m.getItem() + "'>" + m.getItem()
															+ "</a></li>";
													out.print(url);
												}
 											%>
									 
										</ul></li>
								</ul>
 								
							</nav>


							 								<%
 								out.print("<span id='cart'><a href ='../pages/maintain.jsp'>"+
								userSession.getAttribute("user")+"</a></span>");
								 
							%>
							<span id="cart"> <a href="#">加入會員</a> | <a href="#" id='loginClick'>會員登入</a> 
								| <i class="icon-cart2"></i> <a href="#">0</a>個商品
							</span>
						</div>
					</div>
				</div>
			</header>



			<!-- end:header-top -->
			<div id="fh5co-features">
				<div class="container" style="padding: 0">
					<div class="col-md-2">
						<ul class="sc-menu">
							<li class="sc-menu-title"><c:out value="${param.q}" /></li>

							<c:forEach var='row' items="${minor}">
								<li><a href="#"> <c:out value="${row}" /></a></li>
							</c:forEach>
						</ul>

					</div>
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-12 animate-box"
								style="padding: 20px 15px 40px 15px">
								<img src="images/women.jpg" width="100%">
							</div>
						</div>
						
 						<sql:query var="r" dataSource="jdbc/xxx">
   							 select detail.id,detail.pics,detail.detail,detail.qty,detail.price
   							  from detail,minorCategory where  detail.item = minorCategory.item
 					</sql:query>
 						<div class="row">
							<c:forEach var='row' items="${r.rows}">
								<div class="col-md-3 col-sm-4 col-xs-6 animate-box">

									<a href='detail.jsp?id=<c:out value="${row.id }"/>'> <img
										src='images/<c:out value="${row.pics}"/>'
										alt="Free HTML5 Website Template by FreeHTML5.co"
										class="img-responsive"></a>
									<div class="list">
										<div class="picksize">
											<a href="#">S</a><a href="#">M</a><a href="#">L</a><a
												href="#">XL</a><a href="#">XL</a>
										</div>
										<h5>
											<c:out value="${row.detail}" />
										</h5>
										<h6>
											NT$
											<c:out value="${row.price}" />
											特價 NT$
											<c:out value="${row.price*0.9}" />
										</h6>
									</div>
								</div>
								<!-- end of 一筆資料 -->
							</c:forEach>

						</div>
					</div>
				</div>

				<footer>
					<div id="footer">
						<div class="container">
							<div class="row">
								<div class="col-md-6 col-md-offset-3 text-center">
									<p class="fh5co-social-icons">
										<a href="#"><i class="icon-twitter2"></i></a> <a href="#"><i
											class="icon-facebook2"></i></a> <a href="#"><i
											class="icon-instagram"></i></a> <a href="#"><i
											class="icon-dribbble2"></i></a> <a href="#"><i
											class="icon-youtube"></i></a>
									</p>
									<p>Copyright 2017 redLine. All Rights Reserved.</p>
								</div>
							</div>
						</div>
					</div>
				</footer>



			</div>
			<!-- END fh5co-page -->

		</div>
		<!-- END fh5co-wrapper -->
		 </div>
		<!-- jQuery -->
	<div id='login' class="col-md-6 col-md-offset-4 text-center">
		<div class="login">
		<form action='login.jsp' method='post'>
			<div style="margin-bottom: 25px" class="input-group input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                <input type="text" class="form-control" name="user" placeholder="帳號">                                        
            </div>
            <div style="margin-bottom: 25px" class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <input type="password" class="form-control" name="passwd" placeholder="密碼">
            </div>
				<input type='submit' class='btn btn-sm btn-primary btn-block' value='登入'/>
 		</form>
 		</div>
	</div>

		<script src="js/jquery.min.js"></script>
		<!-- jQuery Easing -->
		<script src="js/jquery.easing.1.3.js"></script>
		<!-- Bootstrap -->
		<script src="js/bootstrap.min.js"></script>
		<!-- Waypoints -->
		<script src="js/jquery.waypoints.min.js"></script>
		<script src="js/sticky.js"></script>

		<!-- Stellar -->
		<script src="js/jquery.stellar.min.js"></script>
		<!-- Superfish -->
		<script src="js/hoverIntent.js"></script>
		<script src="js/superfish.js"></script>
		<!-- Magnific Popup -->
		<script src="js/jquery.magnific-popup.min.js"></script>
		<script src="js/magnific-popup-options.js"></script>
		<!-- Date Picker -->
		<script src="js/bootstrap-datepicker.min.js"></script>
		<!-- CS Select -->
		<script src="js/classie.js"></script>
		<script src="js/selectFx.js"></script>

		<!-- Main JS -->
		<script src="js/main.js"></script>


		<script defer src="js/jquery.flexslider.js"></script>
		<script type="text/javascript">
			$(window).load(function() {
				$('.flexslider').flexslider({
					animation : "slide",
					start : function(slider) {
						$('body').removeClass('loading');
					}
				});
			});
		</script>
		<script>
		$(document).ready(function() {
			$('#loginClick').click(
				function(){
					$(".login").css('top', 200);

				}		
			)
			
		});
	</script>
</body>
</html>
