<%@ page import="com.item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%

	//Insert item----------------------------------
	if (request.getParameter("itemCode") != null) {
		item itemObj = new item();
		String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
											request.getParameter("itemName"),
											request.getParameter("itemPrice"), 
											request.getParameter("itemDesc"));
		
		session.setAttribute("statusMsg", stsMsg);
	}
	
	//Delete item----------------------------------
	if (request.getParameter("itemID") != null) {
		item itemObj = new item();
		String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
		session.setAttribute("statusMsg", stsMsg);
	}
	
	//Update item----------------------------------
	if (request.getParameter("itemID") != null) {
		item itemObj = new item();
		String stsMsg = itemObj.updateItem(request.getParameter("itemID"), request.getParameter("itemName"));
		session.setAttribute("statusMsg", stsMsg);
	}

%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>

<body>
	<h1>Items Management</h1>
	
	<form method="post" action="items.jsp">
		Item code: <input name="itemCode" type="text"> <br> 
		Item name: <input name="itemName" type="text"> <br>
		Item price:	<input name="itemPrice" type="text"> <br>
		Item description: <input name="itemDesc" type="text"> <br><br>
		<input name="btnSubmit" type="submit" value="Save">
	</form>
	
	<br>
	
	<%
		out.print(session.getAttribute("statusMsg"));
	%>
	
	<br><br>
	
	<%
		item itemObj = new item();
		out.print(itemObj.readItems());
	%>
	
</body>
</html>