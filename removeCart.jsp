<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Phone"%>
<%@ page import="dao.PhoneRepository"%>
<%
String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("phones.jsp");
		return;
	}

	PhoneRepository dao = PhoneRepository.getInstance();
	
	Phone book = dao.getPhoneById(id);
	if (book == null) {
		response.sendRedirect("exceptionNoPhoneId.jsp");
	}

	ArrayList<Phone> cartList = (ArrayList<Phone>) session.getAttribute("cartlist");
	Phone goodsQnt = new Phone();
	for (int i = 0; i < cartList.size(); i++) {
		goodsQnt = cartList.get(i);
		if (goodsQnt.getPhoneId().equals(id)) {
	cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
