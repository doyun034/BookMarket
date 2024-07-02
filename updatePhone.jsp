<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />

<title>상품 수정</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">상품 수정</h1>
        <p class="col-md-8 fs-4">Product Updating</p>      
      </div>
    </div>
  <%@ include file="dbconn.jsp"%>
  <%
		String phoneId = request.getParameter("id");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from phone where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phoneId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>		
	 <div class="row align-items-md-stretch">	  	
		
		<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("p_filename")%>" alt="image" style="width: 100%" />
			</div>
		<div class="col-md-7">	
		<form name="newPhone" action="./processUpdatePhone.jsp" method="post" enctype ="multipart/form-data">
		
			
			<div class="mb-3 row">
				<label class="col-sm-2">상품코드</label>
				<div class="col-sm-5">
					<input type="text" name="PhoneId" id="PhoneId" class="form-control" value='<%=rs.getString("p_id")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-5">
					<input type="text" name="PhoneName" id="PhoneName" class="form-control" value='<%=rs.getString("p_name")%>'>
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-5">
					<input type="text" name="productPrice"  id="productPrice" class="form-control" value='<%=rs.getString("p_price")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">색상</label>
				<div class="col-sm-5">
					<input type="text" name="phoneColor" class="form-control" value='<%=rs.getString("p_color")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-5">
					<input type="text" name="company" class="form-control" value='<%=rs.getString("p_company")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">출시일</label>
				<div class="col-sm-5">
					<input type="text" name="ReleaseDate" class="form-control" value='<%=rs.getString("p_releaseDate")%>'>
				</div>
			</div>
	
			<div class="mb-3 row">
				<label class="col-sm-2">품번</label>
				<div class="col-sm-5">
					<input type="text" name="modelName" class="form-control" value='<%=rs.getString("p_modelName")%>'>
				</div>
			</div>
					
			<div class="mb-3 row">
				<label class="col-sm-2">모델 시리즈</label>
				<div class="col-sm-5">
					<input type="text" name="modelCategory" class="form-control" value='<%=rs.getString("p_category")%>'>
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">재고수</label>
				<div class="col-sm-5">
					<input type="text" name="availableStock" id="availableStock"class="form-control" value='<%=rs.getString("p_stock")%>'>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-8">
					<input type="file" name="phoneImage" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록 " >
				</div>
			</div>
		</form>
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
	<jsp:include page="footer.jsp" />
</div>	

</body>
</html>
