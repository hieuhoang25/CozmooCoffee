<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<style type="text/css">
.icon_close:hover{
	color: red;
}
.pro-qty1 {
	width: 140px;
	height: 50px;
	display: inline-block;
	position: relative;
	text-align: center;
	background: #f5f5f5;
	margin-bottom: 5px;
}

.pro-qty1 input {
	height: 100%;
	width: 100%;
	font-size: 16px;
	color: #6f6f6f;
	width: 50px;
	border: none;
	background: #f5f5f5;
	text-align: center;
}

.pro-qty1 .qtybtn {
	width: 35px;
	font-size: 16px;
	color: #6f6f6f;
	cursor: pointer;
	display: inline-block;
}
</style>

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
	<c:set var="user" value="${sessionScope.account}" />
	<c:set var="cart" value="${sessionScope.cart}" />
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
	<jsp:include page="./header.jsp"></jsp:include>
	<div class="container">
		<div class="row" style="align-items: center;">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="./index.html"><img src="img/logo5.png" alt=""></a>
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
										<span>${user.yeuthichList.size()}</span>
									</c:when>
									<c:otherwise>
										<span>0</span>
									</c:otherwise>
								</c:choose> </a></li>
						<li><a href='<c:url value="/shoping-cart"></c:url>'><i
								class="fa fa-shopping-bag"></i> <c:choose>
									<c:when test="${user!=null}">
										<span id="sizecart">${cart.size()}</span>
									</c:when>
									<c:otherwise>
										<span>0</span>
									</c:otherwise>
								</c:choose> </a></li>
					</ul>
					<div class="header__cart__price" >
						item:
						<c:choose>
							<c:when test="${user!=null}">
								<span class="totalcart"> <c:set var="dem" value="0"></c:set> <c:forEach
										var="item" items="${cart}">
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
									All Categories <span class="arrow_carrot-down"></span>
								</div>
								<input type="text" placeholder="What do yo u need?">
								<button type="submit" class="site-btn">SEARCH</button>
							</form>
						</div>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>+65 11.188.888</h5>
								<span>support 24/7 time</span>
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
						<h2>Shopping Cart</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a> <span>Shopping Cart</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th class="shoping__product">Sản phẩm</th>
									<th>Giá</th>
									<th>Số lượng</th>
									<th>Tổng tiền</th>
									<th></th>
								</tr>
							</thead>
							<tbody class="tableofcart">
								<c:forEach var="item" items="${cart}">
									<tr class="row${item.getMaSP()}">
										<td class="shoping__cart__item"><img style="width: 100px"
											src='<c:url value="/img/product/${item.getHinh()}"></c:url>'
											alt="">
											<h5>${item.getTenSP()}</h5></td>
										<td class="shoping__cart__price"><span style="color: red"><fmt:formatNumber
													value="${item.getGiaSP() - (item.getGiamGia()*item.getGiaSP())/100}"
													pattern="#,###.# VNĐ"></fmt:formatNumber> </span> <del
												style="font-size: 16px; color: #ccc">
												<fmt:formatNumber value="${item.getGiaSP()}"
													pattern="#,###.# VNĐ"></fmt:formatNumber>
											</del></td>
										<td class="shoping__cart__quantity">
											<div class="quantity">
												<div class="pro-qty1">
											
													<input  min="1" max="500" type="number"  oninput="quality(this,${item.getMaSP()});" value="${item.getSoLuong()}">
												
												</div>
											</div>
										</td>
										<td class="shoping__cart__total" id="idproduct${item.getMaSP()}"><fmt:formatNumber
												value="${item.getThanhTien()}" pattern="#,###.# VNĐ"></fmt:formatNumber>
										</td>
										<td class="shoping__cart__item__close"><a class="icon-close" style="cursor: pointer;"
											onclick="removeProduct(${item.getMaSP()})" ><span
												class="icon_close"></span></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__btns">
						<a href="#" class="primary-btn cart-btn">Tiếp tục mua sắm</a>

					</div>
				</div>
				<div class="col-lg-6">
					<div class="shoping__continue">
						<div class="shoping__discount">
							<h5>Discount Codes</h5>
							<form action="#">
								<input type="text" placeholder="Enter your coupon code">
								<button type="submit" class="site-btn">APPLY COUPON</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="shoping__checkout">
						<h5>Cart Total</h5>
						<ul>
							<li>Tạm tính: <span class="totalcart"> <c:set var="dem" value="0"></c:set>
									<c:forEach var="item" items="${cart}">
										<c:set var="dem" value="${dem+ item.getThanhTien()}"></c:set>
									</c:forEach> <fmt:formatNumber value="${dem}" pattern="#,###.# VNĐ"></fmt:formatNumber>
							</span></li>
							<li>Tổng tiền: <span class="totalcart"> <c:set var="dem" value="0"></c:set>
									<c:forEach var="item" items="${cart}">
										<c:set var="dem" value="${dem+ item.getThanhTien()}"></c:set>
									</c:forEach> <fmt:formatNumber value="${dem}" pattern="#,###.# VNĐ"></fmt:formatNumber>
							</span></li>
						</ul>
						<a href='<c:url value="/checkout"></c:url>' class="primary-btn">Tiến hành đặt hàng</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shoping Cart Section End -->

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
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script type="text/javascript">
		//var proQty = $('.pro-qty');
	// proQty.on('click', '.qtybtn', 
		function quality(input,id) {
			var val = input.value;
		$.ajax({
				url:"/Assingment_Java4/quality",
				type: "get",
				data:{
					masp:id,
					soluong: val
				},
				 headers : {
	                	Accept: "application/json; charset=utf-8",
	                	"Content-Type" : "application/json; charset=utf-8"
				  },
				success : function(data){
					var list = $.parseJSON(data);
					$('#idproduct'+id).text(toVND(list[0]));
					$('.totalcart').text(toVND(list[1]));
				},
				error: function(xhr) {
					alert("Thêm vào giỏ hàng thất bại!");
				}
			}); 
		};
		function toVND(price){
		 var total = price.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, "$&,");
			total = total.substring(0,total.lastIndexOf("."));
			return total.replaceAll(",",".")+" VNĐ";
		}
		function removeProduct(id) {
			$('.tableofcart > .row'+id).remove();
			$.ajax({
				url:"/Assingment_Java4/removeitemcart",
				type: "get",
				data:{
					masp:id
				},
				 headers : {
	                	Accept: "application/json; charset=utf-8",
	                	"Content-Type" : "application/json; charset=utf-8"
				  },
				success : function(data){
					var list = $.parseJSON(data);
					$('.totalcart').text(toVND(list[1]));
					$("#sizecart").text(list[0]);
				},
				error: function(xhr) {
					alert("Thêm vào giỏ hàng thất bại!");
				}
			}); 
		}
	</script>

</body>

</html>