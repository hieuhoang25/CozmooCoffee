 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
 <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>Danh mục</span>
                        </div>
                        <ul>
                        <c:forEach var="item" items="${danhmucs}">
                            <li><a href="${pageContext.request.contextPath}/productdetail?idDanhMuc=${item.getMaDM()}&p=1#product">${item.getTenDanhMuc()}</a></li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
