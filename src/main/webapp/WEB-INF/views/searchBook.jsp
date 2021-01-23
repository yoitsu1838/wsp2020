<%@ page import="model.Book" %><%--
  Created by IntelliJ IDEA.
  User: yoitsu
  Date: 2021/01/18
  Time: 21:35
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
        <h3 class="my-3">本を探す</h3>
        <div class="text-center">
            <h4>ISBNを入力してください</h4>
            <form action="SearchBook" method="get">
                <div class="form-group row">
                    <label for="inputISBN" class="col-sm-2 col-form-label">ISBN-10</label>
                    <div class="col-sm-10">
                        <input type="hidden" name="method" value="isbn"/>
                        <input type="text" class="form-control" name="isbn" id="inputISBN" value="4815601712" maxlength="10" minlength="10"
                               placeholder="10ケタのISBNを入力してください" required/>
                    </div>
                </div>
                <button type="submit" class="btn btn-outline-info">探す</button>
                <a class="btn btn-outline-blue-grey" href="AddBook">戻る</a>
            </form>

        </div>

        <%
            if (request.getAttribute("foundBook") != null) {
                Book book = (Book) request.getAttribute("foundBook");

        %>
        <div class="text-center mt-5 mb-5">
            <h4>検索結果</h4>
            <table class="table text-center table-hover m-auto" style="width: 90%;">
                <tbody>
                <tr>
                    <th scope="row">タイトル</th>
                    <td><span title="<%=book.getTitleKana()%>"><%=book.getTitle()%></span></td>
                </tr>
                <tr>
                    <th scope="row">表紙</th>
                    <td><img src="<%=book.getPic_path()%>"/></td>
                </tr>
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
            <form action="SearchBook" method="POST">
                <input type="hidden" name="method" value="nowBookAdd"/>
                <button type="submit" class="btn btn-info">この本を追加</button>
            </form>
        </div>


        <!-- dubug-
        検索対象ISBN：<%=book.getIsbn()%>
        タイトル：<%=book.getTitle()%>
        タイトルかな：<%=book.getTitleKana()%>
        作者：<%=book.getAuthor()%>
        img：<%=book.getPic_path()%>
        -->
        <%
            }
        %>
    </div>
</main>


</body>
</html>
