<%@page import="java.util.List"%>
<%@page import="anhbsd.music.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>Shop</title>

        <!-- favicon -->
        <link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
        <!-- google font -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
        <!-- fontawesome -->
        <link rel="stylesheet" href="assets/css/all.min.css">
        <!-- bootstrap -->
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <!-- owl carousel -->
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <!-- animate css -->
        <link rel="stylesheet" href="assets/css/animate.css">
        <!-- mean menu css -->
        <link rel="stylesheet" href="assets/css/meanmenu.min.css">
        <!-- main style -->
        <link rel="stylesheet" href="assets/css/main.css">
        <!-- responsive -->
        <link rel="stylesheet" href="assets/css/responsive.css">

    </head>
    <body>

        <!--PreLoader-->
        <div class="loader">
            <div class="loader-inner">
                <div class="circle"></div>
            </div>
        </div>
        <!--PreLoader Ends-->

        <!-- header -->
        <div class="top-header-area" id="sticker">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-sm-12 text-center">
                        <div class="main-menu-wrap">
                            <!-- logo -->
                            <div class="site-logo">
                                <a href="index.jsp">
                                    <img src="assets/img/logo.png" alt="">
                                </a>
                            </div>
                            <!-- logo -->

                            <!-- menu start -->
                            <c:url var="logoutLink" value="MainController">
                                <c:param name="action" value="Logout"></c:param>
                            </c:url>
                            <nav class="main-menu">
                                <ul>
                                    <li><c:if test="${empty sessionScope.LOGIN_USER}">
                                            <a style="color: rgb(214, 36, 36)" href="login.jsp">User Not Logged In</a>  
                                            <ul class="sub-menu">
                                                <li><a href="tracking.jsp">Tracking Order</a></li>
                                            </ul>
                                        </c:if></li>
                                    <li><c:if test="${not empty sessionScope.LOGIN_USER}">
                                            <a href="index.jsp">Welcome: ${sessionScope.LOGIN_USER.fullName}</a> 
                                            <ul class="sub-menu">
                                                <li><a href="tracking.jsp">Tracking Order</a></li>
                                            </ul>
                                            <ul class="sub-menu">
                                                <li><a href="profile.jsp">Your Profile</a></li>
                                            </ul>
                                        </c:if></li>
                                    <li><c:if test="${not empty sessionScope.LOGIN_USER}">
                                            <a href="${logoutLink}">Log out</a>      
                                        </c:if></li>
                                    <li>
                                    <li>
                                        <div class="header-icons">
                                            <a class="shopping-cart" href="viewCart.jsp"><i class="fas fa-shopping-cart"></i></a>
                                            <a class="mobile-hide search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </nav>
                            <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                            <div class="mobile-menu"></div>
                            <!-- menu end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end header -->

        <!-- search area -->
        <div class="search-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <span class="close-btn"><i class="fas fa-window-close"></i></span>
                        <div class="search-bar">
                            <div class="search-bar-tablecell">
                                <h3>Search For:</h3>
                                <form method="POST" action="MainController" >
                                    <input type="text" name="txtSearchValue" value="" placeholder="Keywords"/>
                                    <input type="submit" value="Search" name="action"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end search area -->
        
        <!-- breadcrumb-section -->
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <p>Fresh and Organic</p>
                            <h1>Shop</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->
        <!-- products -->
        <c:set var="result" value="${requestScope.SEARCH_RESULT}" />
        <c:if test="${not empty result}">
            <div class="product-section mt-150 mb-150">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="product-filters">
                                <ul>
                                    <li class="active" data-filter="*">All</li>
                                    <li data-filter=".DT">Dan Toc</li>
                                    <li data-filter=".East">East</li>
                                    <li data-filter=".West">West</li>
                                    <li data-filter=".O">Orchesta</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row product-lists">
                        <c:forEach var="dto" items="${result}">
                            <div class="col-lg-4 col-md-6 text-center ${dto.categoryID}" >
                                <div class="single-product-item">
                                    <div class="product-image">
                                        <a href="#"><img src="${dto.img}" alt=""></a>
                                    </div>
                                    <form action="MainController" method="post">               
                                        <h3>${dto.name}</h3>
                                        <input type="hidden" name="course" value="${dto.name}"/>
                                        <input type="hidden" name="img" value="${dto.img}"/>
                                        <input type="hidden" name="price" value="${dto.price}"/>
                                        <input type="hidden" name="quantity" value="1"/>
                                        <input type="hidden" name="cateid" value="${dto.categoryID}"/>
                                        <p class="product-price"> ${dto.price} $ <span>/mo</span> </p>
                                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i> <input type="submit" value="Add" name="action"/></a>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div> 
            </div>
        </div>
        <!-- end products -->

        <!-- logo carousel -->
        <div class="logo-carousel-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="logo-carousel-inner">
                            <div class="single-logo-item">
                                <img src="assets/img/company-logos/1.png" alt="">
                            </div>
                            <div class="single-logo-item">
                                <img src="assets/img/company-logos/2.png" alt="">
                            </div>
                            <div class="single-logo-item">
                                <img src="assets/img/company-logos/3.png" alt="">
                            </div>
                            <div class="single-logo-item">
                                <img src="assets/img/company-logos/4.png" alt="">
                            </div>
                            <div class="single-logo-item">
                                <img src="assets/img/company-logos/5.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end logo carousel -->


        <!-- copyright -->
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <p>Copyrights &copy; 2019 - <a href="#">AnhBSD162018</a>,  All Rights Reserved.</p>
                    </div>
                    <div class="col-lg-6 text-right col-md-12">
                        <div class="social-icons">
                            <ul>
                                <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-linkedin"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end copyright -->

        <!-- jquery -->
        <script src="assets/js/jquery-1.11.3.min.js"></script>
        <!-- bootstrap -->
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <!-- count down -->
        <script src="assets/js/jquery.countdown.js"></script>
        <!-- isotope -->
        <script src="assets/js/jquery.isotope-3.0.6.min.js"></script>
        <!-- waypoints -->
        <script src="assets/js/waypoints.js"></script>
        <!-- owl carousel -->
        <script src="assets/js/owl.carousel.min.js"></script>
        <!-- magnific popup -->
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <!-- mean menu -->
        <script src="assets/js/jquery.meanmenu.min.js"></script>
        <!-- sticker js -->
        <script src="assets/js/sticker.js"></script>
        <!-- main js -->
        <script src="assets/js/main.js"></script>

    </body>
</html>