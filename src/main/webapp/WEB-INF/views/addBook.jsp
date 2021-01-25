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


<!--Main layout-->
<main class="mt-1">
    <!--Main container-->
    <div class="container">
        <h3 class="my-3">本登録</h3>
        <div class="text-center">
            <br>
            <div id="searchLink" class="mb-4"><a class="btn btn-lg btn-indigo"
                                                 href="<%=request.getContextPath() %>/SearchBook?method=isbn">本を探す</a>
            </div>

            <br>
            <h4>本が見つからない場合</h4>
            <!-- Collapse buttons -->
            <div class="pb-4">
                <a class="btn btn-primary" data-toggle="collapse" href="#collapseElement" aria-expanded="false"
                   aria-controls="collapseElement" onclick="clickBtn()">
                    本情報をシステムに登録する
                </a>

                <script>
                    //本を探すボタン
                    document.getElementById("searchLink").style.display = "block";

                    function clickBtn() {
                        const searchLink = document.getElementById("searchLink");

                        if (searchLink.style.display == "block") {
                            // noneで非表示
                            searchLink.style.display = "none";
                        } else {
                            // blockで表示
                            searchLink.style.display = "block";
                        }
                    }

                </script>
            </div>

            <!-- / Collapse buttons -->

            <!-- Collapsible element -->
            <div class="collapse" id="collapseElement">
                <form action="AddBook" method="POST">
                    <div class="form-group row">
                        <label for="inputTitle" class="col-sm-2 col-form-label">タイトル</label>
                        <div class="col-sm-10">
                            <input type="text" name="title" class="form-control" id="inputTitle" placeholder="タイトル" required/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputAuther" class="col-sm-2 col-form-label">作者</label>
                        <div class="col-sm-10">
                            <input type="text" name="author" class="form-control" id="inputAuther" placeholder="作者" required/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputNumber" class="col-sm-2 col-form-label">巻数</label>
                        <div class="col-sm-10">
                            <input type="text" name="volume" class="form-control" id="inputNumber" placeholder="巻数"/>
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
                            <input type="text" name="remark" class="form-control" id="inputOther" placeholder="備考"/>
                        </div>
                    </div>

                    <a class="btn btn-outline-blue-grey"
                       href="<%=request.getContextPath() %>/SearchBook?method=isbn">本を探す</a>
                    <button type="submit" class="btn btn-outline-info">追加する</button>

                </form>
            </div>


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
