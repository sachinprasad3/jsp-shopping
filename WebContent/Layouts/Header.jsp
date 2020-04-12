<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.dao.Dao,java.util.*"%>
<%@page import="com.dao.Dao,com.category.Category,java.util.*"%>

<%
String uemail = (String)request.getSession(false).getAttribute("useremail");
Dao dao2 = new Dao();

int numRows = dao2.getNumberOfCardItems(uemail);
HttpSession se = request.getSession();
se.setAttribute("itemCount", numRows);

//System.out.print("items="+numRows);

%>

<%  

Dao dao3 = new Dao();
List<Category> catlist=dao3.getCategory(); 
request.setAttribute("catlist",catlist);

%>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand ml-5" href="index.jsp">Shoppy</a>
  
  <form class="form-inline my-2 my-lg-0" action="Search" method="get">
  		<div class="form-group">
			<select class="custom-select" id="validationCustom04" required name="cat">
			
				<c:set var="all" value="all"/>			
				<option value="all" >All</option>			
				<c:forEach items="${catlist}" var="u"> 
				<option value="${u.getId()}" ${u.getId() == sessionScope.sessionCat ? 'selected="selected"' : ''}>${u.getCategory()}</option> 			
				</c:forEach>
			</select>
		</div>
      <input class="form-control mr-sm-2" type="text" name="query" size="50" value="<c:out value="${sessionScope.searchQuery}"/>" placeholder="search product">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  

  <div class="collapse navbar-collapse" id="navbarSupportedContent">

		<ul class="navbar-nav ml-auto mr-5">
		
		<c:if test="${sessionScope.useremail != null}"> 
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <c:out value="${sessionScope.userName}" />
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="Logout">logout</a>
	          <a class="dropdown-item" href="orders.jsp">My orders</a>
	        </div>
	      </li>  
		</c:if>
		
			<c:if test="${sessionScope.useremail == null}">
				<li class="nav-item mr-auto">
			        <a class="btn btn-secondary" href="login.jsp">login</a>
			      </li>
			</c:if>
			
			<li class="nav-item">
	        	<a class="nav-link " href="ViewCart.jsp" tabindex="-1" >Cart(<c:out value="${sessionScope.itemCount}"/>)</a>
	      	</li>
   		</ul>
    
  
  </div>
</nav>