/********************************************FOR DYNAMIC FORM START*************************************************/
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

function openFirstErrTab(key_arr, tab_id, content_id_prefix)
{
	var err_id = '';
	var sel = null;
	var getTab = false;
	
	for(var i = 1; i <= $('#'+tab_id).children('ul:first').children('li').length ; i++)
	{				
		for(var j= 0; j < key_arr.length; j++)
		{	
			err_id = '#'+key_arr[j].key+'_err';	
			if($('#'+content_id_prefix+i+':has('+err_id+')').html())
			{
				sel = (i - 1);				
				$("#"+tab_id).tabs({ active: sel }).find(".ui-tabs-nav").sortable({axis:'xy'});	
				if($('#'+key_arr[j].key)[0])
				{	
					$('#'+key_arr[j].key)[0].focus();
				}
				else
				{
					$('#'+key_arr[j].key).focus();
				}
				getTab = true;
				break;							
			}
		}
		if(getTab == true)
		{
			break;
		}
	}
}

/********************************************FOR DYNAMIC FORM END*************************************************/


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

function lastClassAdd(oTable)
{
	/*************************************Last Class Start*****************************/
	$('td.last').removeClass('last');
	$('td', oTable.fnGetNodes()).parents("tr:first").parents("tbody:first").children('tr:last-child').children('td').addClass('last');
	$('th').click(function() {
		$('td.last').removeClass('last');
		$('td', oTable.fnGetNodes()).parents("tr:first").parents("tbody:first").children('tr:last-child').children('td').addClass('last');
	});	
	$('td.dataTables_empty').addClass('last');
	/*************************************Last Class End*****************************/
}


/*************************************Floating Bar Start*****************************/
function floatingbar(floatingbar,top_button,bottom_button)
{
	if($(floatingbar))
	{		
		$(window).scroll(function() {	
									
			if($(top_button).position())
			{																	
				if(parseFloat($(top_button).position().top) < parseFloat($(window).scrollTop()))
				{	
					$(floatingbar).css({height: 0}).animate({ height: '55'}, 40);			
				}
				else
				{
					$(floatingbar).animate({ height: 0}, 40);
				}
			}
		});
	}
}

/*************************************Floating Bar End*****************************/


/*************************************Floating Bar Start*****************************/
function upload_floatingbar(floatingbar,top_button,bottom_button, h)
{
	if($(floatingbar))
	{	
		$(document).scroll(function() {		
			if($(top_button).position())
			{																	
				if(parseFloat($(top_button).position().top) < parseFloat($(window).scrollTop()))
				{	
					$(floatingbar).css({height: 0}).animate({ height: h}, 40);			
				}
				else
				{
					$(floatingbar).animate({ height: 0}, 40);
				}
			}
		});
	}
}

/*************************************Floating Bar End*****************************/

/*************************************Refresh Captcha Start*****************************/
function refreshCaptcha(json_arr, parent_tag)
{
	parent_tag = (parent_tag == null || parent_tag == '') ? 'div' : parent_tag;
	if(json_arr.captcha && json_arr.captcha.status && json_arr.captcha.status == 'ok')
	{
		var captcha_name = json_arr.captcha.captcha_name;
		$('input[name="'+captcha_name+'[id]"]').parents(parent_tag+':first').children('img:first').attr('src', json_arr.captcha.ImgUrl+json_arr.captcha.id+json_arr.captcha.Suffix);
		$('input[name="'+captcha_name+'[id]"]').val(json_arr.captcha.id);
		$('input[name="'+captcha_name+'[input]"]').val('');
		$('#'+captcha_name+'_err').html('');		
	}
}
/*************************************Refresh Captcha End*****************************/


/**************************************JPicker Code Start*************************/	
function colorPicker(field_name_prefix)
{		
	$('#'+field_name_prefix+'picker').jPicker(	
		{
		  window:
		  {
			expandable: true,
			updateInputColor: true,
			bindToInput: true,
			input:  $('#'+field_name_prefix+'r,'+'#'+field_name_prefix+'g,'+'#'+field_name_prefix+'b'),
			position:
			{
			  x: 'screenCenter', // acceptable values "left", "center", "right", "screenCenter", or relative px value
			  y: '500px', // acceptable values "top", "bottom", "center", or relative px value
			},
			alphaSupport: true
		  },		  
		  color:
		  {			
			active: new $.jPicker.Color({ r: $('#'+field_name_prefix+'r').val(), g: $('#'+field_name_prefix+'g').val(), b: $('#'+field_name_prefix+'b').val() })
		  },
		  images:
		  {
			clientPath: 'application/modules/Administrator/layouts/scripts/js/jpicker/images/',
		  }
	 },
	  function(color, context)
		{
			var all = color.val('all');
			// alert('Color chosen - hex: ' + (all && '#' + all.hex || 'none') + ' - alpha: ' + (all && all.a + '%' || 'none') + ' r : '+ all.r + ' g : '+ all.g + ' b : '+ all.b);
			 $('#'+field_name_prefix+'r').val(all.r);			 
			 $('#'+field_name_prefix+'g').val(all.g);
			 $('#'+field_name_prefix+'b').val(all.b);
			 $('#'+field_name_prefix+'r,'+'#'+field_name_prefix+'g,'+'#'+field_name_prefix+'b').css(
				{
				  backgroundColor: all && '#' + all.hex || 'transparent'
				});
		},
        function(color, context)
        {
			
        },
        function(color, context)
        {
          var all = this.color.active.val('all');
			//alert('Active Color chosen - hex: ' + (all && '#' + all.hex || 'none') + ' - alpha: ' + (all && all.a + '%' || 'none') + ' r : '+ all.r + ' g : '+ all.g + ' b : '+ all.b);
			 $('#'+field_name_prefix+'r').val(all.r);			 
			 $('#'+field_name_prefix+'g').val(all.g);
			 $('#'+field_name_prefix+'b').val(all.b);
			 $('#'+field_name_prefix+'r,'+'#'+field_name_prefix+'g,'+'#'+field_name_prefix+'b').css(
				{
				  backgroundColor: all && '#' + all.hex || 'transparent'
				});
        }	 
	 );		 
}
/************************************JPicker Code End**************************/


/**************************************UPay Code Start*************************/
function UPay_Pay()
{
	$('a.UPay_Pay').click(function() {
		var self = this;
		$(self).parents('span:first').children('#upay_div').children('form:first').submit();
	});
}
/**************************************UPay Code End*************************/	


/**************************************Editors Code Start*************************/
	
function buttonShow(name, title)
{
	$('#file_'+name).html(title);
	$('#file_path_'+name).val('');
	$.each($('#floatingbar').children('div:first').children('span'), function(index) { 	 
	  var rel = $(this).children('a:first').attr('rel');
	  if(rel == name)
	  {
		$(this).fadeIn();
	  }
	  else
	  {
		$(this).fadeOut();
	  }
	});
}
/**************************************Editors Code Start*************************/


/**************************************IP Address Validation Start*************************/

function validateIp(value, type)
{	
	var ipv4 = '^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$';
	var ipv4CIDR = '^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/(\d|[1-2]\d|3[0-2]))$';
	
	var ipv6 = '^\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?\s*';
	
	var ipv6CIDR = '^\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?\s*(\/(\d|\d\d|1[0-1]\d|12[0-8]))$';
	
	
	var return_val = false;
	switch(type)
	{
		case '4':
			var ipRE = new RegExp( ipv4   );
			var ipRE_CIDR = new RegExp( ipv4CIDR   );
			return_val = (ipRE.test( value ) || ipRE_CIDR.test( value ));
			break;
		case '6':
			var ipRE = new RegExp( ipv6   );
			var ipRE_CIDR = new RegExp( ipv6CIDR   );
			return_val = (ipRE.test( value ) || ipRE_CIDR.test( value ));
			break;
	}
	return return_val;
}

/**************************************IP Address Validation End*************************/