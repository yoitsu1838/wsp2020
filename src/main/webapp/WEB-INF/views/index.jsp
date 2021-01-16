<%@ page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%
        if (session.getAttribute("login") == null || !(Boolean) session.getAttribute("login")) {
            response.sendRedirect(request.getContextPath() +"/Login");
        }
    %>
    <meta charset="UTF-8">
    <title>個人図書館システム</title>

    <!--  all -->
    <meta name="robots" content="noindex"/>
    <meta name="robots" content="nofollow"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
    <!--  //all  -->
</head>
<body>


<!--Main Navigation-->
<header>

    <!--Navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark unique-color">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%=request.getContextPath() %>/">
                個人図書館システム
            </a>
            <br>
            <div class="animated-icon open">
                <button class="navbar-toggler cross-button" type="button" data-toggle="collapse"
                        data-target="#basicExampleNav" aria-controls="basicExampleNav" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>

                </button>
            </div>
            <!--Collapside-->
            <div class="navbar-collapse collapse show" id="basicExampleNav" style>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active hoverlink">
                        <a class="nav-link waves-effect waves-light" href="<%=request.getContextPath() %>/">
                            ホーム
                        </a>
                    </li>
                    <li class="nav-item hoverlink">
                        <a class="nav-link waves-effect waves-light" href="<%=request.getContextPath() %>/Lend">
                            貸出承認
                        </a>
                    </li>
                    <li class="nav-item hoverlink">
                        <a class="nav-link waves-effect waves-light" href="<%=request.getContextPath() %>/Return">
                            返却反映
                        </a>
                    </li>
                    <li class="nav-item hoverlink">
                        <a class="nav-link waves-effect waves-light" href="<%=request.getContextPath() %>/ViewFriends">
                            友人管理
                        </a>
                    </li>
                    <li class="nav-item hoverlink">
                        <a class="nav-link waves-effect waves-light" href="<%=request.getContextPath() %>/RemoveLibrary">
                            図書館削除
                        </a>
                    </li>

                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item hoverlink">
                        <a class="nav-link waves-effect waves-light" href="<%=request.getContextPath() %>/Logout">
                            ログアウト
                        </a>
                    </li>
                </ul>
            </div>
            <!--//Collapside-->
        </div>
    </nav>
    <!--/.Navbar-->

</header>
<!--// Main Navigation-->

<!--Main layout-->
<main class="mt-5">
    <!--Main container-->
    <div class="container">


        <!--Grid row_[box]-->
        <div class="row">
            <!--Grid column_[sidebar]-->
            <div class="col-3 px-0 ">
                <div class="sidebar_content border-right border-left border-bottom">
                    <!--User-->
                    <div class="card shadow-none mb-3">
                        <div class="card-body border border-info"><a href="#myBooks"><h4 class="my-auto">
                            <% if (!(session.getAttribute("member") == null)) {
                                out.print(((User) session.getAttribute("member")).getLibraryName());
                            } %>
                        </h4></a></div>
                    </div>

                    <!--friendsList-->
                    <div class="card shadow-none">
                        <div class="card-header bg-transparent border border-info">
                            <h4 class="align-bottom my-auto">Friends</h4>
                        </div>
                        <ul class="list-group list-group-flush ">
                            <li class="list-group-item">
                                <a class="text-dark card-link" href="#">
                                    friend1
                                </a>
                            </li>
                            <li class="list-group-item">
                                <a class="text-dark card-link" href="#">
                                    friend2
                                </a>
                            </li>
                            <li class="list-group-item">
                                <a class="text-dark card-link" href="#">
                                    friend3
                                </a>
                            </li>
                        </ul>
                    </div>
                </div><!-- //Grid column_[sidebar]-->

            </div>


            <!--Grid column_[books]-->
            <div class="col-9">
                <div class="row">
                    <div class="col-sm-4 col-lg-3 pb-3">
                        <div class="card">
                            <div class="card-img-overlay py-0 px-1">
                                <button type="button" class="close" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <img class="card-img-top" height="180" src="#">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Title</li>
                            </ul>
                            <a href="#" class="btn btn-outline-warning" role="button">貸出中</a>
                        </div>
                    </div>
                    <div class="col-sm-4 col-lg-3 pb-3">
                        <div class="card">
                            <div class="card-img-overlay py-0 px-1">
                                <button type="button" class="close" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <img class="card-img-top" height="180" src="#">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Title</li>
                            </ul>
                            <a href="applicationConfirm.html" class="btn btn-outline-success" role="button">未貸出</a>
                        </div>
                    </div>
                    <div class="col-sm-4 col-lg-3 pb-3">
                        <div class="card">
                            <div class="card-img-overlay py-0 px-1">
                                <button type="button" class="close" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <img class="card-img-top" height="180" src="#">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Title</li>
                            </ul>
                            <a href="applicationConfirm.html" class="btn btn-outline-success" role="button">未貸出</a>
                        </div>
                    </div>
                    <div class="col-sm-4 col-lg-3 pb-3">
                        <div class="card">
                            <div class="card-img-overlay py-0 px-1">
                                <button type="button" class="close" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <img class="card-img-top" height="180" src="#">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Title</li>
                            </ul>
                            <a href="applicationConfirm.html" class="btn btn-outline-success" role="button">未貸出</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //Grid column_[books]-->

        </div><!--//Grid row-->

    </div>
    <!-- //Main container-->
</main>
<!--Main layout-->

<!-- all -->
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
<!--  //all -->
</body>
</html>