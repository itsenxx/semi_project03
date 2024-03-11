<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="utils.DBConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/Main.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>

	<%
		String empname = (String) session.getAttribute("emp_name");
		if (empname == null || empname.isEmpty()) {
    	response.sendRedirect("compuzoonLoginForm.jsp");
		}
	
		DBConfig dbc = new DBConfig();
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		LocalDate now = LocalDate.now();
		LocalDate date = now.plusDays(7);
		
		String nowdate = String.valueOf(now);
		String nextdate = String.valueOf(date);
		try{
			
			conn = dbc.getConnection();
			
		} catch (Exception e){
			System.out.println(e.getMessage());
			System.out.println(e.getStackTrace());
		}
	%>
	<%@ include file="header.jsp" %>
	
	<div class="box">
    <%@ include file="sideDiv.jsp" %>
    <div class="form">
    	<div class="form1">
	    	<div class="cpzpart">
	    		<div class="head">
					<div class="name">최신 재고입고.</div>
					<a href="cpzPartEX.jsp" class="material-symbols-outlined" id="add">add</a>
				</div>
				<div class="story">
    				<div class="storyhead storybox">
	    				<div>DATE</div>
	    				<div>NAME</div>
	    				<div>COMNET</div>
    				</div>
    				<%
    					String cpzpart = "SELECT NUM,EMP_NAME, TO_CHAR(CARGO_IN_DATE,'YY-MM-DD') AS DA_TE, CARGO_COMENT FROM CARGO "
    									 +"ORDER BY DA_TE ASC";
    			
    					pstmt = conn.prepareStatement(cpzpart);
    					rs = pstmt.executeQuery();
    					for(int i=0; rs.next(); i++){
    						%>
    						<div class="storys storybox">
		    						<div><a href="cpzWerehouseNote.jsp?num=<%=rs.getString("NUM")%>"><%=rs.getString("DA_TE")%></a></div>
		    						<div><a href="cpzWerehouseNote.jsp?num=<%=rs.getString("NUM")%>"><%=rs.getString("EMP_NAME")%></a></div>
		    						<div><a href="cpzWerehouseNote.jsp?num=<%=rs.getString("NUM")%>"><%=rs.getString("CARGO_COMENT")%></a></div>
    						</div>
    						<%
    						if(i==5){
    							break;
    						}
    					}
    				%>
    			</div>	    	
	    	</div>
	    	<div class="calendar">
	    	
		    <div class="head">
	    		<div class="name">공지사항.</div>
	    		<a href="notice.jsp" class="material-symbols-outlined" id="add">add</a>
	    	</div>
				<div class="story">
    				<div class="storyhead storybox">
	    				<div>DATE</div>
	    				<div>SUBJECT</div>
	    				<div>COMNET</div>
    				</div>
    				<%
    					String calendar = "SELECT NUM, TO_CHAR(CREATEDATE,'YYYY-MM-DD') AS CREATEDATE, SUBJECT, CONTENT FROM ANNOUNCEMENT "
    									 +"ORDER BY CREATEDATE ASC";
    			
    					pstmt = conn.prepareStatement(calendar);
    					rs = pstmt.executeQuery();
    					for(int i=0; rs.next(); i++){
    						%>
    						<div class="storys storybox">
	    						<div><a href="noticeNote.jsp?num=<%=rs.getString("NUM")%>"><%=rs.getString("CREATEDATE")%></a></div>
	    						<div><a href="noticeNote.jsp?num=<%=rs.getString("NUM")%>"><%=rs.getString("SUBJECT")%></a></div>
	    						<div><a href="noticeNote.jsp?num=<%=rs.getString("NUM")%>"><%=rs.getString("CONTENT")%></a></div>
    						</div>
    						<%
    						if(i==5){
    							break;
    						}
    					}
    				%>
    			</div>
    		</div>
    	</div>
    	<div class="form2">
    		<div class="schedule">
    			<div class="head">
    				<div class="name">스케줄표.</div>
    				<a href="Calendar.jsp" class="material-symbols-outlined" id="add">add</a>
    			</div>
    			<div class="story">
    				<div class="storyhead storybox">	    				
	    				<div>DATE</div>
	    				<div>NAME</div>
	    				<div>SUBJECT</div>
	    				<div>COMNET</div>
    				</div>
    				<%
    					String schedule = "SELECT NUM,NAME, TO_CHAR(PRODUCTION_DATE,'YY-MM-DD') AS DA_TE, SUBJECT, CONTENT FROM CALENDAR "
    									 +"WHERE TO_DATE(TO_CHAR(PRODUCTION_DATE,'YYYY-MM-DD'),'YYYY-MM-DD') BETWEEN "
    									 +"TO_DATE('"+nowdate+"','YYYY-MM-DD') AND TO_DATE('"+nextdate+"','YYYY-MM-DD')"
    									 +"ORDER BY DA_TE";
    			
    					pstmt = conn.prepareStatement(schedule);
    					rs = pstmt.executeQuery();
    					for(int i=0; rs.next(); i++){
    						%>
    						<div class="storys storybox">
	    						<div><a href="calendarnote.jsp?NUM=<%=rs.getString("NUM")%>"><%=rs.getString("DA_TE")%></a></div>
	    						<div><a href="calendarnote.jsp?NUM=<%=rs.getString("NUM")%>"><%=rs.getString("NAME")%></a></div>
	    						<div><a href="calendarnote.jsp?NUM=<%=rs.getString("NUM")%>"><%=rs.getString("SUBJECT")%></a></div>
	    						<div><a href="calendarnote.jsp?NUM=<%=rs.getString("NUM")%>"><%=rs.getString("CONTENT")%></a></div>
    						</div>
    						<%
    						if(i==5){
    							break;
    						}
    					}
    				%>
    			</div>
    		</div>
    	</div>
    </div>
	</div>
</body>
</html>