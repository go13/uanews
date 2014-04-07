<%@page pageEncoding="UTF-8" %>

<jsp:include page="header.jsp" />

<form method="POST" action="submit.html">
	Посилання: 
	<input id="linkinputclass" type="text" name="linkinput"><br>
	Назва: 
	<textarea id="titleinputclass" rows="10" cols="60"></textarea>
	<input type="submit" value="Submit">
</form>

<jsp:include page="bottom.jsp" />
