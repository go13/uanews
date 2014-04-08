<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" %>

<jsp:include page="header.jsp" />

<table style="margin-top: 20px">
	<tbody>
	<c:forEach var="post" items="${postList}" varStatus="loop">  
		<tr>
			<td style="text-align: right;">${loop.index + 1}.</td>
			<td><div class="votearrow floatleft"></div></td>
			<td>
				<a href="<c:out value="${post.link}"></c:out>">
					<c:out value="${post.title}"></c:out>
				</a>
			</td>			
		</tr>	
	</c:forEach>  		
	</tbody>
</table>
	
<jsp:include page="bottom.jsp" />