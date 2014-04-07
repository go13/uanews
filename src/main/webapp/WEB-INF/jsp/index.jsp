<%@page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.uanews.NewsPost" %>

<jsp:include page="header.jsp" />

<table style="margin-top: 20px">
	<tbody>
<%
	List<NewsPost> list = (List<NewsPost>)request.getAttribute("postList");
	for(int i = 0; i < list.size(); i++){
%>
		<tr>
			<td style="text-align: right;"><%=(i+1) %>.</td>
			<td><div class="votearrow floatleft"></div></td>
			<td><a href="<%=list.get(i).getLink() %>"><%=list.get(i).getTitle() %></a></td>
		</tr>			
<% } %>

	</tbody>
</table>
	
<jsp:include page="bottom.jsp" />