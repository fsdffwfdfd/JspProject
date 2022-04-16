<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbCon.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String idx = request.getParameter("idx");
	String content = request.getParameter("content");
	String action = request.getParameter("action");
	String sql ="";
	PreparedStatement pstmt;
	ResultSet rs;
	String rsPw="";
	
	switch(action){
	case "수정":
		sql = "select * from member where name=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		rs.next();
		rsPw = rs.getString("pw");
		System.out.println(rsPw);
		System.out.println(pw);
		if(!rsPw.equals(pw)){
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
		else{
			if(title == ""){
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
			else{
				sql = "update board set title=?, content=? where idx=?;";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, title);
				pstmt.setString(2, content);
				pstmt.setString(3, idx);
				pstmt.executeUpdate();
				
				rs.close();
				pstmt.close();
				con.close();
				response.sendRedirect("BoardList.jsp");
			}
		}
		
		break;
		
	case "삭제":

		sql = "select * from member where name=?;";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		rs.next();
		rsPw = rs.getString("pw");
		
		if(!pw.equals(rsPw)){
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
		else{
			sql = "delete from board where idx=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
			response.sendRedirect("BoardList.jsp");
		}
		break;
	case "취소":
		response.sendRedirect("BoardList.jsp");
		break;
	}
%>