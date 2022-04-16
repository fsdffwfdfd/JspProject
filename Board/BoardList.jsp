<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbCon.jsp"%>
<%
	String sql = "select * from board";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .sub_news,.sub_news th,.sub_news td{border:0}
        .sub_news a{color:#383838;text-decoration:none}
        .sub_news{width:100%;border-bottom:1px solid #999;color:#666;font-size:12px;table-layout:fixed}
        .sub_news caption{display:none}
        .sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
        .sub_news td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
        .sub_news .date,.sub_news .hit{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
        .sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
        .sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
        .sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
        .sub_news tr.reply .title a{padding-left:16px;background:url(ì²¨ë¶íì¼/ic_reply.png) 0 1px no-repeat}
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
                <th scope="col">제목</th>
                <th scope="col">이름</th>
                <th scope="col">고유번호</th>
            </tr>
        </thead>
        <tbody>
         <%
		        while(rs.next()){
		    		String title = rs.getString("title");
		    		String name = rs.getString("name");
		    		String idx = rs.getString("idx");
	    		%>
	    			<tr>
	                <td class="title">
	                    <a href="BoardUpdate.jsp?idx=<%=idx%>"><%=title %></a>
	                </td>
	                <td class="name"><%=name %></td>
	                <td class="name"><%=idx %></td>
	            </tr>
	    		<%
	            
		    		}
		    		rs.close();
		    		pstmt.close();
		    		con.close();
	    		%>
        </tbody>
    </table>
		<a href="index.html"><button>홈</button></a>
		<a href="BoardInsert.jsp"><button>글쓰기</button></a>
		<a href="memberList.jsp"><button>회원목록</button></a>
</body>
</html>