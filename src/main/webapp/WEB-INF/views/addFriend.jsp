<%--
  Created by IntelliJ IDEA.
  User: yude
  Date: 2021/01/16
  Time: 3:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        if (session.getAttribute("login") == null || !(Boolean) session.getAttribute("login")) {
            response.sendRedirect("/Login");
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
                        <a class="nav-link waves-effect waves-light" href="/">
                            ホーム
                        </a>
                    </li>
                    <li class="nav-item hoverlink">
                        <a class="nav-link waves-effect waves-light" href="/Lend">
                            貸出承認
                        </a>
                    </li>
                    <li class="nav-item hoverlink">
                        <a class="nav-link waves-effect waves-light" href="/Return">
                            返却反映
                        </a>
                    </li>
                    <li class="nav-item active hoverlink">
                        <a class="nav-link waves-effect waves-light" href="/ViewFriends">
                            友人管理
                        </a>
                    </li>
                    <li class="nav-item hoverlink">
                        <a class="nav-link waves-effect waves-light" href="/RemoveLibrary">
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
        <h3 class="my-3">友人追加</h3>
        <div class="text-center">
            <h4>友人を追加する</h4>
            <br>
            <p>友人を追加するには下記URLを共有してください。<br>
                URLにアクセスすることで、本の貸し借りを行うことがかのうになります。<br>
                ※本の貸し借りを行う際にはお互いに登録しておく必要があります
                ​</p>
            <p>友人追加URL:<input type="text" id="userAddUrl" class="form-control"
                              value="<%=(String)session.getAttribute("userAddUrl")%>" disabled></p>
            <div class="line-it-button" data-lang="ja" data-type="share-a" data-ver="3"
                 data-url="<%=(String)session.getAttribute("userAddUrl")%>" data-color="default"
                 data-size="small" data-count="false" style="display: none;"></div>
            <script src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js" async="async"
                    defer="defer"></script>

            <br><br><br>

            <button type="button" class="btn btn-outline-info" onclick="history.back()">戻る</button>


        </div>


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
