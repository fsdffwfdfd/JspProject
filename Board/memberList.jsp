<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbCon.jsp"%>
<%
	String sql = "select * from member";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        body{width: 500px;margin: 20px auto;}
        #btn, #btn button{text-align:center;margin:10px 5px;}
        .sub_news,.sub_news th,.sub_news td{border:0}
        .sub_news a{color:#383838;text-decoration:none}
        .sub_news{width:100%;color:#666;font-size:12px;table-layout:fixed}
        .sub_news caption{display:none}
        .sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
        .sub_news td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
        .sub_news .date,.sub_news .hit{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
        .sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
        .sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
        .sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
    </style>
</head>
<body>
    <table class="sub_news" border="1" cellspacing="0">
        <colgroup>
            <col>
            <col width="110">
            <col width="100">
            <col width="80">
        </colgroup>
        <thead>
            <tr>
                <th scope="col">아이디</th>
                <th scope="col">이름</th>
                <th scope="col">비밀번호</th>
            </tr>
        </thead>
        <tbody>
	        <%
		        while(rs.next()){
		    		String id = rs.getString("id");
		    		String pw = rs.getString("pw");
		    		String name = rs.getString("name");
	    		%>
	    			<tr>
	                <td class="title">
	                    <a href="memberUpdate.jsp?id=<%=id%>"><%=id %></a>
	                </td>
	                <td class="name"><%=name %></td>
	                <td class="date"><%=pw %></td>
	            </tr>
	    		<%
	            
		    		}
		    		rs.close();
		    		pstmt.close();
		    		con.close();
	    		%>
        </tbody>
    </table>
    <div id="btn">
	    <button onclick="location.href='index.html'">홈</button>
	    <button onclick="location.href='BoardList.jsp'">게시판</button>
	    <button onclick="location.href='memberInsert.jsp'">회원추가</button>
    </div>
</body>
</html>