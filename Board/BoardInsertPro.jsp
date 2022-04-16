<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbCon.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String idx = request.getParameter("idx");
	String content = request.getParameter("content");
	
	int idCheck=0;
	int pwCheck=0;
	int idxCheck=0;
	
	String sql = "select * from member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	String name = null;
	if(!rs.next()){
		idCheck++;
	}
	else{
			if(!pw.equals(rs.getString("pw"))){
				pwCheck++;				
			}
			else{
				name = rs.getString("name");
			}
	}
	
	sql = "select idx from board where idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, idx);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		idxCheck++;
	}

	if(title == ""){
		rs.close();
		pstmt.close();
		con.close();
		%>
			<script>
				alert("제목을 입력하세요");
				history.back();
			</script>
		<%
	}
	else if(idCheck != 0){
	}
	else if(pwCheck != 0){

		rs.close();
		pstmt.close();
		con.close();
		%>
			<script>
				alert("비밀번호가 다릅니다");
				history.back();
			</script>
		<%
	}
	else if(idxCheck != 0){

		rs.close();
		pstmt.close();
		con.close();
		%>
			<script>
				alert("고유한 번호가 아닙니다");
				history.back();
			</script>
		<%
	}
	else{
		sql = "INSERT INTO board(title, NAME, content, idx) VALUES(?, ?,?,?);";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, name);
		pstmt.setString(3, content);
		pstmt.setString(4, idx);
		pstmt.executeUpdate();
		
		rs.close();
		pstmt.close();
		con.close();
		
		response.sendRedirect("BoardList.jsp");
	}
	
	
	
%>