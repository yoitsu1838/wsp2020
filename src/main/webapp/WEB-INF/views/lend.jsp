<%@ page import="model.Book" %>
<%@ page import="model.CollectionList" %>
<%@ page import="model.BookList" %>
<%@ page import="model.Collection" %><%--
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

        <h3 class="my-3">貸出承認</h3>
        <!--table-->
        <table class="table text-center table-hover">
            <thead class="black white-text">
            <tr>
                <th scope="col">受付日付</th>
                <th scope="col">本タイトル</th>
                <th scope="col">名前</th>
                <th scope="col" colspan="2">操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                CollectionList cList = (CollectionList) request.getAttribute("collectionlist");
                BookList bList = (BookList) request.getAttribute("booklist");

                for (int i = 0; i < cList.size(); i++) {
                    Collection collection = cList.getList().get(i);
                    Book book = bList.getList().get(i);
                    if (collection.getLendingReceptionDate() == null || collection.getLendingReceptionDate().equals("")) {
                        continue;
                    }

                    if (collection.getLendingApprovalDate() == null || collection.getLendingApprovalDate().equals("")) {
                        //処理を継続
                    } else {
                        if (collection.getLendingApprovalDate().length() > 0) {
                            //承認されたと判断できる
                            continue;
                        }
                    }

            %>
            <tr>
                <th scope="row"><%=collection.getLendingReceptionDate()%>
                </th>
                <td><%=book.getTitle()%>
                </td>
                <td><%=collection.getFromUser()%>
                </td>
                <td class="table-info">
                    <form action="LendApprove" name="permitForm<%=i%>" method="post">
                        <input type="hidden" name="bookId" value="<%=book.getIsbn()%>"/>
                        <input type="hidden" name="method" value="approve"/>
                        <a href="javascript:permitForm<%=i%>.submit()">承認</a>
                    </form>
                </td>
                <td class="table-warning">
                    <form action="LendApprove" name="rejectForm<%=i%>" method="post">
                        <input type="hidden" name="bookId" value="<%=book.getIsbn()%>"/>
                        <input type="hidden" name="method" value="reject"/>
                        <a href="javascript:rejectForm<%=i%>.submit()">拒否</a>
                    </form>
                </td>
            </tr>
            <%
                }
            %>

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
