<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="model.service.*" %>
<%@ page import="java.util.*" %>
<%@page import="model.misc.*" %>
<%@page import="model.dao.*" %>
<%@page import="model.*" %>
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
<title>redLine</title>
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

			<header id="fh5co-header-section" class="sticky-banner">
				<div class="container">
					<div class="nav-header">
						<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
						<div class="col-md-2" style="padding: 0 !important">
							<h1 id="fh5co-logo">
								<a href="index.jsp">redLine</a>
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

 
 

							 							<span id="cart"> <a href="../pages/Register.jsp">加入會員</a> | <a href="../pages/Register.jsp">會員登入</a>
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
							<li class="sc-menu-title">WOMEN</li>
							<li><a href="#">上衣</a></li>
							<li><a href="#">Node JS</a></li>
							<li><a href="#">Django &amp; Python</a></li>
							<li><a href="#">褲子</a></li>
							<li><a href="#">外套</a></li>
							<li><a href="#">配件</a></li>
							<li><a href="#">上衣</a></li>
							<li><a href="#">Node JS</a></li>
						</ul>
						<ul class="sc-menu">
							<li class="sc-menu-title">WOMEN</li>
							<li><a href="#">上衣</a></li>
							<li><a href="#">Node JS</a></li>
							<li><a href="#">Django &amp; Python</a></li>
							<li><a href="#">褲子</a></li>
							<li><a href="#">外套</a></li>
							<li><a href="#">配件</a></li>
							<li><a href="#">上衣</a></li>
							<li><a href="#">Node JS</a></li>
						</ul>
						<ul class="sc-menu">
							<li class="sc-menu-title">WOMEN</li>
							<li><a href="#">上衣</a></li>
							<li><a href="#">Node JS</a></li>
							<li><a href="#">Django &amp; Python</a></li>
							<li><a href="#">褲子</a></li>
							<li><a href="#">外套</a></li>
							<li><a href="#">配件</a></li>
							<li><a href="#">上衣</a></li>
							<li><a href="#">Node JS</a></li>
						</ul>
					</div>
					<div class="col-md-10">
						<div class="row" style="padding: 20px 15px 40px 15px">
							<div class="col-md-6 animate-box">
								<img src="images/3014802_500.jpg" width="100%">
							</div>
							<div class="col-md-6 animate-box">
								<div class="">
									吸排彈性休閒連帽外套-女（ 粉橙 -XL）NT$590<br> 商品編號：30148024
								</div>
								<div class="">
									<div class="picksize">
										<a href="#">S</a><a href="#">M</a><a href="#">L</a><a href="#">XL</a><a
											href="#">XL</a>
									</div>
									<div class="picksize">
										<a href="#">S</a><a href="#">M</a><a href="#">L</a><a href="#">XL</a><a
											href="#">XL</a>
									</div>
								</div>
								<div class=""></div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 fh5co-tours animate-box">
								<img src="images/30148_D_21.jpg"
									alt="Free HTML5 Website Template by FreeHTML5.co"
									class="img-responsive">
							</div>
							<div class="col-md-12 fh5co-tours animate-box">
								<img src="images/30148_D_22.jpg"
									alt="Free HTML5 Website Template by FreeHTML5.co"
									class="img-responsive">
							</div>
							<div class="col-md-12 fh5co-tours animate-box">
								<img src="images/30148_D_23.jpg"
									alt="Free HTML5 Website Template by FreeHTML5.co"
									class="img-responsive">
							</div>
							<div class="col-md-12 fh5co-tours animate-box">
								<img src="images/04.jpg"
									alt="Free HTML5 Website Template by FreeHTML5.co"
									class="img-responsive">
							</div>
							<div class="col-md-12 fh5co-tours animate-box">
								<img src="images/30148_D_14.jpg"
									alt="Free HTML5 Website Template by FreeHTML5.co"
									class="img-responsive">
							</div>
							<div class="col-md-12 fh5co-tours animate-box">
								<img src="images/30148_D_26.jpg"
									alt="Free HTML5 Website Template by FreeHTML5.co"
									class="img-responsive">
							</div>
							<div class="col-md-12 fh5co-tours animate-box">
								<img src="images/30148_D_27.jpg"
									alt="Free HTML5 Website Template by FreeHTML5.co"
									class="img-responsive">
							</div>
							<div class="col-md-12 fh5co-tours animate-box">
								<img src="images/30148_D_28.jpg"
									alt="Free HTML5 Website Template by FreeHTML5.co"
									class="img-responsive">
							</div>
							<div class="col-md-12 fh5co-tours animate-box">
								<img src="images/30148_D_29.jpg"
									alt="Free HTML5 Website Template by FreeHTML5.co"
									class="img-responsive">
							</div>
							<div class="col-md-12 fh5co-tours animate-box">
								<img src="images/30148_D_30.jpg"
									alt="Free HTML5 Website Template by FreeHTML5.co"
									class="img-responsive">
							</div>
						</div>
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

	<!-- jQuery -->


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

</body>
</html>

