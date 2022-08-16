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
    <nav class="navbar navbar-expand-lg " color-on-scroll="500">
        <div class="container-fluid">
            <a class="navbar-brand" href=""> Dashboard </a>
            <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar burger-lines"></span>
                <span class="navbar-toggler-bar burger-lines"></span>
                <span class="navbar-toggler-bar burger-lines"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navigation">
                <ul class="nav navbar-nav mr-auto">
                    <!-- <li class="dropdown nav-item">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                            <i class="nc-icon nc-planet"></i>
                            <span class="notification">5</span>
                            <span class="d-lg-none">Notification</span>
                        </a>
                        <ul class="dropdown-menu">
                            <a class="dropdown-item" href="#">Notification 1</a>
                            <a class="dropdown-item" href="#">Notification 2</a>
                            <a class="dropdown-item" href="#">Notification 3</a>
                            <a class="dropdown-item" href="#">Notification 4</a>
                            <a class="dropdown-item" href="#">Another notification</a>
                        </ul>
                    </li> -->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nc-icon nc-zoom-split"></i>
                            <span class="d-lg-block">&nbsp;Search</span>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#pablo">
                            <span class="no-icon">Account</span>
                        </a>
                    </li>
                    <!-- <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="no-icon">Dropdown</span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </li> -->
                    <li class="nav-item">
                        <a class="nav-link" href="#pablo">
                            <span class="no-icon">Log out</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>