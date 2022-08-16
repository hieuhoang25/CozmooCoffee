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
<title>Trang chủ</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<!-- <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css"> -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<base href="${pageContext.request.contextPath}/">

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
	
	<!-- Humberger End -->


	<!-- Header Section Begin -->
	<header class="header">
		<jsp:include page="${request.contextPath}/header.jsp"></jsp:include>
		 <div class="container">
			<div class="row" style="align-items: center;">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="${pageContext.request.contextPath}/index.jsp"><img src="img/logo5.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="./index.jsp">Trang chủ</a></li>
							<li><a href="./shop-grid.jsp">Sản phẩm</a></li>
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
							  <span id="numberlike">${user.yeuthichList.size()}</span>
							 </c:when>
							 <c:otherwise>
							  <span>0</span>
							 </c:otherwise>
							</c:choose>
							 </a></li>
							<li><a href='<c:url value="/shoping-cart"></c:url>'><i class="fa fa-shopping-bag"></i> 
							<c:choose>
							 <c:when test="${user!=null}">
							  <span id="listcart">${cart.size()}</span>
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
							 <span id ="totalcart">
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
    <section class="hero">
        <div class="container">
          <%@include file="./category.jsp"%>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    Tìm kiếm
                                </div>
                                <input type="text" placeholder="Tìm những thứ bạn muốn ?">
                                <button type="submit" class="site-btn">Tìm kiếm</button>
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
                    <div class="hero__item set-bg" data-setbg="img/hero/bannerindex.jpg">
                        <div class="hero__text">
                         
                            <h2>Khởi đầu ngày mới cùng<br> COZMO coffee</h2>
                            <p style="color: white; font-weight: bold;">Không gì tuyệt vời hơn một khởi đầu hoàn hảo mỗi ngày</p>
                           
                        </div>
                    </div>
                </div>
            </div>
       
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <c:set var="i" value="1"></c:set>
                <c:forEach var="item" items="${listpr}">
              
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/danhmuc/${i}.jpg">
                            <h5><a href="${pageContext.request.contextPath}/productdetail?idDanhMuc=${item.getMaDM()}#product">${item.getTenDanhMuc()}</a></h5>
                        </div>
                    </div>
                    <c:set var="i" value="${i+1}"></c:set>
                    </c:forEach>
      
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>Sản phẩm nổi bật</h2>
					</div>
					<div class="featured__controls">
						<ul>
							<li class="active" data-filter="*">All</li>
							<li data-filter=".mcake">Bánh</li>
							<li data-filter=".tea">Trà</li>
							<li data-filter=".coffee">Cà phê</li>
							<li data-filter=".trasua">Trà sữa</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row featured__filter" id="hotproduct">

				<c:forEach var="list" items="${hotproduct}">
					<div
						class="col-lg-3 col-md-4 col-sm-6 mix ${list.MADM} ${list.MADM}">
						<div class="featured__item">
							<div class="featured__item__pic set-bg"
								data-setbg="img/product/${list.HINH}">
								<ul class="featured__item__pic__hover">
								<c:set var="style" value="cursor: pointer; background: white; border-color:white; color:black; "></c:set>
								<c:forEach var="sp" items="${user.yeuthichList}">
								  <c:if test="${sp.sanpham.getMaSP()==list.MASP}">
								  	<c:set var="style" value="cursor: pointer; background: #7fad39; border-color:#7fad39 ; color: white ; "></c:set>
								  </c:if>
								</c:forEach>
									<li><a id="likeproduct${list.MASP}"
									
						 					style="${style}" onclick="likeProduct(${list.MASP})"	><i
											class="fa fa-heart"></i></a></li>
									<li><a href='<c:url value="/sanphamdetail?MaSP=${list.MASP}"></c:url>'><i class="fa fa-eye"></i></a></li>
									<li><a style="cursor: pointer;" onclick="addToCart(${list.MASP})" ><i class="fa fa-shopping-cart"></i></a></li>
									<!-- href='<c:url value="/addcart?txt=${list.MASP}#hotproduct"></c:url>' -->
								</ul>
							</div>
							<div class="featured__item__text">
								<h6>
									<a href="#">${list.TENSP}</a>
								</h6>
								<h5><fmt:formatNumber value="${list.GIASP}" pattern="#,###.# VNĐ"></fmt:formatNumber></h5>
							</div>
						</div>
					</div>
				</c:forEach>

		
			</div>
		</div>
	</section>
	<!-- Featured Section End -->

	<!-- Banner Begin -->
	<div class="banner">
		
	</div>
	<!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            <div class="row" style="justify-content: space-around;">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Sản phẩm mới nhất</h4>
                        <div class="latest-product__slider owl-carousel">
                        <c:set var="i" value="0"></c:set>
                        <c:forEach var="item" items="${NewProduct}">
                        <c:if test="${i==0 || i ==4}">
                            <div class="latest-prdouct__slider__item">
                             <c:set var="i" value="1"></c:set>
                            </c:if>
                                <a href='<c:url value="/sanphamdetail?MaSP=${item.getMaSP()}"></c:url>' class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/product/${item.HINH}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${item.TENSP}</h6>
                                        <span><fmt:formatNumber value="${item.GIASP}" pattern="#,###.# VNĐ"></fmt:formatNumber></span>
                                    </div>
                                    <c:set var="i" value="${i+1}"></c:set>
                                </a>
                                <c:if test="${i == 4}">
                                 <c:set var="i" value="0"></c:set>
                                	 </div>
                                 </c:if>               
                            </c:forEach>
                            
                          
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Sản phẩm bán nhiều nhất</h4>
                         <div class="latest-product__slider owl-carousel">
                        <c:set var="i" value="0"></c:set>
                        <c:forEach var="item" items="${hotproduct}">
                        <c:if test="${i==0 || i ==4}">
                            <div class="latest-prdouct__slider__item">
                             <c:set var="i" value="1"></c:set>
                            </c:if>
                                <a href='<c:url value="/sanphamdetail?MaSP=${item.MASP}"></c:url>' class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/product/${item.HINH}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${item.TENSP}</h6>
                                        <span><fmt:formatNumber value="${item.GIASP}" pattern="#,###.# VNĐ"></fmt:formatNumber></span>
                                    </div>
                                    <c:set var="i" value="${i+1}"></c:set>
                                </a>
                                <c:if test="${i == 4}">
                                 <c:set var="i" value="0"></c:set>
                                	 </div>
                                 </c:if>               
                            </c:forEach>
                           
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->

	<!-- Blog Section Begin -->
	
	<!-- Blog Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="./footer.jsp"></jsp:include>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
<!-- 	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script> -->
	
		<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
			<script type="text/javascript">
			function addToCart(id){
				$.ajax({
					url:"/Assingment_Java4/addcart",
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
						$('#listcart').text(list[0]);
						var total = list[1].toFixed(2).replace(/\d(?=(\d{3})+\.)/g, "$&,");
						total = total.substring(0,total.lastIndexOf("."));
						$('#totalcart').text(total.replaceAll(",",".")+" VNĐ");
						alert("Thêm vào giỏ hàng thành công!");
					},
					error: function(xhr) {
						window.location.href="/Assingment_Java4/Login/login";
					}
				});
			}
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
							$("#likeproduct"+id).css({"background": "#7fad39","border-color":"#7fad39","color":"white"});
						}
						else{
							$("#likeproduct"+id).css({"background": "white","border-color":"white","color":"black"});
						}
						$('#numberlike').text(list[0])
					},
					error : function(xhr) {
						//Do Something to handle error
						window.location.href="/Assingment_Java4/Login/login";
					}
				});
		}
	</script>


</body>

</html>
