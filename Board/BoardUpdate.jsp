<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbCon.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String idx = request.getParameter("idx");
	
	String sql = "select * from board where idx=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, idx);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String content = rs.getString("content");
	String title = rs.getString("title");
	String name = rs.getString("name");
	
	sql = "select * from member where name=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	rs = pstmt.executeQuery();
	rs.next();
	String id = rs.getString("id");
	String pw = rs.getString("pw");
	
	rs.close();
	pstmt.close();
	con.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="BoardUpdatePro.jsp" method="post">
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>글쓰기</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="title" size="50" maxlength="100" value=<%=title %>></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><input name="name" size="50" maxlength="50" value=<%=name %>  readonly></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input name="pw" size="50" maxlength="50" ></td>
      <td>&nbsp;</td>
     </tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">고유번호</td>
      <td><input name="idx" size="50" maxlength="50" value=<%=idx %> readonly></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="content" cols="50" rows="13"><%=content %></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2">
      	<input type="submit" value="수정" name="action">
      	<input type="submit" value="삭제" name="action">
      	<input type="submit" value="취소" name="action">
      </td>
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 </form>
 				<script>
 				</script>
</body>
</html>