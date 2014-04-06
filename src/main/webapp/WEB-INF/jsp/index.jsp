
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.uanews.NewsPost" %>

<html>
<title>
UA news
</title>
<style>
.postclass {
	list-style-type: none;
}
.votearrow {
	width: 10px;
	height: 10px;
	border: 0px;
	margin: 3px 2px 6px;
	background: url('images/grayarrow.gif') no-repeat;
}
.overflowright {
	float: left;
}
</style>
<body>
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
</body>
</html>