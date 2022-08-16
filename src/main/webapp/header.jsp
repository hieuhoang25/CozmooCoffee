<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  	    <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> cozmocoffee@gmail.com</li>
                                <li>Miễn phí giao hàng cho đơn hàng từ 100k</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                          
                            <div class="header__top__right__auth">
                            <c:set var = "user" value = "${sessionScope.account}"/>
                            
                            <c:choose>
                            	
                            	<c:when  test="${user != null}"> 
                            	<div class="d-flex">
                            		<div class="p-2 fw-bold">
                            		<i class="fa fa-user"></i>
                            		${user.hoTen} 
                            		</div>
                            		<div class="align-self-center">
                            			<a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                            		</div>
                            		</div>
                            	</c:when>
                            	<c:otherwise>
                            	 <a href="${pageContext.request.contextPath}/Login/login"><i class="fa fa-user"></i> Đăng nhập</a>
                            	</c:otherwise>
                            </c:choose>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
       
