function getSettingInfo(data_info, param_info)
{
	var setting_info = {};
	$.each(param_info, function(key, value){
			setting_info[key]	 = 	value;
			if(data_info[value])
			{
				setting_info[value]	=	data_info[value];
			}
		});	
		
	return setting_info;
}




function dynamicUploader(upload_field, upload_value_field , setting_info, language_array, save_url, remove_url, multi)
{	
	$("#"+upload_field).kendoUpload({
			multiple: multi,
			showFileList: true,
			localization:{  
							select:  				language_array['portfolio_upload_dy_text_select'],
							cancel:	 				language_array['portfolio_upload_text_cancel'],
							dropFilesHere:	 		language_array['portfolio_upload_text_dropFilesHere'],
							remove:	 				language_array['portfolio_upload_text_remove'],
							retry:	 				language_array['portfolio_upload_text_retry'],
							statusFailed:	 		language_array['portfolio_upload_text_statusFailed'],
							statusUploaded:	 		language_array['portfolio_upload_text_statusUploaded'],
							statusUploading:	 	language_array['portfolio_upload_text_statusUploading'],
							uploadSelectedFiles:	language_array['portfolio_upload_text_uploadSelectedFiles']
						},
			async: {
				saveUrl: save_url,
				removeUrl: remove_url,                            
				autoUpload: true
			},
			cancel: onCancel,
			complete: onComplete,
			error: function(e, index) {
				switch(e.operation )
				{
					case 'upload':
						var files = e.files;
						$.each(files, function() {
							openMsgDialog(language_array['portfolio_file_upload_err'] + this.name );
						});
						break;
					case 'remove':
						var button = $(".k-file:has([title='" + e.files[0].name + "']) .k-upload-action")						
						button.html("<span class='k-icon k-delete'></span>"+language_array['portfolio_upload_text_remove']);
						break;
				}
			},
			progress: onProgress,
			remove: function onRemove(e) {					
				var button = $("li.k-file:has(span[title='" + e.files[0].name + "']) .k-upload-action");  
				button.html('<span class="k-loading">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>');
				setting_info.upload_file_name = upload_field;				
				e.data = {};
				$.each(setting_info, function(key, value){						
						e.data[key]	 = 	value;						
					});	
			},
			select: function(e) {
						
						// Array with information about the uploaded files
						var files = e.files;
						var permitted_ext = setting_info[setting_info['file_extension_field']];		
						var permitted_ext_arr = permitted_ext.split(',');
						var permitted_size = setting_info[setting_info['file_max_size_field']];
						var permitted_size = parseInt(permitted_size);
						
						
						// Check the extension and size of each file and abort the upload if it is not selected extension or size
						$.each(files, function() {
							var ext = this.extension ;
							var ext_arr	=	ext.split('.');
							var file_size = parseFloat(this.size)/1024;
							if (($.inArray(ext_arr[1].toLowerCase(), permitted_ext_arr) == -1) && ($.inArray(ext_arr[1].toUpperCase(), permitted_ext_arr) == -1)) {
								var support_file_extension = permitted_ext_arr.join(' | ');
								openMsgDialog(language_array['portfolio_file_extension_dy_not_supportable_ext1']+' " '+ext_arr[1]+' " '+language_array['portfolio_file_extension_dy_not_supportable_ext2']+ '  ' +language_array['portfolio_file_extension_dy_support']+'" '+support_file_extension+' "');
								e.preventDefault();
							}
							else if((file_size > permitted_size) && (permitted_size > 0))
							{
								openMsgDialog(language_array['portfolio_file_size_dy_support']+setting_info[setting_info['file_max_size_field']]);
								e.preventDefault();
							}
						});
					},
			success: function onSuccess(e) {
				var files = e.files;
				var data = e.response;
				if (e.operation == "upload") 
				{
				   if(data.status == 'ok')
				   {					  
					   e.files[0]['old_name']	= e.files[0]['name'];
					   e.files[0]['name'] = data.newName;
					   
					   data.multi = multi;
					   var progress_html  ='<span class="k-progress"><span class="k-state-selected k-progress-status" style="width: 100%;"></span></span>';			  		   
					   
					   $("span.k-filename[title='" + e.files[0].old_name + "']").eq(0).html(e.files[0].name + progress_html);
					   $("span.k-filename[title='" + e.files[0].old_name + "']").eq(0).attr('title', e.files[0].name);
					  //alert(data.toSource());
					  // alert(e.files[0]['name']);		
					  successFileDecoretion( e.files[0], data, upload_field, upload_value_field);
					  if(multi == false)
					  {
						  this.disable();
					  }
				   }
				   else
				   {
					   openMsgDialog(data.msg);
				   }
				}
				else if(e.operation == "remove")
				{			
					if(data.status == 'ok')
					{
						if(upload_value_field != '')
						{
							var selected_files = $('#'+upload_value_field).val();											
							var selected_files_arr = (selected_files != '') ? selected_files.split(',') : new Array();						
							var final_selected_files_arr = new Array();	
								var j = 0;
								$.each(selected_files_arr, function(i, value) {													
									if(value != e.files[0]['name'])
									{
										final_selected_files_arr[j] = value;
										j++;
									}
								});						
							selected_files = final_selected_files_arr.join(",");
							$('#'+upload_value_field).val(selected_files);	
										
							removeFileDecoretion( e.files[0], data, upload_field, upload_value_field);
						}
					}
					else
					{
						openMsgDialog(data.msg);
					}
				}
			},
			upload: function(e) {
						setting_info.upload_file_name = upload_field;						
						e.data = {};
						$.each(setting_info, function(key, value){						
								e.data[key]	 = 	value;						
							});			
					}
		});
}


function getFileInfo(e) {
	return $.map(e.files, function(file) {
		var info = file.name;
	
		// File size is not available in all browsers
		if (file.size > 0) {
			info  += " (" + Math.ceil(file.size / 1024) + " KB)";
		}
		return info;
	}).join(", ");
}

function isImage(fileObj)
{
	var ext = fileObj.extension;
	if(ext == '.jpg' || ext == '.JPG' || ext == '.png' || ext == '.PNG' || ext == '.bmp' || ext == '.BMP' || ext == '.gif' || ext == '.GIF')
	{
		return true;
	}
	else
	{
		return false;
	}
}

function removeFileDecoretion(fileObj, serverData, upload_field, upload_value_field)
{
	var block = 'selected_file_'+upload_value_field;
	$('#'+block).children('div.box').each(function(index, element) {
       	if($(element).find('img:first').attr('title') == fileObj['name'])
		{
			$(element).fadeOut();
		}
    });
}

/**********************************Delete FILES****************************************************/
function deleteFiles(main_title, related_title, delete_url, common_delete_title)
{
	$('input.radio_style').unbind('click');
	$('input.radio_style').bind('click', function(e){
		var self = this;		
		$(self).parents('span:first').parents('div:first').parents('span:first').children('div').each( function(){
			$(this).children('span:first').text(related_title);
			$(this).children('span:first').css('color','#F60');
		});
		$(self).parents('span:first').parents('div:first').children('span:first').text(main_title);
		$(self).parents('span:first').parents('div:first').children('span:first').css('color','#060');		
	});
	
	$('a.delete_image_lnk').unbind('click');
	$('a.delete_image_lnk').bind('click', function(e){
			var self = this;
			var file_name = $(self).attr('rel');
			var content_id = $(self).parents("span:first").parents("div:first").parents("span:first").attr('id');
			var put_file_arr = content_id.split('selected_file_');
			var put_file_obj = '#'+put_file_arr[1]; 
			var file_content = $(put_file_obj).val();			
			
			var file_arr = file_content.split(',');	
			var put_file = '';	
			for(var i = 0; i < file_arr.length; i++)
			{
				if(file_arr[i] != file_name)
				{
					put_file = (put_file == '')? file_arr[i] : put_file +','+ file_arr[i];
				}
			}						
			$(put_file_obj).val(put_file);
			$(self).parents("div:first").find('input[type="radio"]').remove();	
			$(self).parents("div:first").fadeOut();														
		});
		
	$('a.delete_uploaded_image_link').unbind('click');
	$('a.delete_uploaded_image_link').bind('click', function(e){
			var self = this;
			var file_name = $(self).attr('file_name');
			var file_path = $(self).attr('file_path');
			var field_name = $(self).attr('field_name');
			var file_content = $('#'+field_name).val();
			
			$.ajax({
				url: delete_url,
			  	type: 'POST',
			  	data: { fileNames: file_name, file_path_field: 'file_path', file_path : file_path },
				beforeSend: function(){						
						$(self).html('<img src="application/modules/Administrator/layouts/scripts/images/loader/flag_loader.gif" border="0"/>');			
					 },
				success: function(response){
					//alert(response);
					var json_arr = eval("("+response+")");
					
					if(json_arr.status == 'ok')
					{							
						var file_arr = file_content.split(',');	
						var put_file = '';	
						for(var i = 0; i < file_arr.length; i++)
						{
							if(file_arr[i] != file_name)
							{
								put_file = (put_file == '')? file_arr[i] : put_file +','+ file_arr[i];
							}
						}
												
						$('#'+field_name).val(put_file);	
						$(self).parents("span:first").parents("div:first").remove();
						var parent_ul = $("li.k-file:has(span[title='" + file_name + "'])").parent();												
						$("li.k-file:has(span[title='" + file_name + "'])").remove();
						if(parent_ul.has("li").length < 1)
						{							
							var upload_field_id = 	parent_ul.parent("div:first").find('input[type="file"]:first').attr('id');	
							if(upload_field_id != null)
							{						
								$("#"+upload_field_id).data("kendoUpload").enable();
							}
							parent_ul.remove();
						}
					}
					else
					{
						var file_arr = file_content.split(',');	
						var put_file = '';	
						for(var i = 0; i < file_arr.length; i++)
						{
							if(file_arr[i] != file_name)
							{
								put_file = (put_file == '')? file_arr[i] : put_file +','+ file_arr[i];
							}
						}
						$('#'+field_name).val(put_file);
						$(self).html(common_delete_title);	
						openMsgDialog(json_arr.msg);				
					}									
				}
			});											
	});		
}