$(".formUser").submit(function(){
	var data = $(this).serialize();
  	$.ajax({
    	data: data,
        method: "POST",
        url: "php/save_participant.php",
        success: function(data){
            alert("" + data);
            $(".formUser")[0].reset();
            grecaptcha.reset(); 
        }
	});
	return false;
});