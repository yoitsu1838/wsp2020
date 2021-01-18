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
    <title>searchBook.jsp</title>
</head>
<body>

ISBNから検索<br>

<form action="SearchBook" method="get">
    <input type="hidden" name="method" value="isbn"/>
    <input type="text" name="isbn" value="4815601712"/>
    <button type="submit">submit</button>
</form>
<hr>
<%
    if (request.getAttribute("foundBook") != null) {
        Book book = (Book) request.getAttribute("foundBook");

%>
<h3>取得データ
</h3>
検索対象ISBN：<%=book.getIsbn()%><br>
タイトル：<%=book.getTitle()%><br>
タイトルかな：<%=book.getTitleKana()%><br>
作者：<%=book.getAuthor()%><br>
img：<img src="<%=book.getPic_path()%>"/> <br>

<%
    }
%>
</body>
</html>
