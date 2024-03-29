
<%@page import="entity.Genre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Author"%>
<%@page import="entity.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Staff Edit Book</title>
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
    </head>
    <% Book editBook = (Book) request.getAttribute("tempBook"); %>
    <% ArrayList<Author> listAuthor = (ArrayList<Author>) request.getAttribute("listAuthor"); %>
    <% ArrayList<Genre> listGenre = (ArrayList<Genre>) request.getAttribute("listGenre");%>

    <body id="reportsPage">
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="home.jsp">
                    <h1 class="tm-site-title mb-0">Product Staff</h1>
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
                            <a class="nav-link active" href="StaffManageServlet?mode=StaffViewBook">
                                <i class="fas fa-book"></i> BOOKS
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="StaffManageServlet?mode=StaffViewOrder">
                                <i class="far fa-file-alt"></i> ORDER
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="StaffManageServlet?mode=StaffViewCustomer">
                                <i class="fas fa-user"></i> CUSTOMER
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">
                                <i class="fas fa-user"></i> PROFILE
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href='staffLogin.jsp'>
                                <%=session.getAttribute("staffLogin")%>, <b>Logout</b>
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
                                <h2 class="tm-block-title d-inline-block">EDIT BOOK</h2>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-6 col-lg-6 col-md-10" id="add">
                                <form action="StaffManageBookServlet" method="post" class="tm-edit-product-form" enctype="multipart/form-data">
                                    <input type="hidden" name="mode" value="editBook">   
                                    <div class="form-group mb-3">
                                        <label  for="name" >ID </label>
                                        <input id="name" name="bookID" type="text"class="form-control validate" readonly="" value="<%=editBook.getBook_id()%>" />
                                    </div> 

                                    <div class="form-group mb-3">
                                        <label  for="name" >Book Title </label>
                                        <input id="name" name="title" type="text"class="form-control validate" readonly="" value="<%=editBook.getTitle()%>" required=""/>
                                    </div> 

                                    <div class="form-group mb-3">
                                        <label  for="name" >Author </label>
                                        <select class="custom-select tm-select-accounts"
                                                id="category" name = "authorID">
                                            <% 
                                                
                                                for(int i = 0; i < listAuthor.size();i++){
                                                    String selected="";
                                                    selected="";
                                                if (listAuthor.get(i).getAuthor_id() == editBook.getAuthor_id())
                                                {
                                                    selected="selected";
                                                }
                                            
                                            %>
                                           
                                            <option <%=selected %> value ="<%=listAuthor.get(i).getAuthor_id() %>" > <%=listAuthor.get(i).getAuthor_name() %> </option>
                                            <% } %>
                                        </select>
                                    </div>
                                        
                                      <div class="form-group mb-3">
                                        <label  for="name" >Genre </label>
                                        <select class="custom-select tm-select-accounts"
                                                id="category" name = "genreID">
                                            <% 
                                                
                                                for(int i = 0; i < listGenre.size();i++){
                                                    String selected="";
                                                    selected="";
                                                if (listGenre.get(i).getGenre_id() == editBook.getGenre_id())
                                                {
                                                    selected="selected";
                                                }
                                            
                                            %>
                                           
                                            <option <%=selected %> value ="<%=listGenre.get(i).getGenre_id() %>" > <%=listGenre.get(i).getGenre() %> </option>
                                            <% } %>
                                        </select>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label  for="name" >Year of Release </label>
                                        <input
                                            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                            id="name" readonly="" name="YOR" type="number" min = "1200" max="2022" maxlength="4"  pattern="\d*" class="form-control validate" value="<%=editBook.getYor()%>" required=""/>
                                    </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                <div class="row">
                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                        <label for="expire_date"> Price </label>
                                        <input id="expire_date" name="price" type="number" readonly="" value="<%=editBook.getPrice()%>" class="form-control validate" data-large-mode="true"/>
                                    </div>
                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                        <label for="stock">Quantity</label> 
                                        <input id="name" name="quantity" type="number" class="form-control validate" value="<%=editBook.getQuantity()%>" required=""/>
                                    </div>
                                </div>
                                <div class="form-group mb-3">
                                    <label  for="name" >Status</label>
                                    <input
                                        oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                        id="name" name="status" type="number" min = "0" max="1" maxlength="1"  pattern="\d*" class="form-control validate" value="<%=editBook.getBook_status()%>" readonly=""/>
                                </div>
                                <div class="form-group mb-3">
                                    <label  for="name" >Description </label>
                                    <textarea class="form-control validate tm-small" readonly="" rows="5" name="description" required="" ><%=editBook.getDescription()%></textarea>
                                </div>
                                <div class="custom-file mt-3 mb-3">
                                    <input id="fileInput" readonly="" name="image" type="file" style="display:none;" accept=".png, .jpg, .jpeg, .gif" disabled />
                                    <input
                                        type="button"
                                        class="btn btn-primary btn-block mx-auto"
                                        value="UPLOAD PRODUCT IMAGE"
                                        onclick="document.getElementById('fileInput').click();"
                                        />
                                </div>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase"> UPDATE</button>
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
                                                $("#expire_date").;
                                            });
        </script>
        <script>
            // Use JavaScript to set the disabled attribute after the page loads
            window.onload = function () {
                document.getElementById("authorSelect").disabled = true;
                document.getElementById("genreSelect").disabled = true;
            };
        </script>
        <script>
            // Use JavaScript to enable the file input when needed
            function enableFileInput() {
                document.getElementById("fileInput").disabled = false;
            }

            document.getElementById("enableFileInputButton").addEventListener("click", enableFileInput);
        </script>

    </body>
</html>
