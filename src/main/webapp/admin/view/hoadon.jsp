<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/admin/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/admin/assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title></title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/admin/assets/css/light-bootstrap-dashboard.css?v=2.0.0 "
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link
	href="${pageContext.request.contextPath}/admin/assets/css/demo.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style type="text/css">
.nav-item>.active {
	background: rgb(255, 255, 255, 0.2);
}
</style>
</head>

<body>
	<div class="wrapper">
		<div id="nav-placeholder"></div>
		<div class="sidebar" data-color="orange"
			data-image="../assets/img/sidebar-4.jpg">


			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="#" class="simple-text"> Cozmoz Cafe </a>
				</div>
				<ul class="nav">
					<li class="nav-item "><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/dashboard"> <i
							class="nc-icon nc-chart-pie-35"></i>
							<p>Thống kê</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/users"> <i
							class="nc-icon nc-circle-09"></i>
							<p>Quản lý người dùng</p>
					</a></li>
					<li class="nav-item "><a class="nav-link active"
						href="${pageContext.request.contextPath}/admin/product"> <i
							class="nc-icon nc-notes"></i>
							<p>Quản lý sản phẩm</p>
					</a></li>
					<li class="nav-item d-none"><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/profile"> <i
							class="nc-icon nc-notes"></i>
							<p>Thông tin người dùng</p>
					</a></li>

					<li class="nav-item d-none"><a class="nav-link "
						href="${pageContext.request.contextPath}/admin/noti"> <i
							class="nc-icon nc-bell-55"></i>
							<p>Notifications</p>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/hoadon"> <i
							class="nc-icon nc-notes"></i>
							<p>Quản lý đơn hàng</p>
					</a></li>
					<li class="nav-item "><a class="nav-link "
						href="${pageContext.request.contextPath}/logout"> <i
							class="nc-icon nc-bell-55"></i>
							<p>Đăng xuất</p>
					</a></li>

				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<div id="h-nav-placeholder"></div>
			<script>
				$(function() {
					$("#h-nav-placeholder").load("component/h-nav.html");
				});
			</script>
			<!-- End Navbar -->
			<div class="content">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Họ tên</th>
							<th scope="col">Địa chỉ</th>
							<th scope="col">Số DT</th>
							<th scope="col">Ngày tạo</th>
							<th scope="col">Tên SP</th>
							<th scope="col">Số lượng </th>
							<th scope="col">Giá</th>
							<th scope="col">Giao hàng</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="i" items="${donhang}">
						<tr>
							<td>${i.getIDHD()}</td>
							<td>${i.getHoTen()}</td>
							<td>${i.getDiaChi()}</td>
							<td>${i.getPhone()}</td>
							<td>${i.getNgayTao()}</td>
							<td>${i.getTenSP()}</td>
							<td>${i.getSoLuong()}</td>
							<td>${i.getGiaSP()}</td>
							<td><button type="button" class="btn btn-info">Giao Hàng</button></td>
						</tr>
					</c:forEach>
					</tbody>
					
				</table>

			</div>
		</div>
		<footer class="footer">
			<div class="container-fluid">
				<nav>
					<ul class="footer-menu">
						<li><a href="#"> Home </a></li>
						<li><a href="#"> Company </a></li>
						<li><a href="#"> Portfolio </a></li>
						<li><a href="#"> Blog </a></li>
					</ul>
					<p class="copyright text-center">
						Â©
						<script>
							document.write(new Date().getFullYear())
						</script>
						<a href="http://www.creative-tim.com">Creative Tim</a>, made with
						love for a better web
					</p>
				</nav>
			</div>
		</footer>
	</div>
	</div>

</body>
<!--   Core JS Files   -->
<script
	src="${pageContext.request.contextPath}/admin/assets/js/core/jquery.3.2.1.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/admin/assets/js/core/popper.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/admin/assets/js/core/bootstrap.min.js"
	type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script
	src="${pageContext.request.contextPath}/admin/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script
	src="${pageContext.request.contextPath}/admin/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script
	src="${pageContext.request.contextPath}/admin/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script
	src="${pageContext.request.contextPath}/admin/assets/js/light-bootstrap-dashboard.js?v=2.0.0 "
	type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/admin/assets/js/demo.js"></script>

</html>
