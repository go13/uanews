<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" %>

<jsp:include page="header.jsp" />

<table style="margin-top: 20px">
	<tbody>
	<c:forEach var="post" items="${postList}" varStatus="loop">  
		<tr>
			<td style="text-align: right;">${loop.index + 1}.</td>
			<td><a data-id="${post.id}" class="votearrow floatleft"></a></td>
			<td>
				<a href="<c:out value="${post.link}"></c:out>">
					<c:out value="${post.title}"></c:out>
				</a>
				<div style="margin-left: 5px; font-size: 12; margin-top: 2px;">
					<c:out value="${post.likes}"></c:out> вподобали
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
			
			var clicked = [];			
			if(uacookies == null){
				clicked.push(data_id);				
				like(data_id);
				$.cookie("uacookies-09-04-14", JSON.stringify({ clicked: clicked}));
			}else{
				uacookies = JSON.parse(uacookies);
				clicked = uacookies.clicked;
				if(clicked.indexOf(data_id) < 0){
					clicked.push(data_id);
					like(data_id);					
					$.cookie("uacookies-09-04-14", JSON.stringify({ clicked: clicked}));
				}					
			}			
			$(el).css({'cursor':'default', 'opacity': '0.4'});		
		});
		
	});
	
});
</script>
	
<jsp:include page="bottom.jsp" />