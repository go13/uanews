<%@page pageEncoding="UTF-8" %>
<html>
	<title>
	UA news
	</title>
	<style>
		.postclass {
			list-style-type: none;
			margin-top: 15px
		}
		.votearrow {
			width: 23px;
			height: 20px;
			border: 0px;
			cursor: pointer;
			background: url('images/grayarrow.png') no-repeat;
		}
		.floatright {
			float: right;
		}
		.floatleft {
			float: left;
		}
		.submitinputclass {
			margin-left: 40px;
			width: 400px;
		}
		#menuclass-header {
			height: 23px;
			background-color: red;
			padding-top: 2px;
		}
		#menuclass-bottom {
			height: 2px;
			background-color: red;
			margin-top: 20px;
			margin-bottom: 50px;
		}
		#menuclass > a {
			text-decoration: initial;
		}
		#linkinputclass {
			width: 350px;
		}
		#titleinputclass {
		}
		.container {
			margin: auto; 
			margin-top: 10px;
			margin-bottom: 10px; 
			width: 85%; 
			background-color: rgb(246, 246, 239);
			padding-bottom: 25px;
		}
		a{
			color: black;
			text-decoration: initial;
		}
	</style>	
<body>
	<div class="container">
		<div id="menuclass-header">
			<a style="margin-left: 20px;" href=".">Новини</a> <a style="margin-left: 60px;" href="submit.html">Додати</a>
		</div>		