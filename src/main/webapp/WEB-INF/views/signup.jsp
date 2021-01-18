<%--
  Created by IntelliJ IDEA.
  User: yoitsu
  Date: 2021/01/07
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!--  all -->
    <meta name="robots" content="noindex"/>
    <meta name="robots" content="nofollow"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">

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

        <!-- Additional container -->
        <div class="container">

            <!-- Navbar brand -->
            <a class="navbar-brand" href="./">個人図書館管理システム</a>

        </div>
        <!-- Additional container -->

    </nav>
    <!--/.Navbar-->

</header>

<!--// Main Navigation-->

<!--Main layout-->
<main class="mt-5">
    <!--Main container-->
    <div class="container">
        <h3 class="text-center">図書館登録</h3>
        <!-- Grid row_[flash-message] -->
        <div class="row">
            <div class="col-12 p-3">
                <% String errMsg = (String) request.getAttribute("errMsg");%>
                <% if (errMsg != null) { %>
                <div class="alert alert-danger" role="alert"><%= errMsg %>
                </div>
                <% } %>
            </div>
        </div>
        <!-- //Grid row_[flash-message] -->

        <!--Grid row_[form]-->　<!-- Todo 違うnameで来たときのヌルポ -->
        <div class="row">

            <div class="col-8 m-auto">
                <div class="card p-3">
                    <form action="Register" method="POST">
                        <div class="form-group row">
                            <label for="libName" class="col-sm-2 col-form-label">図書館名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="libName" id="libName" placeholder="図書館名"
                                       required/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="userId" class="col-sm-2 col-form-label">ユーザID</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="userId" id="userId" placeholder="ユーザID"
                                       required/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="password" class="col-sm-2 col-form-label">PassWord</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password" id="password"
                                       placeholder="PassWord"
                                       required/>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-info btn-block">登録</button>
                        <hr>
                        <p>※講義の課題として学習の目的で作成したものです。パスワードはハッシュ化されてDBに格納されますが、すでに使用したことがあるものは用いないでください。</p>
                    </form>

                </div>
            </div><!-- //Grid row_[form]-->
        </div>
    </div>
</main>


</body>
</html>
