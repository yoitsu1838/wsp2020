<%--
  Created by IntelliJ IDEA.
  User: yoitsu
  Date: 2021/01/18
  Time: 20:29
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


<!--Main layout-->
<main class="mt-1">
    <!--Main container-->
    <div class="container">
        <h3 class="my-3">本登録</h3>
        <div class="text-center">
            <br>
            <a href="<%=request.getContextPath() %>/AddBook?method=search" >本を探す</a>
            <br>
            <h4>本が見つからない場合</h4>
            <form action="AddBook" method="POST">
                <div class="form-group row">
                    <label for="inputTitle" class="col-sm-2 col-form-label">タイトル</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputTitle" placeholder="タイトル" required></input>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputAuther" class="col-sm-2 col-form-label">作者</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputAuther" placeholder="作者" required></input>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputNumber" class="col-sm-2 col-form-label">巻数</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputNumber" placeholder="巻数"></input>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">表紙</label>
                    <div class="col-sm-10 text-left">
                        ※現在表紙を登録できません。
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputOther" class="col-sm-2 col-form-label">備考</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputOther" placeholder="備考"></input>
                    </div>
                </div>

            </form>
            <button type="submit" class="btn btn-outline-info">追加する</button>

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
