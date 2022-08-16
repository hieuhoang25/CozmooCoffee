<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
        <div class="sidebar" data-color="orange" data-image="../assets/img/sidebar-4.jpg">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"
    
        Tip 2: you can also add an image using data-image tag
    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="#" class="simple-text">
                        Cozmoz Cafe
                    </a>
                </div>
                <ul class="nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="dashboard.jsp">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/view/user">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>Quản lý người dùng</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/view/product">
                            <i class="nc-icon nc-notes"></i>
                            <p>Quản lý sản phẩm</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/view/user_profile">
                            <i class="nc-icon nc-notes"></i>
                            <p>Thông tin người dùng</p>
                        </a>
                    </li>
                                        <li>
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/view/user_profile">
                            <i class="nc-icon nc-notes"></i>
                            <p>Thông tin người dùng</p>
                        </a>
                    </li>
                    <!-- <li>
                        <a class="nav-link" href="./typography.jsp">
                            <i class="nc-icon nc-paper-2"></i>
                            <p>Typography</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="./icons.jsp">
                            <i class="nc-icon nc-atom"></i>
                            <p>Icons</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="./maps.jsp">
                            <i class="nc-icon nc-pin-3"></i>
                            <p>Maps</p>
                        </a>
                    </li> -->
                    <li>
                        <a class="nav-link" href="./notifications">
                            <i class="nc-icon nc-bell-55"></i>
                            <p>Notifications</p>
                        </a>
                    </li>
                    <!-- <li class="nav-item active active-pro">
                        <a class="nav-link active" href="upgrade.jsp">
                            <i class="nc-icon nc-alien-33"></i>
                            <p>Upgrade to PRO</p>
                        </a>
                    </li> -->
                </ul>
            </div>
        </div>
      
</body>
</html>
