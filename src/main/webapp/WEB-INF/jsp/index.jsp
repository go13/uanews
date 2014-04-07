<%@page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.uanews.NewsPost" %>

<jsp:include page="header.jsp" />

<ul>
<%
	List<NewsPost> list = (List<NewsPost>)request.getAttribute("postList");
	for(int i = 0; i < list.size(); i++){
%>
	<li class="postclass">
		<div class="overflowright"><%=(i+1) %>. </div>
		<div class="votearrow overflowright"></div>
		<a href="<%=list.get(i).getLink() %>"><%=list.get(i).getTitle() %></a>
	</li>
<% } %>
</ul>

<jsp:include page="bottom.jsp" />