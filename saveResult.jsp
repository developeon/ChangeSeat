<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>  </title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String result = request.getParameter("result");
String resultDivision = request.getParameter("resultDivision");
String resultNum = request.getParameter("resultNum");

out.print(result + "<br>");
out.print(resultDivision + "<br>");
out.print(resultNum + "<br>");
%>
</body>
</html>