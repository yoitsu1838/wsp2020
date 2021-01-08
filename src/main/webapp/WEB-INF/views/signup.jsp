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
</head>
<body>
<h1>signup.jsp</h1>
<main style="padding: 15px;">
    <% String errMsg = (String)request.getAttribute("errMsg");%>
    <% if (errMsg!=null){ %>
    <div class="alert alert-danger" role="alert"><%= errMsg %></div>
    <% } %>
    <form class="text-center border border-light p-5" action="Register" method="POST">
        <input type="text" name="libName" id="libName" class="form-control mb-4" placeholder="図書館名">
        <input type="text" name="userId" id="userId" class="form-control mb-4" placeholder="ユーザーID">
        <input type="password" name="password" id="password" class="form-control mb-4" placeholder="Password">

        <!-- Sign in button -->
        <button class="btn btn-info my-4" type="submit">登録</button>

        <hr>
        <p>※講義の課題として学習の目的で作成したものです。パスワードはハッシュ化されてDBに格納されますが、すでに使用したことがあるものは用いないでください。</p>
    </form>

</main>
</body>
</html>
