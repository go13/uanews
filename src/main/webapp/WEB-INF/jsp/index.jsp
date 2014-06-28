<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8" %>

<jsp:include page="header.jsp" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>


<table style="margin-top: 7px">
	<tbody>
	<c:forEach var="post" items="${postList}" varStatus="loop">  
		<tr>
			<td style="text-align: right; color: gray;">${loop.index + 1}.</td>
			<td><a data-id="${post.id}" class="votearrow floatleft"></a></td>
			<td>
				<a href="<c:out value="${post.link}"></c:out>">
					<c:out value="${post.title}"></c:out>
				</a>
				<div style="margin-left: 5px; font-size: 12; margin-top: 2px;">
					<label id="like-${post.id}">${post.likes}</label> вподобали  |  
					<fmt:formatDate type="both" pattern="HH:mm dd.MM.yy" value="${post.created}"/>
				</div>
			</td>
		</tr>	
	</c:forEach>  		
	</tbody>
</table>

<script type="text/javascript">
function like(id){	
	$.ajax({
		  type: "POST",
		  url: "like/" + id + ".do",
		  data: { }
		});
}
$(document).ready(function(){
	
	$(".votearrow").each(function(){		

		var el = this;

		var data_id = parseInt( $(el).attr("data-id") );
		var uacookies = $.cookie("uacookies-09-04-14");

		if(uacookies != null){
			uacookies = JSON.parse(uacookies);
			var clicked = uacookies.clicked;
			if(clicked.indexOf(data_id) >= 0){
				$(el).css({'cursor':'default', 'opacity': '0.4'});
			}
		}
		
		$(el).click(function(){
			var data_id = parseInt( $(el).attr("data-id") );

			var uacookies = $.cookie("uacookies-09-04-14");
			var likes = 1 + parseInt($("#like-" + data_id).html());

			var clicked = [];			
			if(uacookies == null){
				clicked.push(data_id);				
				like(data_id);
				$("#like-" + data_id).html("" + likes);	
				$.cookie("uacookies-09-04-14", JSON.stringify({ clicked: clicked}));
			}else{
				uacookies = JSON.parse(uacookies);
				clicked = uacookies.clicked;
				if(clicked.indexOf(data_id) < 0){
					clicked.push(data_id);
					like(data_id);
					$("#like-" + data_id).html("" + likes);
					$.cookie("uacookies-09-04-14", JSON.stringify({ clicked: clicked}));
				}					
			}			
			$(el).css({'cursor':'default', 'opacity': '0.4'});		
		});
		
	});
	
});
</script>
	
<jsp:include page="bottom.jsp" />