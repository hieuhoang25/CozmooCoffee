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
	.icon-heart{
	
    padding: 10px 21px 9px;
    border: 1px solid black;
    color: black;
    cursor: pointer;
	}
	.icon-heart:hover{
		background: #7fad39;
		border-color: #7fad39;
		color: white;
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
 <c:set var = "user" value = "${sessionScope.account}"/>
  <c:set var = "cart" value = "${sessionScope.cart}"/>
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
						<a href="./index.jsp"><img src="img/logo5.png" alt=""></a>
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
							<li><a href="#"><i class="fa fa-heart"></i>
							<c:choose>
							 <c:when test="${user!=null}">
							  <span>${user.yeuthichList.size()}</span>
							 </c:when>
							 <c:otherwise>
							  <span>0</span>
							 </c:otherwise>
							</c:choose>
							
							 
							 </a></li>
							<li><a href='<c:url value="/shoping-cart"></c:url>'><i class="fa fa-shopping-bag"></i> 
							<c:choose>
							 <c:when test="${user!=null}">
							  <span>${cart.size()}</span>
							 </c:when>
							 <c:otherwise>
							  <span>0</span>
							 </c:otherwise>
							</c:choose>				
							</a></li>
						</ul>
						<div class="header__cart__price">
							item: 
							<c:choose>
							 <c:when test="${user!=null}">
							 <span>
							 <c:set var="dem" value="0" ></c:set>
							 <c:forEach var="item" items="${cart}">
							 	<c:set var="dem" value="${dem + item.getThanhTien()}" ></c:set>
							 </c:forEach>
								<fmt:formatNumber value="${dem}" pattern="#,###.# VNĐ"></fmt:formatNumber>
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
			<div class="row">
				
				
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
						<h2>${sanpham.getTENSP()}</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home</a> <a href="./shop-gird.jsp">Sản
								phẩm</a> <span>${sanpham.getTENSP()}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src='<c:url value="/img/product/${sanpham.getHINH()}"></c:url>'
								alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${sanpham.getTENSP()}</h3>
						<div class="product__details__rating">
							 <i
								class="fa fa-heart"></i> <span>(${sanpham.yeuthichList.size()} lượt yêu thích)</span>
						</div>
						<div class="product__details__price">

							<span><fmt:formatNumber value="${sanpham.getNewGia()}"
									pattern="#,###.# VNĐ"></fmt:formatNumber> </span>

							<del style="font-size: 20px; color: #ccc">
								<fmt:formatNumber value="${sanpham.getGIASP()}"
									pattern="#,###.# VNĐ"></fmt:formatNumber>
							</del>

						</div>
						<p>${sanpham.getMoTa()}</p>
						<div class="product__details__quantity">
							<div class="quantity">
								<div class="pro-qty">
									<input type="text" value="1">
								</div>
							</div>
						</div>
						<a href="#" class="primary-btn">Thêm vào giỏ hàng</a> <a id="likeproduct" title="${kt ? 'Đã thích':''}" class="icon-heart" ${kt ? 'style="
    background: #7fad39;
    border-color: #7fad39;
    color: white;"':''} style="cursor: pointer;" onclick="likeProduct(${sanpham.getMaSP()})" ><i class="fa fa-heart"></i></a>
						<ul>
							<li><b>Chia sẻ</b>
								<div class="share">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a>
								</div></li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Related Product Section Begin -->
	<section class="related-product">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related__product__title">
						<h2>Sản phẩm liên quan</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach var="item" items="${rp}">
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg='<c:url value="/img/product/${item.getHINH()}"></c:url>'>
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href='<c:url value="/sanphamdetail?MaSP=${item.getMaSP()}"></c:url>'><i class="fa fa-eye"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="#">${item.getTENSP()}</a>
								</h6>
								<div>

									<span style="font-size: 20px; color: red"><fmt:formatNumber value="${item.getNewGia()}"
											pattern="#,###.# VNĐ"></fmt:formatNumber> </span>

									<del style="font-size: 16px; color: #ccc">
										<fmt:formatNumber value="${item.getGIASP()}"
											pattern="#,###.# VNĐ"></fmt:formatNumber>
									</del>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Related Product Section End -->

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


<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
			<script type="text/javascript">
		function likeProduct(id) {
			$.ajax({
				url : "/Assingment_Java4/likeproduct",
				type : "get", //send it through get method
				data: {
                    txt: id
                },
				success : function(data) {
					var list = $.parseJSON(data);
					if (list[2]==1){
						$("#likeproduct").css({"background": "#7fad39","border-color":"#7fad39","color":"white"});
					}
					else{
						$("#likeproduct").css({"background": "white","border-color":"black","color":"black"});
					}
					console.log(list[0]);
				},
				error : function(xhr) {
					window.location.href="/Assingment_Java4/Login/login";
				}
			});
		}
	</script>
</body>

</html>
