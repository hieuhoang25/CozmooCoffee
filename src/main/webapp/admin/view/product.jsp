<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/admin/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/admin/assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Quản lý sản phẩm</title>
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
<link href="../assets/css/demo.css" rel="stylesheet" />


<style type="text/css">
.nav-item>.active {
	background: rgb(255, 255, 255, 0.2);
}
</style>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>

<body>
	<c:set var="path" value="${pageContext.request.contextPath}"
		scope="application" />
	<div class="wrapper">
		<!-- <div id="nav-placeholder"> </div>
        <script>
            $(function(){
              $("#nav-placeholder").load("component/nav.jsp");
            });
        </script> -->
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
					$("#h-nav-placeholder").load("component/h-nav.jsp");
				});
			</script>
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div style="flex: 70;" class="">
							<div class="card strpied-tabled-with-hover">
								<div class="d-flex justify-content-between card-header">
									<h4 class="card-title">Danh sách sản phẩm</h4>
								</div>
								<div class="card-body table-full-width table-responsive">
									<table class="table table-hover table-striped">
										<thead>
											<th>ID</th>
											<th>Loại SP</th>
											<th>Tên sản phẩm</th>
											<th>Gía</th>
											<th>Giảm giá</th>
											<th>Chỉnh sửa</th>
										</thead>
										<tbody>
											<c:forEach var="item" items="${sanpham}">
												<tr>
													<td>${item.getMaSP()}</td>
													<td>${item.getDanhmuc().getTenDanhMuc()}</td>
													<td>${item.getTENSP()}</td>
													<td>${item.getGIASP()}</td>
													<td>${item.getGiamGia()}</td>
													<td><button class="btn btn-primary" onclick="getsp('${item.getMaSP()}')">Sửa</button>  <a
														style="margin-left: 10px"
														href="${path}/admin/delete?MaSP=${item.getMaSP()}">
															Xóa</a></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div id="collapse" class="col-md-4 ">
							<div class="card card-plain table-plain-bg">
								<div class="card-header ">
									<h4 class="card-title">Danh sách sản phẩm</h4>
									<p class="card-category"></p>
								</div>
								<div class="card-body">

									<form method="post" enctype='multipart/form-data'>
										<div class="row justify-content-center">
											<div class=" d-flex">
												<div class="form-group d-flex flex-column col-xs-4 col-md-6">
													<a style="height: 100%;" href="#"> 
													<img style="height: 150px; width: 150px;"class="avatar border-gray"
														src="" alt=""
														name="imgproduct" id="imgsp">

													</a> <label>Ảnh sản phẩm</label> <input type="file"
														name="fileIMG" accept=".jpg,.jpeg,.png">
												</div>
												<div class="">
													<div class="form-group">
														<label>ID:</label> <input type="text" class="form-control id"
															name="MaSP" value="${sp.getMaSP()}">
													</div>
													<div class="form-group">
														<label>Loại sản phẩm:</label> 
														<select
															class="form-select form-control loaisp"
															aria-label="Default select example" name="object-name" id="cboloai">
															<c:forEach var="item2" items="${danhmuc}">
																<option
																	<c:if test="${sp.getDanhmuc().getMaDM() == item2.getMaDM()}">selected</c:if>
																	value="${item2.getMaDM()}">${item2.getTenDanhMuc()}
																</option>
															</c:forEach>
														</select>
													</div>
												</div>

											</div>

										</div>

										<div class="row">

											<div class="col-md-12">
												<div class="form-group">
													<label>Tên sản phẩm:</label> <input type="text"
														class="form-control tensp" name="TENSP" value="${sp.getTENSP()}">
												</div>
											</div>

										</div>
										<div class="row">
											<div class="col-md-6 pr-1">
												<div class="form-group">
													<label>Giá</label> <input type="text" class="form-control gia"
														oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
														name="GIASP" value="${sp.getGIASP()}" />
												</div>

											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">Giảm giá</label> <input
														type="number" min="1" max="100" class="form-control giamgia"
														name="GiamGia" value="${sp.getGiamGia()}">
												</div>
											</div>

											<!-- <div class="col-md-6 pl-1">
                                                <div class="form-group">
                                                    <label>Last Name</label>
                                                    <input type="text" class="form-control" placeholder="Last Name" value="Andrew">
                                                </div>
                                            </div> -->
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label class="form-label" for="textAreaExample">Mô
														tả</label>
													<textarea class="form-control mota" id="textAreaExample1"
														rows="30" col="40" style="heigth: 60px;" name="MoTa">${sp.getMoTa()}</textarea>

												</div>
											</div>
											<!-- <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="text" class="form-control" placeholder="Home Address" value="Bld Mihail Kogalniceanu, nr. 8 Bl 1, Sc 1, Ap 09">
                                                </div>
                                            </div> -->
											<!-- <div class="col-md-8 ">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Email address</label>
                                                    <input type="email" class="form-control" placeholder="Email">
                                                </div>
                                            </div> -->
										</div>
										<button type="submit" class="btn btn-info btn-fill pull-right"
											formaction="${path}/admin/update">Cập nhật sản phẩm</button>
										<button type="submit" class="btn btn-success btn-fill"
											formaction="${path}/admin/insert">Thêm sản phẩm</button>
										<div class="clearfix"></div>
									</form>
									<br>
									<div class="alert alert-warning" role="alert">${message}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- <div id="footer-placeholder"> </div>
            <script>
                $(function(){
                  $("#footer-placeholder").load("component/footer.jsp");
                });
            </script> -->
			<jsp:include page="component/footer.jsp"></jsp:include>
			<div id="modal-placeholder"></div>
			<!-- <script>
                $(function(){
                  $("#modal-placeholder").load("component/modal.jsp");
                });
            </script> -->
			<jsp:include page="component/modal.jsp"></jsp:include>
		</div>
	</div>
	
	<script type="text/javascript">
		function getsp(id) {
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/edit?MaSP="+id,
				type : "GET",

				headers : {
					Accept : "application/json; charset=utf-8",
					"Content-Type" : "application/json; charset=utf-8"
				},
				success : function(data) {
					var sp = $.parseJSON(data);
					console.log(sp.TENSP);
					$('.tensp').val(sp.TENSP)
					$('.gia').val(sp.GIASP)
					$('.id').val(sp.MaSP)
					$('.giamgia').val(sp.GiamGia)
					$('.mota').val(sp.TENSP)
					$('#imgsp').attr("src", "../img/product/"+sp.HINH);
					
					$('#cboloai[value='+sp.danhmuc.MaDM+']').attr('selected','selected');
				},
				error : function(xhr) {
				}
			});
		}
		
	</script>

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
