function focusFirst(field_name, field_value, id)
{
	if(id == 0)
	{
		if($('#'+field_name))
		{	
			$('#'+field_name).focus();
		}
	}
}
function errMsgDesign(msg)
{
	var data = '<div class="ui-widget">'+
				'<div class="ui-state-error ui-corner-all">'+ 
					'<p><span class="ui-icon ui-icon-alert"></span>'+
					msg+
					'</p>'+
				'</div>'+
			'</div>';
	return data;
}

function succMsgDesign(msg)
{
	var data = '<div class="ui-widget">'+
				'<div class="ui-state-success ui-corner-all">'+ 
					'<p><span class="ui-icon ui-icon-check"></span>'+
					msg+
					'</p>'+
				'</div>'+
			'</div>';
	return data;
}