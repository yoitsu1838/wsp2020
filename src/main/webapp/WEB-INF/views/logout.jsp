<%--
  Created by IntelliJ IDEA.
  User: yoitsu
  Date: 2021/01/18
  Time: 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
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
        <h3 class="my-3">ログアウト</h3>
        <div class="text-center">
            <h4>ログアウトしました</h4>
            <a class="btn btn-outline-info" href="<%=request.getContextPath() %>/Login">ログイン画面に戻る</a>
            <button type="button" class="btn btn-outline-info">このウィンドウを閉じる</button>


        </div>
    </div>
</main>

</body>
</html>
