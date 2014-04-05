
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.uanews.NewsLink" %>

<html>
<title>
UA news
</title>
<style>
.link-class{
	list-style-type: none;
}
</style>
<body>
<ul>
<% 
	List<NewsLink> list = (List<NewsLink>)request.getAttribute("linkList");
	for(int i = 0; i < list.size(); i++){
%>
	<li class="link-class">
		<a href="<%=list.get(i).getLink() %>"><%=list.get(i).getTitle() %></a>
	</li>
<% } %>
</ul>
</body>
</html>