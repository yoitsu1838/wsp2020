<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>個人図書館システム</title>

    <!--  all -->
    <meta name="robots" content="noindex" />
    <meta name="robots" content="nofollow" />
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
    <nav class="navbar navbar-expand-lg navbar-dark  orange darken-4">

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
        <!--Grid row-->
        <div class="row">
            <!--Grid column-->
            <div class="col-lg-12 col-md-12 mb-4">
                <h2>認証されていません</h2>
                <hr>
                <!-- Default form login -->
                <form class="text-center border border-light p-5" action="Login" method="POST">

                    <p class="h4 mb-4">Login</p>

                    <!-- Email -->
                    <input type="text" name="id" id="defaultLoginFormEmail" class="form-control mb-4" placeholder="ID">

                    <!-- Password -->
                    <input type="password" name="password" id="defaultLoginFormPassword" class="form-control mb-4" placeholder="Password">

                    <div class="d-flex justify-content-around">
                        ※パスワードを忘れた場合は、頑張って思い出してください。
                    </div>

                    <!-- Sign in button -->
                    <button class="btn btn-info my-4" type="submit">ログイン</button>
                    <a class="btn btn-default my-4　btn-sm" href="Register">新規登録</a>


                </form>
                <!-- Default form login -->
            </div>
            <!--Grid column-->
        </div>
        <!--Grid row-->

    </div>
    <!--Main container-->
</main>
<!--Main layout-->

<!-- all -->
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
<!--  //all -->
</body>
</html>