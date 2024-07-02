 <%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>


<html>
<head>
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>상품 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상품을 삭제합니다!!") == true)
			location.href = "./deletePhone.jsp?id=" + id;
		else
			return;
	}
</script>

</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">상품 편집</h1>
        <p class="col-md-8 fs-4">PhoneEditing</p>      
      </div>
    </div>
    <%@ include file="dbconn.jsp" %>
     <div class="row align-items-md-stretch   text-center">
	<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from phone";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
      
	
	
     	<div class="col-md-4">
       		<div class="h-100 p-2 round-3">		
       		    <img src="./resources/images/<%=rs.getString("p_filename")%>" 
       		    style="width: 250; height:350" />	
       		    
				<p><h5><b><%=rs.getString("p_name")%></b></h5>
				<p><%=rs.getString("p_modelName")%>
				<br> <%=rs.getString("p_color")%> | <%=rs.getString("p_price")%>원
				<p> <%=rs.getString("p_company")%>
				<p><%=rs.getString("p_price")%>원
				<p><%
						if (edit.equals("update")) {
					%>
					<a href="./updatePhone.jsp?id=<%=rs.getString("p_id")%>" 
					class="btn btn-success" role="button"> 수정 &raquo;></a>
					
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" 
					class="btn btn-danger" role="button">삭제 &raquo;></a>
					<%
						}
					%>	
			</div>	
		</div>			
		<%
			}
			 
              if (rs != null)
                  rs.close();
              if (pstmt != null)
                  pstmt.close();
              if (conn != null)
                  conn.close();
		%>
	
		</div>	
		<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>
