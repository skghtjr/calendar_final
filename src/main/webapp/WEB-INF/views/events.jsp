<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request"/>
<html>
<head>
	<title>myCalendar: <c:out value="${pageTitle}"/> </title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <c:url var="resourceUrl" value="/resources"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css" rel="stylesheet"/>
    <link href="${resourceUrl}/css/custom.css" rel="stylesheet"/>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body class="header">
	<div class="container">
	<jsp:include page="./includes/header.jsp"/>
	
	<sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
	<br>
	
	<table border="1">
	<tr>
	<td colspan="9" align="center">Event</td>
	</tr>
	<tr>
	<td align="center">num</td>
	<td align="center">id</td>
	<td align="center">when</td>
	<td align="center">summary</td>
	<td align="center">description</td>
	<td align="center">owner</td>
	<td align="center">num_like</td>
	<td align="center">event_level</td>
	<td align="center">attendee</td>
	</tr>
	
	
	<c:forEach var="event" items="${events}" varStatus="status">
	<tr>
	<td align="center" class="listtd"><c:out value="${status.count}"/></td>
	<td align="center" class="listtd"><c:out  value="${event.id}"/></td>
	<td align="left" class="listtd"><c:out value="${event.when.getTime()}"/> </td>
	<td align="center" class="listtd"><c:out value="${event.summary}"/> </td>
	<td align="center" class="listtd"><c:out value="${event.description}"/> </td>
	<td align="center" class="listtd"><c:out value="${event.owner.id}"/> </td>
	<td align="center" class="listtd"><c:out value="${event.numLikes}"/> </td>
	<td align="center" class="listtd"><c:out value="${event.eventLevel}"/> </td>
	<td align="center" class="listtd"><c:if test="${msg}"> nothing </c:if></td>
	</tr>
	</c:forEach>
	</table>
	
	<Br>
	
	<table border="1">
	<tr>
	<td colspan="4" align="center">EventAttendee</td>
	</tr>
	<tr>
	<td align="center">num</td>
	<td align="center">id</td>
	<td align="center">event_id</td>
	<td align="center">attendee_id</td>
	</tr>
	<c:forEach var="attendee" items="${attendees}" varStatus="status">
	<tr>
	<td align="center" class="listtd"><c:out value="${status.count}"/></td>
	<td align="center" class="listtd"><c:out  value="${attendee.id}"/></td>
	<td align="center" class="listtd"><c:out  value="${attendee.event.id}"/></td>
	<td align="center" class="listtd"><c:out  value="${attendee.attendee.id}"/></td>
	</tr>
	</c:forEach>
	</table>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
		<!-- For login user -->
		<form id="logoutForm" action=<c:url value='/j_spring_security_logout' /> method="post">
		</form>
 
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				User : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Logout</a>
			</h2>
		</c:if>
	</sec:authorize>
	
	<script>
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
	</script>		
	
	
	</div>

</body>
</html>
