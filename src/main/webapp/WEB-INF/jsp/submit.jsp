<%@page pageEncoding="UTF-8" %>

<jsp:include page="header.jsp" />

<form style="margin-top: 50px; margin-left: 50px" method="POST" action="submit.html">
	<table>
		<tbody>
			<tr>
				<td>Посилання:</td>
				<td><input class="submitinputclass" type="text" name="linkinput"></td>
			</tr>
			<tr>
				<td>Заголовок:</td>
				<td><input class="submitinputclass" type="text" name="titleinput"></td>
			</tr>			
		</tbody>
	</table>
	<input style="margin-top:20px" type="submit" value="Submit">	
</form>

<jsp:include page="bottom.jsp" />
