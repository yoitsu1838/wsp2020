<%@ page import="model.Book" %><%--
  Created by IntelliJ IDEA.
  User: yoitsu
  Date: 2021/01/19
  Time: 5:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <li class="nav-item hoverlink">
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
        <h3 class="my-3">貸出申請</h3>
        <%
            if (request.getAttribute("applyBook") != null) {
                Book book = (Book) request.getAttribute("applyBook");
                String picpath = book.getPic_path();
                String cutStr = "?_ex=200x200";
        %>
        <div class="text-center">
            <h4>貸出申請を行いますか？</h4>
            <div class="card mx-auto my-3" style="width: 70%;">
                <div class="row no-gutters">

                    <div class="col-md-4">
                        <%
                            if (picpath != null && picpath.length() > 60) {
                        %>
                        <img class="card-img" width="200px"
                             src="<%=picpath.substring(0,picpath.length()-cutStr.length())%>"/>
                        <%
                        } else {
                        %>
                        <img class="card-img" width="200px"
                             src="<%=request.getContextPath() %>/assets/images/no_image_tate.jpg"/>
                        <%
                            }
                        %>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">

                            <h5 class="card-title"><%=book.getTitle()%>
                            </h5>
                            <table class="table text-center table-hover m-auto" style="width: 90%;">
                                <tbody>
                                <tr>
                                    <th scope="row">作者</th>
                                    <td><%=book.getAuthor()%>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">巻数</th>
                                    <td>[巻数情報なし]</td>
                                </tr>
                                <tr>
                                    <th scope="row">備考</th>
                                    <td>
                                        <pre><%=book.getRemarks()%></pre>
                                        <br></td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>

                </div>

            </div>
            <form action="ApplicationConfirm" method="POST">
                <input type="hidden" name="bookId" value="<%=book.getIsbn()%>">
                <button type="submit" class="btn btn-outline-info">申請する</button>
                <a class="btn btn-outline-info" href="./">キャンセル</a>
            </form>


        </div>
        <%
            }
        %>
    </div>
</main>


</body>
</html>
