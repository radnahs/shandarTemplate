

//Modal Window to show data	
jQuery.fn.modalWindowPopUp=function(){
	 $("#modalWindow").dialog({
	     resizable: false,
	     height:550,       
	     width:440, 
	     modal: true,	     
	     title:"Whats your decision?",	     
	     buttons: {	    	 	 
	         "Yes": function() {
	             $( this ).dialog( "close" );
	             $("#shanForm").submit();
	         },
	         "No": function() {
	             $( this ).dialog( "close" );
	             
	         }
	     },	 	
	 	open: function() {
	 		$('.ui-dialog-titlebar').css('backgroundColor', 'grey');
	 		$('.ui-dialog-title').css('color', 'yellow');
	 		
	        $('.ui-dialog-buttonpane').find('button:contains("Yes")').css('color', 'black');
	        $('.ui-dialog-buttonpane').find('button:contains("Yes")').css('border', '1px solid black');
	        
	        $('.ui-dialog-buttonpane').find('button:contains("No")').css('color', 'black');	        
	        $('.ui-dialog-buttonpane').find('button:contains("No")').css('border', '1px solid black');
	    }
	});	  
	 
 }

$( "#emailAnchor" ).click(function() {
    $(this).modalWindowPopUp();
});