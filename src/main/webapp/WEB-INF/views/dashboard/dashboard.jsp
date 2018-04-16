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
	width: 400px;
	float: left;
	padding-bottom: 100px;
}

.portlet {
	border: 1px dotted black;
	margin: 1em 1em 1em 1em;
}

.portlet-header {
	margin: 0.3em;
	padding-bottom: 4px;
	padding-left: 0.2em;
	font-weight: bold;
	/* background-color: #007eb6; */
	color: black;
	/* border-bottom-color: black; */
	border-bottom: 1px dotted black;
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

	<div class="column">

		<div class="portlet">
			<div class="portlet-header">
				
			</div>
			<div class="portlet-content">
				<div id="facebookDiv">
					
				</div>
			</div>
			<div class="portlet-content">
				<input >
			</div>
		</div>

		<div class="portlet">
			<div class="portlet-header">
				
			</div>
			<div class="portlet-content">
				<div id="linkedinDiv">
					
				</div>
			</div>
		</div>
	</div>

	<div class="column">
		<div class="portlet">
			<div class="portlet-header">
				
			</div>
			<div class="portlet-content">
				
			</div>
		</div>

		<div class="portlet">
			<div class="portlet-header">
				
			</div>
			<div class="portlet-content">
				<div id="appointmentDiv"></div>
			</div>
		</div>
		
		<div class="portlet">
			<div class="portlet-header">
				
			</div>
			<div class="portlet-content">
				<div id="appointmentDiv">
				</div>
			</div>
		</div>
	</div>

	<div class="column">
		<div class="portlet">
			<div class="portlet-header">
				<a href="https://timesofindia.indiatimes.com/" target="_blank"><img
					src="resources/icons/toi.png" /></a> <span>Times of India</span>
			</div>
			<div class="portlet-content">
				<div id="toiContentDiv">
					<table border="0">
						<c:forEach var="toiData" items="${toiDataList}">
							<tr>
								<td><a href="#" id="${toiData.title}"
									title="${toiData.title}"> <img
										src="resources/icons/bullet.png" /> <c:out
											value="${toiData.title}" /> <%-- <c:out value="${toiData.newsDescription}" /> --%>
										<br />
								</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>

		<div class="portlet">
			<div class="portlet-header">
				<a href="http://www.bbc.com/news" target="_blank"><img
					src="resources/icons/bbc.png" /></a> <span>BBC News</span>
			</div>
			<div class="portlet-content">
				<div id="bbcContentDiv">
					<table border="0">
						<c:forEach var="bbcData" items="${bbcDataList}">
							<tr>
								<td><a href="#" id="${bbcData.title}"
									title="${bbcData.title}"> <img
										src="resources/icons/bullet.png" /> <c:out
											value="${bbcData.title}" /> <%-- <c:out value="${toiData.newsDescription}" /> --%>
										<br />
								</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div id="modalWindow">
		<p id="paraBodyEmail"></p>
	</div>
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

	//Calendar
	$(function() {
		$("#datepicker").datepicker({
			showOn : "div",
			divImage : "resources/icons/msicon.jpg",
			divImageOnly : true
		});
	});

	//Modal Window to show data	
	jQuery.fn.modalWindowPopUp = function(modalWindow, titleText) {
		$(modalWindow)
				.dialog(
						{
							resizable : false,
							height : 550,
							width : 440,
							modal : true,
							title : titleText,
							buttons : {
								"close" : function() {
									$(this).dialog("close");
								}
							},
							open : function() {
								$('.ui-dialog-titlebar').css('backgroundColor',
										'grey');
								$('.ui-dialog-title').css('color', 'yellow');

								$('.ui-dialog-body').css('color', 'yellow');

								$('.ui-dialog-buttonpane').find(
										'button:contains("close")').css(
										'color', 'black');
								$('.ui-dialog-buttonpane').find(
										'button:contains("close")').css(
										'border', '1px solid black');
							}
						});
	}

	$("#facebookDiv a").click(function() {
		var subject = $(this).attr('title');
		var userId = $(this).attr('id');
		alert(userId);
		$.ajax({
			type : "POST",
			url : "FacebookFeed.html",
			data : "userId=" + userId,
			dataType : "HTML",
			success : function(result) {
				$("#paraBodyEmail").html(result);
			}
		});
		$(this).modalWindowPopUp("#modalWindow", subject);
	});

	$("#linkedinDiv a").click(function() {
		var subject = $(this).attr('title');
		var userId = $(this).attr('id');
		$.ajax({
			type : "POST",
			url : "LinkedinFeed.html",
			data : "userId=" + userId,
			dataType : "HTML",
			success : function(result) {
				$("#paraBodyEmail").html(result);
			}
		});
		$(this).modalWindowPopUp("#modalWindow", subject);
	});
	
	$("#amazonContentDiv a").click(function() {
		var subject = $(this).attr('title');
		var userId = $(this).attr('id');
		$.ajax({
			type : "POST",
			url : "AmazonFeed.html",
			data : "consumerId=" + userId,
			dataType : "HTML",
			success : function(result) {
				$("#paraBodyEmail").html(result);
			}
		});
		$(this).modalWindowPopUp("#modalWindow", subject);
	});

	$("#toiContentDiv a").click(function() {
		var subject = $(this).attr('title');
		var userId = $(this).attr('id');
		$.ajax({
			type : "POST",
			url : "TOIFeed.html",
			data : "titleAsId=" + userId,
			dataType : "HTML",
			success : function(result) {
				$("#paraBodyEmail").html(result);
			}
		});
		$(this).modalWindowPopUp("#modalWindow", subject);
	});

	$("#bbcContentDiv a").click(function() {
		var subject = $(this).attr('title');
		var userId = $(this).attr('id');
		$.ajax({
			type : "POST",
			url : "BBCFeed.html",
			data : "titleAsId=" + userId,
			dataType : "HTML",
			success : function(result) {
				$("#paraBodyEmail").html(result);
			}
		});
		$(this).modalWindowPopUp("#modalWindow", subject);
	});

</script>
</html>