<%@page import="com.poly.entity.SanPham"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sản phẩm</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

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
      
        <!-- Humberger End -->

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
            <!-- Hero Section Begin -->
            <section class="hero hero-normal">
                <div class="container">
                <%@include file="./category.jsp"%>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    Tìm kiếm
                                  
                                </div>
                                <input type="text" placeholder="Tìm những thứ bạn muốn?">
                                <button type="submit" class="site-btn">TÌM KIẾM</button>
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
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Cozmo Coffee</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Trang chủ</a>
                            <span>sản phẩm</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                
                        <div class="sidebar__item">
                            <h4>Giá</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                     data-min="10000" data-max="80000">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Mới nhất</h4>
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
                                                    <span>${item.GIASP}</span>
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
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>Giảm giá</h2>
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">

                                <c:forEach var="item" items="${discountproduct}">
                                    <div class="col-lg-4">
                                        <div class="product__discount__item">
                                            <div class="product__discount__item__pic set-bg"
                                                 data-setbg="img/product/${item.HINH}">
                                                <div class="product__discount__percent">${item.GIAMGIA}%</div>
                                                <ul class="product__item__pic__hover">
                                                    <li><a href='<c:url value="/likesanpham?MaSP=${item.MASP}"></c:url>'><i class="fa fa-heart"></i></a></li>
                                                    <li><a href='<c:url value="/sanphamdetail?MaSP=${item.MASP}"></c:url>'><i class="fa fa-eye"></i></a></li>
                                                        <li><a style="cursor: pointer;" onclick="addToCart(${item.MASP})" ><i class="fa fa-shopping-cart"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__discount__item__text">
                                                    <span>${item.TENDANHMUC}</span>
                                                <h5><a href="#">${item.TENSP}</a></h5>
                                                <div class="product__item__price"><fmt:formatNumber value="${item.getNewGia()}"
                                                                  pattern="#,###.# VNĐ"></fmt:formatNumber> <span><fmt:formatNumber value="${item.GIASP}"
                                                                                                                                    pattern="#,###.# VNĐ"></fmt:formatNumber></span></div>
                                                </div>
                                            </div>
                                        </div>

                                </c:forEach>







                            </div>
                        </div>
                    </div>
                    <div class="filter__item">
                        <div class="row" id="product">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sắp xếp theo</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">

                                    <c:if test="${not empty productdetail}">
                                        <%
                                            session.setAttribute("fulllistpr", session.getAttribute("productdetail"));
                                        %>
                                    </c:if>

                                    <c:if test="${empty productdetail}">
                                        <%
                                            session.setAttribute("fulllistpr", session.getAttribute("NewProduct"));
                                        %>
                                    </c:if>
                                    <%
                                        List<SanPham> list = (List<SanPham>) session.getAttribute("fulllistpr");
                                        request.setAttribute("slsp", list.size());
                                    %>

                                    <%-- <h6><span>${slsp}</span> Sản phẩm</h6> --%>
                                    <h6><span>${cnp} - ${lp}</span>/ ${ttp} Sản phẩm</h6>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row">


                        <c:forEach var="item" items="${fulllistpr}">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="img/product/${item.HINH}">
                                        <ul class="product__item__pic__hover">
                                            <li><a href='<c:url value="/likesanpham?MaSP=${item.getMaSP()}"></c:url>'><i class="fa fa-heart"></i></a></li>
                                            <li><a href='<c:url value="/sanphamdetail?MaSP=${item.getMaSP()}"></c:url>'><i class="fa fa-eye"></i></a></li>
                                                <li><a style="cursor: pointer;" onclick="addToCart(${item.getMaSP()})" ><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#">${item.TENSP}</a></h6>
                                        <h5>${item.GIASP}</h5>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                        
                        <%
                            session.removeAttribute("productdetail");
                            session.removeAttribute("fulllistpr");
                            session.setAttribute("fulllistpr", session.getAttribute("NewProduct"));
                        %>
                    </div>
                    <div class="product__pagination">
                    <c:set var="pn" value="1"/>
                   <input id="pn" type="hidden" value="${thepage == null? 1 : thepage}">
                    <c:forEach begin="1" end="${pagenum}" varStatus="loop">
  						<a id="${pn}" href="${curl}&p=${pn}#product">${pn}</a>
  						<c:set var="pn" value="${pn + 1}"/>
					</c:forEach>
                        <!-- <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a> -->
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                     <script>
								 let p = document.getElementById('pn').value; 
								 console.log(p)
								 /*  let p = "2";  */
								 document.getElementById(p).classList.add("active");
				</script>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

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
	</script>


</body>

</html>
