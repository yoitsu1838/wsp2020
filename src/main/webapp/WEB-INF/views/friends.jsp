<%--
  Created by IntelliJ IDEA.
  User: yoitsu
  Date: 2021/01/08
  Time: 1:21
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
    <meta charset="utf-8">
    <title>個人図書館システム</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">

    <style>
        h3 {
            padding: 0.4em 0.5em; /*文字の上下 左右の余白*/
            color: #494949; /*文字色*/
            background: #f4f4f4; /*背景色*/
            border-left: solid 5px #7db4e6; /*左線*/
            border-bottom: solid 3px #d7d7d7; /*下線*/
        }
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark unique-color">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                個人図書館システム
            </a>
            <br>
            <div class="animated-icon open">
                <button class="navbar-toggler cross-button" type="button" data-toggle="collapse"
                        data-target="#basicExampleNav" aria-controls="basicExampleNav" aria-expanded="true"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>

                </button>
            </div>
            <!--Collapside-->
            <div class="navbar-collapse collapse show" id="basicExampleNav" style>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item hoverlink">
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
                    <li class="nav-item active hoverlink">
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
                        <a class="nav-link waves-effect waves-light" href="/Logout">
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

<!--Main layout-->
<main class="mt-5">
    <!--Main container-->
    <div class="container">
        <h3 class="my-3">友人管理</h3>
        <!--table-->
        <table class="table text-center table-hover">
            <thead>
            <tr>
                <th scope="col" style="width: 80%;">図書館名</th>
                <th scope="col" style="width: 20%;">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="width: 80%;">山田A子</td>
                <td class="table-danger" style="width: 20%;"><a href="#">削除</a></td>
            </tr>
            <tr>
                <td style="width: 80%;">佐藤B子</td>
                <td class="table-danger" style="width: 20%;"><a href="#">削除</a></td>
            </tr>
            <tr>
                <td style="width: 80%;"></td>
                <td class="table-info" style="width: 20%;"><a href="AddFriend">友人追加</a></td>
            </tr>
            </tbody>
        </table>
        <!--table closed-->
    </div>
</main>


<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

</body>
</html>
