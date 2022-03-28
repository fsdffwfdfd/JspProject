<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다중 데이터 전달</title>
</head>
<body>
  <%
  request.setCharacterEncoding("utf-8");
  
  String[] hobby = request.getParameterValues("hobby");
  
  
  //문자열 배열의 인덱스를 사용하여 화면 출력
  for(int i=0; i<hobby.length; i++){
	 out.println(hobby[i]);
 }
  
  //문자열 배열(컬렉션) 처리 방법
  for(String s : hobby){
	  out.println(s);
  }
  
  %>
  
</body>
</html>