$().ready(function(){
	$("#new_invitee").click(function() {
		var template = $("#template").clone();
		template.find("input").each(function(){
			$(this).val("")
		})
		$("#form_fields").append(template);
	});
});




