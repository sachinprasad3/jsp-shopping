<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dao.Dao,com.sub.category.Subcategory,java.util.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	int cat_id = Integer.parseInt(request.getParameter("cat_id"));
	//System.out.print(cat_id);
	Dao dao = new Dao();
	List<Subcategory> sublist=dao.getSubCategory(cat_id); 
	//System.out.println(list);
	request.setAttribute("sublist",sublist);
	
%>
	<option selected disabled value="">Choose...</option>
	<c:forEach items="${sublist}" var="u"> 
		<option value="${u.getId()}">${u.getTitle()}</option> 			
	</c:forEach>
</body>
</html>