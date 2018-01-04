$(".formUser").submit(function(){
	var data = $(this).serialize();
  	$.ajax({
    	data: data,
        method: "POST",
        url: "php/save_participant.php",
        success: function(data){
            alert("User insertion process: " + data);
        }
	});
	return false;
});