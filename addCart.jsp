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

	Phone product = dao.getPhoneById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoPhoneId.jsp");
	}

	ArrayList<Phone> goodsList = dao.getAllPhones();
	Phone goods = new Phone();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getPhoneId().equals(id)) { 			
	break;
		}
	}
	
	ArrayList<Phone> list = (ArrayList<Phone>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<Phone>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Phone goodsQnt = new Phone();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getPhoneId().equals(id)) {
	cnt++;
	int orderQuantity = goodsQnt.getQuantity() + 1;
	goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("phone.jsp?id=" + id);
%>