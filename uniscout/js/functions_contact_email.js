$(".formContact").submit(function(){
	var data = $(this).serialize();
  	$.ajax({
    	data: data,
        method: "POST",
        url: "php/email_contact.php",
        success: function(data){
            alert(data);
            $(".formContact")[0].reset();
            grecaptcha.reset(); 
        }
	});
	return false;
});