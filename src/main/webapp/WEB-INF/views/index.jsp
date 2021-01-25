<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%
        if (session.getAttribute("login") == null || !(Boolean) session.getAttribute("login")) {
            response.sendRedirect(request.getContextPath() + "/Login");
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
    <link href="<%=request.getContextPath() +"/assets/css/common.css"%>" rel="stylesheet">
    <!--  //all  -->

    <style>
        #plus {
            margin: 15px;
            width: 80px;
            height: 80px;
            position: fixed;
            right: 0;
            bottom: 0;
            background: #3f98ef;
            opacity: 0.6;
            border-radius: 50%;
        }

        #plus a {
            position: relative;
            display: block;
            width: 80px;
            height: 80px;
            text-decoration: none;
        }

        #plus::before, #plus::after {
            display: block;
            content: '';
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            position: absolute;
            width: 30px;
            height: 5px;
            top: 38px;
            left: 25px;
        }

        #plus:before {
            width: 5px;
            height: 30px;
            top: 25px;
            left: 38px;
            margin: auto;
            text-align: center;
        }
    </style>

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
                        data-target="#libNav" aria-controls="libNav" aria-expanded="true"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>

                </button>
            </div>
            <!--Collapside-->
            <div class="navbar-collapse collapse" id="libNav">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active hoverlink">
                        <a class="nav-link waves-effect waves-light" href="<%=request.getContextPath() %>/">
                            ホーム
                        </a>
                    </li>
                    <li class="nav-item hoverlink">
                        <a class="nav-link waves-effect waves-light" href="<%=request.getContextPath() %>/LendApprove">
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
                        <a class="nav-link waves-effect waves-light"
                           href="<%=request.getContextPath() %>/RemoveLibrary">
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
        <% String errMsg = (String) request.getAttribute("errMsg");%>
        <% if (errMsg != null) { %>
        <div class="alert alert-danger" role="alert"><%= errMsg %>
        </div>
        <% } %>
        <% String message = (String) request.getAttribute("message");%>
        <% if (message != null) { %>
        <div class="alert alert-success" role="alert"><%= message %>
        </div>
        <% } %>

        <!--Grid row_[box]-->
        <div class="row">
            <!--Grid column_[sidebar]-->
            <div class="col-3 px-0 ">
                <div class="sidebar_content border-right border-left border-bottom">
                    <!--User-->
                    <div class="card shadow-none mb-3">
                        <div class="card-body border border-info"><a href="<%=request.getContextPath() %>/"><h4
                                class="my-auto">
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
                        <% List<String> nameList = (List<String>) request.getAttribute("friendNameList"); %>
                        <% List<String> friendList = (List<String>) request.getAttribute("friendlist"); %>
                        <ul class="list-group list-group-flush ">
                            <%
                                int count = 0;
                                for (String libName : nameList) {
                                    if (libName == null) {
                                        continue;
                                    }
                            %>
                            <form action="./" name="form<%=count%>" method="POST">
                                <li class="list-group-item">
                                    <input type="hidden" name="friendLibId"
                                           value="<%= friendList.get(count)%>"/>
                                    <a type="submit" class="text-dark card-link"
                                       href="javascript:form<%=count%>.submit()">
                                        <%= libName %>
                                    </a>
                                </li>
                            </form>
                            <%
                                    count++;
                                }
                            %>

                        </ul>
                    </div>
                </div><!-- //Grid column_[sidebar]-->

            </div>


            <!--Grid column_[books]-->
            <div class="col-9">
                <%
                    CollectionList cList = (CollectionList) request.getAttribute("collectionlist");
                    BookList bList = (BookList) request.getAttribute("booklist");
                %>

                <div class="row">
                    <%
                        for (int i = 0; i < cList.size(); i++) {
                            Collection collection = cList.getList().get(i);
                            Book book = bList.getList().get(i);
                    %>
                    <div class="col-sm-4 col-lg-3 pb-3">
                        <div class="card">
                            <div class="card-img-overlay py-0 px-1">
                                <%
                                    if (collection.getIsLending()) {
                                %>
                                <button type="button" class="close" data-toggle="modal" data-target="#nowLending">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <%
                                } else {
                                %>
                                <button type="button" class="close" aria-label="Close"
                                        onclick="location.href='RemoveBook?bookId=<%=book.getIsbn()%>'">
                                    <span aria-hidden="true">&times;</span>
                                </button>

                                <%
                                    }
                                %>

                            </div>
                            <%
                                if (book.getPic_path() == null) {
                            %>
                            <img class="card-img-top" height="240px"
                                 src="<%=request.getContextPath() +"/assets/images/no_image_tate.jpg"%>">
                            <%
                            } else {
                            %>
                            <img class="card-img-top" height="240px" src="<%=book.getPic_path()%>">
                            <%
                                }
                            %>
                            <div class="bookText">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"><%=book.getTitle()%>
                                    </li>
                                </ul>
                            </div>
                            <%
                                if (collection.getIsLending()) {
                            %>
                            <a href="#" class="btn btn-outline-warning" role="button">貸出中</a>
                            <% } else { %>
                            <a href="ApplicationConfirm?bookId=<%=book.getIsbn()%>" class="btn btn-outline-success"
                               role="button">未貸出</a>
                            <%
                                }
                            %>

                        </div>
                    </div>
                    <%
                        }
                    %>

                </div>

            </div>
            <!-- //Grid column_[books]-->

        </div><!--//Grid row-->

    </div>
    <!-- //Main container-->
</main>
<!--Main layout-->

<!--books closed-->
<div id="plus">
    <a href="addBook.html" data-toggle="modal" data-target="#addBookModal"></a>
</div>

<!-- bookAdd modal -->
<!-- Modal -->

<div class="modal fade" id="addBookModal" tabindex="-1" role="dialog" aria-labelledby="addBookModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <iframe id="iframeBookAdd" src="<%=request.getContextPath() %>/AddBook"></iframe>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- bookDeleteModal -->
<!-- Central Modal Medium Warning -->
<div class="modal fade" id="nowLending" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-notify modal-warning" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <p class="heading lead">貸出中</p>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>

            <!--Body-->
            <div class="modal-body">
                <div class="text-center">
                    <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                    <p>現在この書籍は貸出中のため、<br>削除処理を行うことはできません。</p>
                </div>
            </div>

            <!--Footer-->
            <div class="modal-footer justify-content-center">
                <a type="button" class="btn btn-outline-warning waves-effect" data-dismiss="modal">Close</a>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- Central Modal Medium Warning-->

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