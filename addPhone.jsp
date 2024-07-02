<%@ page contentType="text/html; charset=utf-8" pageEncoding= "UTF-8"%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
 <script type= "text/javascript" src="./resources/js/validation.js"></script>
<title>상품 등록</title>
</head>
<body>
<fmt:setLocale value='<%=request.getParameter("language") %>' />
<fmt:bundle basename = "bundle.message">
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold"><fmt:message key = "title"/></h1>
        <p class="col-md-8 fs-4">Product Add</p>      
      </div>
    </div>
  
	 <div class="row align-items-md-stretch">
	 	<div class = "text-end">
	 		<a href="?language=ko">Korean</a> | <a href = "?language=en">English</a>
	 		<a href= "logout.jsp" class="btn btn-sm btn-success pull right">
	 		logout</a>
	 	</div> 	
		<form name="newPhone" action="./processAddPhone.jsp" method="post" enctype ="multipart/form-data">		
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key ="phoneId"/></label>
				<div class="col-sm-3">
					<input type="text" id="phoneId" name="phoneId" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "phoneName"/></label>
				<div class="col-sm-3">
					<input type="text" id="phoneName" name="phoneName" class="form-control" >
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "productPrice"/></label>
				<div class="col-sm-3">
					<input type="text" id="productPrice" name="productPrice" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "phoneColor"/></label>
				<div class="col-sm-3">
					<input type="text" name="phoneColor" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "company"/></label>
				<div class="col-sm-3">
					<input type="text" name="company" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "releaseDate"/></label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" class="form-control">
				</div>
			</div>
	
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "modelName"/></label>
				<div class="col-sm-3">
					<input type="text" name="modelName" class="form-control">
				</div>
			</div>			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "modelCategory"/></label>
				<div class="col-sm-3">
					<input type="text" name="modelCategory" class="form-control" >
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "availableStock"/></label>
				<div class="col-sm-3">
					<input type="text" name="availableStock" id="availableStock" class="form-control" >
				</div>
			</div>	
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "phoneImage"/></label>
				<div class="col-sm-5">
					<input type="file" name="phoneImage" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" class="btn btn-primary" value="<fmt:message key = "button"/>" onclick="CheckAddPhone()">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
	</div>
	</fmt:bundle>
</body>
</html>
