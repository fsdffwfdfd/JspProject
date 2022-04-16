<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbCon.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	
	int idCheck = 0;
	int nameCheck = 0;
	
	String sql = "select * from member where id=?;";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String rsId = rs.getString("id");
		String rsName = rs.getString("name");
		if(rsId.equals(id)){
			idCheck++;
			break;
		}
		if(rsName.equals(name)){
			nameCheck++;
			break;
		}
	}
	
	if(idCheck != 0){
		rs.close();
		pstmt.close();
		con.close();
		%>
			<script>
				alert("중복된 아이디입니다");
				history.back();
			</script>
		<%
	}
	else if(nameCheck != 0){
		rs.close();
		pstmt.close();
		con.close();
		%>
			<script>
				alert("중복된 아이디입니다");
				history.back();
			</script>
		<%
	}
	else{
		sql = "INSERT INTO member(id, NAME, pw) VALUES(?, ?, ?);";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, pw);
		pstmt.executeUpdate();
		
		rs.close();
		pstmt.close();
		con.close();
		
		response.sendRedirect("memberList.jsp");
	}
%>