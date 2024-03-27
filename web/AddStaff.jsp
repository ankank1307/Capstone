<%-- 
    Document   : AddProduct
    Created on : May 14, 2022, 7:41:16 PM
    Author     : phuon
--%>

<%@page import="entity.Genre"%>
<%@page import="entity.Author"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Add Staff</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
        <link rel="stylesheet" href="css/search_button.css" />
        <link rel="shortcut icon" type="image/x-icon" href="images/book.ico"/>
       <style>
            .dropbtn {
                background-color: #04AA6D;
                color: white;
                padding: 16px;
                font-size: 16px;
                border: none;
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #567086;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: white;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: #3e8e41;
            }
        </style>
    </head>
 
    <body id="reportsPage">
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="home.jsp">
                    <h1 class="tm-site-title mb-0">Product Admin</h1>
                </a>
                <button
                    class="navbar-toggler ml-auto mr-0"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link" href="ManageAuthorServlet?mode=viewAuthor">
                                <i class="fas fa-user-tie"></i> AUTHORS
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="ManageBookServlet?mode=viewBook">
                                <i class="fas fa-book"></i> BOOKS
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ManageGenreServlet?mode=viewGenre">
                                <i class="fas fa-money-bill-wave"></i> GENRE
                            </a>
                        </li>
                        <div class="dropdown ">
                            <a class="nav-link" href="">
                                <i class="fas fa-file-alt"></i> 
                                <span>
                                    REPORT<i class="fas fa-angle-down" style="padding-left: 5px;"></i>
                                </span>
                            </a>
                            <div class="dropdown-content">
                                <a href="ManageOrderServlet?mode=viewOrder">ORDER</a>
                                <a href="DailyReport.jsp">WEEKLY REPORT</a>
                                <% String date = java.time.LocalDate.now().toString(); 
                                    System.out.println(date);
                                %>
                                <a href="ViewReportServlet?mode=dailyReport&startDate=<%=0 %>&endDate=<%=date %>">DAILY REPORT</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <a class="nav-link active" href="">
                                <i class="fas fa-user"></i> 
                                <span>
                                    USER<i class="fas fa-angle-down" style="padding-left: 5px;"></i>
                                </span>
                            </a>

                            <div class="dropdown-content">
                                <a href="ManageStaffServlet?mode=viewStaff">STAFF</a>
                                <a href="ManageCustomerServlet?mode=viewCustomer">CUSTOMER</a>
                            </div>
                        </div>
                        <li class="nav-item">
                            <a class="nav-link" href="ManageDiscountServlet?mode=viewDiscount">
                                <i class="fas fa-money-check"></i> VOUCHERS
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href='adminLogin.jsp'>
                                Admin, <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">ADD STAFF</h2>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-6 col-lg-6 col-md-10" id="add">
                                <form action="AddStaffServlet" method="post" class="tm-edit-product-form" >


                                    <div class="form-group mb-3">
                                        <label  for="name" >Name </label>
                                        <input id="name" name="name" type="text"class="form-control validate" required=""/>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label  for="name" >Username </label>
                                        <input id="name" name="username" type="text"class="form-control validate" required=""/>
                                    </div>


                                    <!--                                    <div class="custom-file mt-3 mb-3">
                                                                            <input  name = "image" id="fileInput" type="file"  />
                                                                        </div>-->
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                <div class="form-group mb-3">
                                    <label  for="name" >Password </label>
                                    <input id="name" name="password" value="123456" type="text"class="form-control validate" readonly=""/>
                                </div> 
                                <div class="form-group mb-3">
                                    <label  for="name" >Email </label>
                                    <input id="name" name="email" type="text"class="form-control validate" required=""/>
                                </div>



                                <!--                                <div class="custom-file mt-3 mb-3">
                                                                    <input id="fileInput" type="file" name="image" style="display: none" accept=".png, .jpg, .jpeg, .gif"  />
                                                                    <input
                                                                        type="button"
                                                                        class="btn btn-primary btn-block mx-auto"
                                                                        value="UPLOAD PRODUCT IMAGE"
                                                                        onclick="document.getElementById('fileInput').click();"
                                                                        />
                                                                </div>-->
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">ADD NEW STAFF</button>
                            </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
                <p class="text-center text-white mb-0 px-4 small">
                    Copyright &copy; <b>2018</b> All rights reserved. 
                </p>
            </div>
        </footer> 

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
        <!-- https://jqueryui.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
            $(function () {
                $("#expire_date").datepicker();
            });
        </script>
    </body>
</html>
