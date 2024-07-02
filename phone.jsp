<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="exceptionNoPhoneId.jsp" %>
<%@ page import="java.sql.*" %>

<html>
<head>
 <link href = "./resources/css/bootstrap.min.css" rel="stylesheet">

<title>도서 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
	</script>
	
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">상품 정보</h1>
        <p class="col-md-8 fs-4">PhoneInfo</p>      
      </div>
    </div>
    <%@ include file="dbconn.jsp" %>
    <%
        String phoneId = request.getParameter("id");
        if (phoneId == null || phoneId.isEmpty()) {
            throw new Exception();
        }

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM phone WHERE p_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, phoneId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
    %>
			
	 <div class="row align-items-md-stretch">	 	
	 		<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("p_filename")%>" style="width: 70%">
			</div>
			<div class="col-md-6">
				<h3><b><%=rs.getString("p_name")%></b></h3>
				<p><b>상품 등록코드 : </b><span class="badge text-bg-danger">
					 <%=rs.getString("p_id")%></span>							
				<p><b>상품 색상</b> : <%=rs.getString("p_color")%>	
				<p><b>제조사</b> : <%=rs.getString("p_company")%>	
				<p><b>출시일</b> : <%=rs.getString("p_releaseDate")%>					
				<p><b>시리즈</b> : <%=rs.getString("p_category")%>
				<p><b>재고수</b> : <%=rs.getString("p_stock")%>
				<h4><%=rs.getString("p_price")%>원</h4>
				<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="post"><a href="#" class="btn btn-info" onclick="addToCart()"> 상품주문 &raquo;</a> 
					<a href="./phones.jsp" class="btn btn-secondary"> 상품목록 &raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>	
			</div>
		</div>
    <%
            } else {
                throw new Exception();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>
