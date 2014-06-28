<%@page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp" />
<form style="margin-top: 50px; margin-left: 50px" method="POST" action="submit.html" accept-charset="utf-8">
	<table>
		<tbody>
			<c:if test="${validation == 'linkError'}">
			<tr>
				<td></td>
				<td><div class="submitinputclass" style="color: red">Введене посилання некоректне</div></td>
			</tr>
			</c:if>
			<tr>
				<td>Посилання:</td>
				<td><input class="submitinputclass" type="text" name="link"></td>
			</tr>
			<tr>
				<td>Заголовок:</td>
				<td><input class="submitinputclass" type="text" name="title"></td>
			</tr>
		</tbody>
	</table>
	<input style="margin-top:20px" type="submit" value="Надіслати">	
</form>

<jsp:include page="bottom.jsp" />
