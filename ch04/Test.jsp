<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다중 데이터 보내기</title>
</head>
<body>
<form mathod="post" action="Test.jsp">
   <input type = "checkbox" name="hobby" value="음악감상">음악감상<br>
   <input type = "checkbox" name="hobby" value="영화감상">영화감상<br>
   <input type = "checkbox" name="hobby" value="스포츠시청">스포츠시청<br>
   <input type = "submit" value="확인">
</form>

</body>
</html>