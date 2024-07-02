<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ include file="dbconn.jsp"%>
<%
request.setCharacterEncoding("UTF-8");


	String filename = "";

	
	String realFolder = "C:\\Coding\\Programs\\eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\PhoneMarket000\\resources\\images";
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	String encType = "utf-8"; //인코딩 타입
	

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
	
	String sql = "insert into phone values(?,?,?,?,?,?,?,?,?,?)";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, phoneId);
	pstmt.setString(2, phoneName);
	pstmt.setInt(3, price);
	pstmt.setString(4, phoneColor);
	pstmt.setString(5, modelCategory);
	pstmt.setString(6, modelName);
	pstmt.setString(7, company);
	pstmt.setLong(8, stock);
	pstmt.setString(9, releaseDate);	
	pstmt.setString(10, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();

	response.sendRedirect("phones.jsp");
%>
