<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<html>
<head>
<title>ShandarTemplate</title>
<link rel="stylesheet"
	href="resources/js/jqry/jquery-ui-1.9.1.custom.min.css">
<script type="text/javascript"
	src="resources/js/jqry/jquery-1.8.2.min.js"></script>
<script type="text/javascript"
	src="resources/js/jqry/jquery-ui-1.9.1.custom.min.js"></script>
<style>
.column {
	width: 370px;
	float: left;
	padding-bottom: 100px;
}

.portlet {
	margin: 0 1em 1em 0;
}

.portlet-header {
	margin: 0.3em;
	padding-bottom: 4px;
	padding-left: 0.2em;
	font-weight: bold;
}

.portlet-header .ui-icon {
	float: right;
}

.portlet-content {
	padding: 0.4em;
}

.ui-sortable-placeholder {
	border: 1px dotted black;
	visibility: visible !important;
	height: 50px !important;
}

.ui-sortable-placeholder * {
	visibility: hidden;
}

#modalWindow {
	display: none;
}
</style>

</head>
<body>
	<div id="mainDiv">
			
	</div>

	<div id="modalWindowOnLoad">
		<!-- http://mrbool.com/how-to-create-a-login-application-using-spring-mvc-in-java/27113 -->
		<!-- http://fruzenshtein.com/spring-mvc-ajax-jquery/ -->
		${serverTime} <br />
		<form:form action="Login.html" method="post" id="shandarTemplateLogin" commandName="user">
			<table>
				<tr>
					<td>UserName:-<FONT color="red"><form:errors path="userName" /></FONT></td>
					<td><form:input path="userName" /></td>
				</tr>
				<tr>
					<td>Password:-<FONT color="red"><form:errors path="userPassword" /></FONT></td>
					<td><form:input type="password" path="userPassword" /></td>
				</tr>
			</table>
		</form:form>
	</div>
	<div></div>

</body>

<script>
	//portlet code
	$(function() {
		$(".column").sortable({
			connectWith : ".column"
		});

		$(".portlet").addClass(
				"ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
				.find(".portlet-header").addClass(" ui-corner-all").prepend(
						"<span class='ui-icon ui-icon-minusthick'></span>")
				.end().find(".portlet-content");

		$(".portlet-header .ui-icon").click(
				function() {
					$(this).toggleClass("ui-icon-minusthick").toggleClass(
							"ui-icon-plusthick");
					$(this).parents(".portlet:first").find(".portlet-content")
							.toggle();
				});

		$(".column").disableSelection();
	});

	//Modal window for login
	jQuery.fn.loginModalWindowPopUp = function(modalWindow, titleText) {
		$(modalWindow)
				.dialog(
						{
							resizable : false,
							height : 550,
							width : 440,
							modal : true,
							title : titleText,
							buttons : {
								"submit" : function() {
									$("#shandarTemplateLogin").submit();

								}
							},
							open : function() {
								$('.ui-dialog-titlebar').css('backgroundColor',	'grey');
								$('.ui-dialog-title').css('color', 'yellow');

								$('.ui-dialog-body').css('color', 'yellow');

								$('.ui-dialog-buttonpane').find(
										'button:contains("close")').css('color', 'black');
								$('.ui-dialog-buttonpane').find('button:contains("close")').css('border', '1px solid black');
							}
						});

	}

	//http://forum.jquery.com/topic/document-ready-and-window-onload-difference
	$(document).ready(function() {

		//$("#mainDiv").hide();  
		$(this).loginModalWindowPopUp("#modalWindowOnLoad", "Login");
	});
	
</script>
</html>