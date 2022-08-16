<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
	<c:set var="cart" value="${sessionScope.cart}" />
	<c:set var="user" value="${sessionScope.account}" />
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="#"><img src="img/logo.png" alt=""></a>
		</div>
		<div class="humberger__menu__cart">
			<ul>
				<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
				<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
			</ul>
			<div class="header__cart__price">
				item: <span>$150.00</span>
			</div>
		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__language">
				<img src="img/language.png" alt="">
				<div>English</div>
				<span class="arrow_carrot-down"></span>
				<ul>
					<li><a href="#">Spanis</a></li>
					<li><a href="#">English</a></li>
				</ul>
			</div>
			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-user"></i> Login</a>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li class="active"><a href="./index.jsp">Home</a></li>
				<li><a href="./shop-grid.jsp">Shop</a></li>
				<li><a href="#">Pages</a>
					<ul class="header__menu__dropdown">
						<li><a href="./shop-details.jsp">Shop Details</a></li>
						<li><a href="./shoping-cart.jsp">Shoping Cart</a></li>
						<li><a href="./checkout.jsp">Check Out</a></li>
						<li><a href="./blog-details.jsp">Blog Details</a></li>
					</ul></li>
				<li><a href="./blog.jsp">Blog</a></li>
				<li><a href="./contact.jsp">Contact</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="header__top__right__social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
			<a href="#"><i class="fa fa-pinterest-p"></i></a>
		</div>
		<div class="humberger__menu__contact">
			<ul>
				<li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
				<li>Free Shipping for all Order of $99</li>
			</ul>
		</div>
	</div>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<jsp:include page="./header.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="./index.jsp"><img src="img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li><a href="./index.jsp">Trang chủ</a></li>
							<li class="active"><a href="./shop-grid.jsp">Sản phẩm</a></li>
							<li><a href="./blog.jsp">Tin tức</a></li>
							<li><a href="./contact.jsp">Liên hệ</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li><a href="#"><i class="fa fa-heart"></i> <c:choose>
										<c:when test="${user!=null}">
											<span id="numberlike">${user.yeuthichList.size()}</span>
										</c:when>
										<c:otherwise>
											<span>0</span>
										</c:otherwise>
									</c:choose> </a></li>
							<li><a href='<c:url value="/shoping-cart"></c:url>'><i
									class="fa fa-shopping-bag"></i> <c:choose>
										<c:when test="${user!=null}">
											<span id="listcart">${cart.size()}</span>
										</c:when>
										<c:otherwise>
											<span>0</span>
										</c:otherwise>
									</c:choose> </a></li>
						</ul>
						<div class="header__cart__price">
							item:
							<c:choose>
								<c:when test="${user!=null}">
									<span id="totalcart"> <c:set var="dem" value="0"></c:set>
										<c:forEach var="item" items="${cart}">
											<c:set var="dem" value="${dem + item.getThanhTien()}"></c:set>
										</c:forEach> <fmt:formatNumber value="${dem}" pattern="#,###.# VNĐ"></fmt:formatNumber>
									</span>
								</c:when>
								<c:otherwise>
									<span>0 VNĐ</span>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<section class="hero hero-normal">
		<div class="container">
			<%@include file="./category.jsp"%>
			<div class="col-lg-9">
				<div class="hero__search">
					<div class="hero__search__form">
						<form action="#">
							<div class="hero__search__categories">
								Danh mục <span class="arrow_carrot-down"></span>
							</div>
							<input type="text" placeholder="Tìm những thứ bạn muốn?">
							<button type="submit" class="site-btn">Tim kiếm</button>
						</form>
					</div>
					<div class="hero__search__phone">
						<div class="hero__search__phone__icon">
							<i class="fa fa-phone"></i>
						</div>
						<div class="hero__search__phone__text">
							<h5>+65 11.188.888</h5>
							<span>Hỗ trợ 24/7 </span>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Thanh toán</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Trang chủ</a> <span>Thanh toán</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<h4>Hóa đơn chi tiết</h4>
				<form  action='<c:url value="/placeorder"></c:url>' method="post">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Họ<span>*</span>
										</p>
										<input type="text" name="ho"
											value="${fn:substring(user.getHoTen(), 0, fn:indexOf(user.getHoTen(),' '))}">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Tên<span>*</span>
										</p>
										<input type="text" name="ten"
											value="${fn:substring(user.getHoTen(),fn:indexOf(user.getHoTen(),' ')+1,fn:length(user.getHoTen()))}">
									</div>
								</div>
							</div>

							<div class="checkout__input">
								<p>
									Địa chỉ<span>*</span>
								</p>
								<input type="text" value="${user.getDiaChi() }" name="diachi"
									placeholder="Địa chỉ" class="checkout__input__add">
							</div>



							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Phone<span>*</span> 
										</p>
										<input type="text" name="phone" value="${user.getPhone() }">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Email<span>*</span>
										</p>
										<input type="text" name="email" value="${user.getEmail() }">
									</div>
								</div>
							</div>

						</div>
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>Đơn hàng của bạn</h4>
								<div class="checkout__order__products">
									Sản phẩm <span>Thành tiền</span>
								</div>
								<ul>
									<c:forEach var="item" items="${cart}">
										<li>${item.getTenSP()}<span> <fmt:formatNumber
													value=" ${item.getThanhTien()}" pattern="#,###.# VNĐ"></fmt:formatNumber>
										</span></li>
									</c:forEach>

								</ul>
								<div class="checkout__order__subtotal">
									Tạm tính <span><c:set var="dem" value="0"></c:set> <c:forEach
											var="item" items="${cart}">
											<c:set var="dem" value="${dem+ item.getThanhTien()}"></c:set>
										</c:forEach> <fmt:formatNumber value="${dem}" pattern="#,###.# VNĐ"></fmt:formatNumber></span>
								</div>
								<div class="checkout__order__total">
									Thành tiền <span><c:set var="dem" value="0"></c:set> <c:forEach
											var="item" items="${cart}">
											<c:set var="dem" value="${dem+ item.getThanhTien()}"></c:set>
										</c:forEach> <fmt:formatNumber value="${dem}" pattern="#,###.# VNĐ"></fmt:formatNumber></span>
								</div>

								<div class="checkout__input__checkbox">
									<h5 style="font-weight: bolder;">Hình thức thanh toán</h5>

									<label for="payment" class="mt-3"> Thanh toán bằng
										tiền mặt <input type="radio" id="payment" value="true" name="hinhthuc"
										checked> <span class="checkmark"></span>
									</label>
								</div>
								<div class="checkout__input__checkbox">
									<label for="paypal"> Thanh toán bằng VNPAY <input
										type="radio" id="paypal" value="false" name="hinhthuc"> <span
										class="checkmark"></span>
									</label>
								</div>
								<button type="submit" class="site-btn">Đặt Hàng</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="./footer.jsp"></jsp:include>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#myform").submit(function (event) {
				alert("hello");
			}
		});
	</script>

</body>

</html>