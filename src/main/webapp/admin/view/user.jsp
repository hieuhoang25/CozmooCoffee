<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"
	scope="application" />
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
.card form [class*="col-"] {
	padding: 0 0;
}

.nav>.nav-item>.nav-link.active {
	background: rgb(255, 255, 255, 0.2);
}

#delete-btn:disabled {
	background-color: grey !important;
	color: white !important;
}

.product__pagination, .blog__pagination {
	padding-top: 10px;
}

.product__pagination a, .blog__pagination a {
	display: inline-block;
	width: 30px;
	height: 30px;
	border: 1px solid #b2b2b2;
	font-size: 14px;
	color: #b2b2b2;
	font-weight: 700;
	line-height: 28px;
	text-align: center;
	margin-right: 16px;
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
}

.product__pagination a:hover, .blog__pagination a:hover {
	background: #7fad39;
	border-color: #7fad39;
	color: #ffffff;
}

.product__pagination a:last-child, .blog__pagination a:last-child {
	margin-right: 0;
}
</style>

</head>

<body>
	<script>let path = "${pageContext.request.contextPath}"</script>
	<div class="wrapper">
		<!-- <div id="nav-placeholder"> </div>
        <script>
            $(function () {
                $("#nav-placeholder").load("component/nav.jsp");
            });
        </script> -->
		<div class="sidebar" data-color="orange"
			data-image="../assets/img/sidebar-4.jpg">
			<div class="position-relative sidebar-wrapper">
				<div class="logo">
					<a href="#" class="simple-text"> Cozmoz Cafe </a>
				</div>
				<div class="acc text-white bg-dark">
					Ad =
					<c:out value="${sessionScope.account.hoTen}" />
				</div>
				<ul class="nav">
					<li class="nav-item "><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/dashboard"> <i
							class="nc-icon nc-chart-pie-35"></i>
							<p>Thống kê</p>
					</a></li>
					<li class="nav-item  active "><a class="nav-link"
						href="${pageContext.request.contextPath}/admin/users"> <i
							class="nc-icon nc-circle-09"></i>
							<p>Quản lý người dùng</p>
					</a></li>
					<li class="nav-item "><a class="nav-link"
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
                $(function () {
                    $("#h-nav-placeholder").load("component/h-nav.jsp");
                });
            </script>
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">
					<div id="myForm" class="row">
						<div style="flex: 60;" class="">
							<div class="card strpied-tabled-with-hover">
								<div class="d-flex justify-content-between card-header">
									<h4 class="card-title">Danh sách người dùng</h4>
									<button class="btn btn-secondary btn-fill pull-right"
										data-toggle="collapse" data-target="#add">Thêm người
										dùng</button>
									<!-- <p class="card-category">Here is a subtitle for this table</p> -->
								</div>
								<div class="card-body table-full-width table-responsive">
									<table class="table table-hover table-striped">
										<thead>
											<th>ID</th>
											<th>Vai trò</th>
											<th>Họ tên</th>
											<th>Email</th>
											<th>Phone</th>
											<th>Chỉnh sửa</th>
										</thead>
										<tbody>
											<c:forEach var="u" items="${userList}">
												<tr id="id-${u.userId}">
													<td>${u.userId}</td>
													<td>${u.role? 'Admin' : 'User'}</td>
													<td>${u.hoTen}</td>
													<td>${u.email}</td>
													<td>${u.phone}</td>

													<td>
														<div>
															<button id="edit-btn" class="edit-btn btn btn-warning"
																data-toggle="collapse" data-target="#update">
																<i class="fa fa-pencil" aria-hidden="true"></i> Sửa
															</button>

															<button id="delete-btn" class="delete-btn btn btn-danger"
																data-toggle="modal" data-target="#myModal1" href="#no"
																<c:if test="${u.userId == sessionScope.account.userId}"> disabled</c:if>>
																<i class="fa fa-trash" aria-hidden="true"></i> Xoá
															</button>
															<input type="hidden" name="uId" id="userid"
																value="${u.userId}" />
														</div>

													</td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="product__pagination">
								<c:set var="pn" value="1" />

								<c:forEach begin="1" end="${pagenum}" varStatus="loop">
									<a href="${curl}&p=${pn}">${pn}</a>
									<c:set var="pn" value="${pn + 1}" />
								</c:forEach>
								<!-- <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a> -->
								<a href="#"><i class="fa fa-long-arrow-right"></i></a>
							</div>
						</div>
						<div class="">
							<div class="collapse indent" id="update" data-parent="#myForm">
								<div class="card card-plain table-plain-bg">
									<div class="card-header ">
										<h4 class="card-title">Chỉnh sửa thông tin</h4>
										<p class="card-category"></p>
									</div>
									<div class="card-body">
										<form name="edit-f" method="post"
											action="${path}/admin/users/edit">
											<div class="row justify-content-center">
												<div class=" d-flex flex-row-reverse">
													<div
														class="form-group d-flex flex-column col-xs-4 col-md-6">
														<div class="form-group">
															<label>Password:</label> <input type="password"
																name="password" class="form-control"
																placeholder="Password">
														</div>
														<div class="form-group">
															<label>Xác nhận Password:</label> <input type="password"
																name="c-password" class="form-control"
																placeholder="Password" value="">
														</div>
													</div>
													<div class="">
														<div class="form-group">
															<label>ID:</label> <input type="text" name="userId"
																class="text-light bg-dark form-control"
																readonly="readonly" placeholder="Username" value="">
														</div>
														<div class="form-group">
															<label>Vai trò:</label>
															<div class="form-check ml-4">
																<input type="radio" class="form-check-input"
																	id="r-admin" name="role" value="true">Admin <label
																	class="form-check-label" for="radio1"></label>
															</div>
															<div class="form-check ml-4">
																<input type="radio" class="form-check-input" id="r-user"
																	name="role" value="false">Người dùng <label
																	class="form-check-label" for="radio2"></label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>Họ tên:</label> <input type="text"
															class="form-control" placeholder="Họ tên" value=""
															name="hoTen">
													</div>
												</div>

											</div>
											<div class="row">
												<div class="col-md-12 ">
													<div class="form-group">
														<label for="exampleInputEmail1">Email:</label> <input
															type="email" name="email" class="form-control"
															placeholder="Email">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12 ">
													<div class="form-group">
														<label for="exampleInputEmail1">Điện thoại:</label> <input
															type="text" name="phone" class="form-control"
															placeholder="Điện thoại">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>Địa chỉ</label> <input type="text" name="diaChi"
															class="form-control" placeholder="Home Address" value="">
													</div>
												</div>

											</div>

											<button id="update-btn" type="submit"
												class="btn btn-info btn-fill pull-right">Cập nhật
												thông tin</button>
											<button type="button" class="btn btn-success btn-fill">Reset</button>
											<div class="clearfix"></div>
										</form>
									</div>
								</div>
							</div>
							<div class="collapse indent" id="add" data-parent="#myForm">
								<div class="card card-plain table-plain-bg">
									<div class="card-header ">
										<h4 class="font-weight-bold bg-orange card-title">Thêm
											thông tin</h4>
										<p class="card-category"></p>
									</div>
									<div class="card-body">
										<form name="add-f">
											<div class="row justify-content-center">
												<div class=" d-flex flex-row-reverse">
													<div
														class="form-group d-flex flex-column col-xs-4 col-md-6">
														<div class="form-group">
															<label>Password:</label> <input type="password"
																name="password" class="form-control"
																placeholder="Password" value="12345">
														</div>
														<div class="form-group">
															<label>Xác nhận Password:</label> <input type="password"
																name="c-password" class="form-control"
																placeholder="Password" value="12345">
														</div>
													</div>
													<div class="">
														<div class="form-group">
															<label>ID:</label> <input type="text" name="userId"
																class="form-control" readonly="readonly"
																placeholder="--" value="">
														</div>
														<div class="form-group">
															<label>Vai trò:</label>
															<div class="form-check ml-4">
																<input type="radio" class="form-check-input"
																	id="add-radio1" name="role" value="true" checked>Admin
																<label class="form-check-label" for="add-radio1"></label>
															</div>
															<div class="form-check ml-4">
																<input type="radio" class="form-check-input"
																	id="add-radio2" name="role" value="false">Người
																dùng <label class="form-check-label" for="add-radio2"></label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>Họ tên:</label> <input type="text" name="hoTen"
															class="form-control" placeholder="Họ tên" value="van">
													</div>
												</div>

											</div>
											<div class="row">
												<div class="col-md-12 ">
													<div class="form-group">
														<label for="exampleInputEmail1">Email:</label> <input
															type="email" name="email" class="form-control"
															value="jaja@gmail.com" placeholder="Email">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12 ">
													<div class="form-group">
														<label for="exampleInputEmail1">Điện thoại:</label> <input
															type="text" name="phone" class="form-control"
															value="1234567890" placeholder="Điện thoại">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label>Địa chỉ</label> <input type="text" name="diaChi"
															class="form-control" placeholder="Home Address" value="">
													</div>
												</div>

											</div>
											<button id="add-btn" type="submit"
												class="btn btn-info btn-fill pull-right">Thêm nhân
												viên</button>
											<button type="button" class="btn btn-success btn-fill">Reset</button>
											<div class="clearfix"></div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<script
				src="${pageContext.request.contextPath}/admin/assets/js/fillForm.js"></script>
			<script>
   				 $(document).ready(function() {
                                	$('table .edit-btn').on('click', function(e) {	
                                		console.log("edit click")
                                		e.stopPropagation();  
                                		
                                		let id = $(this).parent().find('#userid').val();
                                		let fid = $("form[name='edit-f'] input[name='userId']").val();
                                		console.log("fid " + fid);
										if(!$('#update').hasClass('show') && id !== fid) {
											console.log('add class show')
											edit(id);    
											$('#update').addClass('show');
											$('#add').removeClass('show');
                                		}else if($('#update').hasClass('show') && id !== fid ){
                                			edit(id);    
                                			$('#add').removeClass('show');
                                		}else {
                                			$("form[name='edit-f'] input[name='userId']").val('');
                                			if($('#add').hasClass('show')) {
                                				$('#add').removeClass('show');
                                				$('#update').addClass('show');
                                			}else {
                                				$('#update').removeClass('show');
                                			}
                                			
                                		}
										document.querySelector('#update').scrollIntoView({
											  behavior: 'smooth'
											})	                    		
                                	});
                                	
                                	
                                	 $("form[name='edit-f']").submit(function(event) {
                                	        event.preventDefault();
                                	        $.ajax({
                                	            type: "POST",
                                	            url: path + '/admin/users/edit',
                                	            data:  editf.serialize(),
                                	            dataType: "text",
                                	            success: function(data){
                                	            	let d = 'id-' + data;
                                	            	sessionStorage.setItem("selected-row", d);
                                	            	demo.showNotification('top','Cập nhật thành công','center');
                                	            	setTimeout(() => {
                                	            		location.reload();
													}, 2000);
                                	            	},
                                	            error : function(XMLHttpRequest, textStatus, errorThrown) {
                                	            	XMLHttpRequest.responseType = 'text';
                                	            	demo.showError(XMLHttpRequest.responseText);
                                	            	/* alert('call errror from servlet' + XMLHttpRequest.responseText);  */
                                	            }	
                                	        });
                                	    });
                                	});   	 
              </script>

			<script>           
   window.onload = function() {
		let id = sessionStorage.getItem("selected-row");
		let inserted = sessionStorage.getItem("lastest");
		if(id !== null) {/* 
			alert(id); */
			let row = document.querySelector("#" + id);
			let btn = document.querySelectorAll("#"+id +" .edit-btn")[0];
			let btn1 = $(btn);
			setTimeout(function(){ btn1.click()}, 100)
			sessionStorage.removeItem("selected-row");
		}else if(inserted  !== null) {
			document.querySelector("#"+inserted).scrollIntoView({
				  behavior: 'smooth'
				})	
			sessionStorage.removeItem("lastest");
		}
		
	};
	 let editf =  $("form[name='edit-f']");
	let addf =  $("form[name='add-f']");

   </script>
			<script>
              addf.submit(function(event) {
            	  event.preventDefault();
            	  $.ajax({
            		  type: "POST",
      	            url: path + '/admin/users/add',
      	            data:  addf.serialize(),
      	            dataType: "text",
      	          success: function(data){
  	            	let d = 'id-' + data;
  	            	sessionStorage.setItem("lastest", d);
  	            	demo.showNotification('top','Thêm thành công','center');
  	            	setTimeout(() => {
  	            		location.reload();
						}, 2000);
  	            	},
  	            error : function(XMLHttpRequest, textStatus, errorThrown) {
  	            	XMLHttpRequest.responseType = 'text';
  	            	demo.showError(XMLHttpRequest.responseText);
  	            	/* alert('call errror from servlet' + XMLHttpRequest.responseText);  */
  	            }
            	  });
            	  
              });
              </script>
			<jsp:include page="component/footer.jsp"></jsp:include>
			<jsp:include page="component/modal.jsp"></jsp:include>
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
