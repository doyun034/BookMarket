<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");


	String filename = "";


	String realFolder = "C:\\Coding\\Programs\\eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\PhoneMarket000\\resources\\images";
	String encType = "utf-8";
	int maxSize = 5 * 1024 * 1024;
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	
	
	String phoneId = multi.getParameter("phoneId");
	String phoneName = multi.getParameter("phoneName");
	String productPrice = multi.getParameter("productPrice");
	String phoneColor = multi.getParameter("phoneColor");
	String modelCategory = multi.getParameter("modelCategory");
	String modelName = multi.getParameter("modelName");
	String releaseDate = multi.getParameter("releaseDate");	
	String company = multi.getParameter("company");
	String availableStock = multi.getParameter("availableStock");
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	int price;

	if (productPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(productPrice);

	long stock;

	if (availableStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(availableStock);
	
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from phone where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, phoneId);
	rs = pstmt.executeQuery();	
	
	
	if (rs.next()) {		
		if (fileName != null) {
			sql = "UPDATE phone SET p_name=?, p_price=?, p_color=?, p_category=?, p_modelName=?, p_company=?, p_stock=?, p_releaseDate=?, p_fileName=? WHERE p_id=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phoneName);
			pstmt.setInt(2, price);
			pstmt.setString(3, phoneColor);
			pstmt.setString(4, modelCategory);
			pstmt.setString(5, modelName);
			pstmt.setString(6, company);
			pstmt.setLong(7, stock);
			pstmt.setString(8, releaseDate);			
			pstmt.setString(9, fileName);	
			pstmt.setString(10, phoneId);	
			pstmt.executeUpdate();
			
					
		} else {
			sql = "UPDATE phone SET p_name=?, p_price=?, p_color=?, p_category=?, p_modelName=?, p_company=?, p_stock=?, p_releaseDate=?, p_fileName=? WHERE p_id=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phoneName);
			pstmt.setInt(2, price);
			pstmt.setString(3, phoneColor);
			pstmt.setString(4, modelCategory);
			pstmt.setString(5, modelName);
			pstmt.setString(6, company);
			pstmt.setLong(7, stock);
			pstmt.setString(8, releaseDate);			
			pstmt.setString(9, fileName);	
			pstmt.setString(10, phoneId);	
			pstmt.executeUpdate();
		}		
	}
	

	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	

	response.sendRedirect("editPhone.jsp?edit=update");

%>
