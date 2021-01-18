<%--
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

<form action="AddBook" method="get">
    <input type="hidden" name="method" value="search" />
<input type="text" name="isbn" />
</form>

</body>
</html>
