(function($) {
 	
	// this will contain the segments used for sorting the slides
	var slidesOrderContainer,
	
		// flag for AJAX requests
		ajaxRequestInProgress = false,
		
		// media loader lightbox
		mediaContainer,
		
		// the total height of images that are loaded in the media loader
		mediaLoaderImagesHeight,
		
		// hold a reference to the slide for which the media loader is opened
		mediaLoaderCurrentButton;
	
	
	$(document).ready(function() {
		
		slidesOrderContainer = $(document).find('.slides-order-container');
		
		
		// get all the existing slide panels and prepare them
		$('.slider-pro .slidebox').each(function(index){
			prepareSlide($(this));
		});
		
		
		// make the slide panels sortable
		$('.slider-pro .ui-sortable').sortable({
				placeholder: 'sortable-placeholder',
				items: '.postbox',
				handle: '.hndle',
				cursor: 'move',
				distance: 2,
				tolerance: 'pointer',
				forcePlaceholderSize: true,
				helper: 'clone',
				opacity: 0.7,
				
				start: function(event, ui) {
					$('body').css({
						WebkitUserSelect: 'none',
						KhtmlUserSelect: 'none'
					});
					
					// remove the tinyMCE editor when a panel is being moved
					ui.item.find('.sp-editor').each(function() {
						var id = $(this).attr('id');
						tinyMCE.execCommand('mceRemoveControl', false, id);
					});
				},
				
				stop: function(event, ui) {
					ui.item.parent().removeClass('temp-border');
					$('body').css({
						WebkitUserSelect: '',
						KhtmlUserSelect: ''
					});
					
					// change the value of the 'position' class based on the current position of the slide
					ui.item.parent().find('.slidebox').each(function(index){
						$(this).find('.position').attr('value', index + 1);
					});
					
					// add the tinyMCE editor after a panel has stopped moving
					ui.item.find('.sp-editor').each(function() {
						var id = $(this).attr('id');
						tinyMCE.execCommand('mceAddControl', false, id);
					});
				}
		});
		
		
		// make the slide segments from the sidebar sortable
		slidesOrderContainer.sortable({
				placeholder: 'sortable-placeholder',
				cursor: 'move',
				tolerance: 'pointer',
				forcePlaceholderSize: true,
				helper: 'clone',
				opacity: 0.7,
				
				start: function(event, ui) {
					$('body').css({
						WebkitUserSelect: 'none',
						KhtmlUserSelect: 'none'
					});
				},
				
				stop: function(event, ui) {
					ui.item.parent().removeClass('temp-border');
					$('body').css({
						WebkitUserSelect: '',
						KhtmlUserSelect: ''
					});
					
					slidesOrderContainer.find('.slide-symbol').each(function(index){
						var counter = $(this).data('counter'),
							newPosition = index + 1;
						
						// change the value of the 'position' class based on the new position of the segment	
						$('.slider-pro .ui-sortable .slidebox').each(function() {
							if ($(this).find('.counter').attr('value') == counter) {
								$(this).find('.position').attr('value', newPosition);
							}
						});
					});
				}
		});
		
		
		// add a new slide panel
		$('.slider-pro #add-new-slide a').click(function(event) {
			event.preventDefault();
			
			var url = $.url.setUrl($(this).attr('href')),
				action = $.url.param('action'),
				position = parseInt($('.slider-pro .slidebox').length) + 1,
				counter = 0;
			
			// find the index of the new panel	
			$('.slider-pro .slidebox').each(function(index) {
				counter = Math.max(counter, parseInt($(this).find('.counter').attr('value')));									 
			});
			
			counter++;
			
			// add the panel using AJAX
			if (!ajaxRequestInProgress) {
				ajaxRequestInProgress = true;
				
				$.ajax({
					url: sp_js_vars.ajaxurl,
					type: 'post',
					data: {action: action, counter: counter},
					complete: function(data) {
						var slide = $(data.responseText).appendTo($('.slideboxes'));		
						slide.find('.position').attr('value', position);
						prepareSlide(slide);
						
						
						
						ajaxRequestInProgress = false;
						slide.hide().fadeIn();
					}
				});
			}
			
		});
		
		
		// preview the slider
		$('.slider-pro #preview-slider').click(function(event) {
			event.preventDefault();
			
			if (ajaxRequestInProgress)
				return;
			
			showAjaxPreloader();
				
			var url = $.url.setUrl($(this).attr('href')),
				action = $.url.param('action'),
				id = $.url.param('id'),
				name = $.url.param('name');
				
			ajaxRequestInProgress = true;
			
			$.ajax({
				url: sp_js_vars.ajaxurl,
				type: 'post',
				dataType:'html',
				data: {action: action, id: id},
				complete: function(data) {						
					ajaxRequestInProgress = false;
					
					var previewContainer = $('<div id="preview-container"></div>').appendTo($('body')),																				  
						preview = $(data.responseText).appendTo(previewContainer);
						
					previewContainer.dialog({
						resizable:false,
						modal:true,
						width:'auto',
						height:'auto',
						title:name + ' - ' + sp_js_vars.preview,
						create:function() {
							hideAjaxPreloader();
						},
						close:function() {
							previewContainer.find('.advanced-slider').advancedSlider().destroy();
							previewContainer.dialog('destroy');
							previewContainer.remove();	
						}});
					
					$('.ui-dialog').addClass('slider-pro-preview-dialog');
					
					$('.ui-widget-overlay').addClass('slider-pro-dialog-overlay')
										   .click(function() {
												previewContainer.find('.advanced-slider').advancedSlider().destroy();
												previewContainer.dialog('destroy');
												previewContainer.remove();												
											});
				}
			});
			
		});
		
		
		// delete the slider
		$('.slider-pro #delete-slider').click(function(event) {
			event.preventDefault();
			
			var link = $(this),
				dialogBox = $('<div><div class="delete-dialog-icon"></div><p>' + sp_js_vars.delete_slider + '</p></div>'),
				buttons = {};
			
			buttons[sp_js_vars.yes] = function() { $(this).remove(); window.location = $(link).attr('href'); };
			buttons[sp_js_vars.cancel] = function() { $(this).remove(); };
			
			dialogBox.dialog({
						resizable:false,
						modal:true,
						width:370,
						buttons: buttons});
			
			$('.ui-dialog-titlebar').remove();
			$('.ui-dialog').addClass('slider-pro-delete-dialog');
			$('.ui-widget-overlay').addClass('slider-pro-dialog-overlay');
		});		
		
		
		// import a slider
		$('.slider-pro #import-slider').click(function(event) {
			event.preventDefault();
			
			if (ajaxRequestInProgress)
				return;				
			
			ajaxRequestInProgress = true;
			
			var url = $.url.setUrl($(this).attr('href')),
				action = $.url.param('action');
				
			
			$.ajax({
				url: sp_js_vars.ajaxurl,
				type: 'get',
				dataType:'html',
				data: {action: action},
				complete: function(data) {						
					ajaxRequestInProgress = false;
					
					var importContainer = $('<div id="import-container"></div>').appendTo($('body'));
					$(data.responseText).appendTo(importContainer);
					
					importContainer.dialog({
						resizable:false,
						modal:true,
						width:'auto',
						height:100,
						title:sp_js_vars.import_slider,
						close:function() {
							importContainer.remove();	
						}});
					
					$('.ui-dialog').addClass('slider-pro-import-dialog');					
					$('.ui-widget-overlay').addClass('slider-pro-dialog-overlay');
				}
			});
			
		});
		
				
		
		
		$('.slider-pro .inner-sidebar .handlediv').each(function() {
			addPanelSliding($(this));			
		});
		
		
		$('.slider-pro .inner-sidebar .postbox').each(function() {
			setPanelState($(this));
		});
		
		
		$('.slider-pro .inner-sidebar .sp-color-picker').each(function(){
			addColorPicker($(this));
		});
		
		
		$('.slider-pro .inner-sidebar label').each(function(){
			addHelpTooltip($(this));
		});
		
		
	});
	
	
	
	function prepareSlide(slide) {
		
		// set the panel to opened or closed
		setPanelState(slide);
		
		// create the tabs
		slide.find('.slide-tabs').tabs();
		
		// add the option to hide the panel
		addPanelSliding(slide.find('.handlediv'));
		
		// open the large image when the preview box is clicked
		slide.find('.preview-box .image').each(function() {
			addDialogBox($(this));
		});
		
		
		// make it possible to change the name of the slide on double click on the panel's handler
		slide.find('.hndle').dblclick(function() {
			var handle = $(this);
			
			if (!handle.data('isEditing')) {
				handle.data('isEditing', true);
				
				var currentTitle = $(this).html();
				
				$(this).html('|');
				
				var	input = $('<input/>').addClass('title-input')
										 .attr('type', 'text')
										 .attr('value', currentTitle)
										 .css({'position': 'absolute', 'width': 300, 'height': 21, 'top':1, 'left':2})
										 .click(function(event) {
											event.stopPropagation();   
										 })
										 .keypress(function(event) {
											if (event.which == 13) {
												handle.data('isEditing', false);				
												var editedTitle = $(this).attr('value');																							
												$(this).remove();
												handle.html(editedTitle);
																							
												var nameField = handle.parent().find('.name');
												nameField.attr('value', editedTitle);
																							
												slideSymbol.find('p').html(editedTitle);
											}
										})
										.appendTo(handle);
			}
		});
		
		
		slide.find('.hndle').click(function() {													  
			if ($(this).data('isEditing')) {
				$(this).data('isEditing', false);
				
				var input = $(this).parent().find('.title-input'),
					editedTitle = input.attr('value');
					
				input.remove();
				$(this).html(editedTitle);
				
				var nameField = $(this).parent().find('.name');
				nameField.attr('value', editedTitle);
				
				slideSymbol.find('p').html(editedTitle);
			}
		});
		
		
		// delete the slide panel
		slide.find('.closediv').click(function() {
			var slidebox = $(this).parent(),
				dialogBox = $('<div><img class="delete-dialog-icon"/><p>' + sp_js_vars.delete_slide + '</p></div>'),
				slideboxes = slidebox.parent(),
				buttons = {};
			
			buttons[sp_js_vars.yes] = function() {
											dialogBox.remove();
											
											slidebox.animate({'opacity':0}, function() {
												$(this).slideUp(200, function() {
													$(this).remove();
													slideboxes.find('.slidebox').each(function(index){
														$(this).find('.position').attr('value', index + 1);
													});
												})
											});
											
											slidesOrderContainer.find('.slide-symbol').each(function(){
												if($(this).data('counter') == slide.find('.counter').attr('value')) {
													$(this).remove();		
												}
											});
										}
										
			buttons[sp_js_vars.cancel] = function() { dialogBox.remove(); };
				
			dialogBox.dialog({
						resizable:false,
						modal:true,
						width:370,
						buttons: buttons});
			
			$('.ui-dialog-titlebar').remove();
			$('.ui-dialog').addClass('slider-pro-delete-dialog');	
			$('.ui-widget-overlay').addClass('slider-pro-dialog-overlay');
		});
		
		
		// duplicate the slide
		slide.find('.duplicatediv').click(function() {
			var action = 'sp_duplicate_slide',
				id = parseInt(slide.find('.id').attr('value')),
				position = parseInt($('.slider-pro .slidebox').length) + 1,
				counter = 0;
			
			// find the index of the new panel	
			$('.slider-pro .slidebox').each(function(index) {
				counter = Math.max(counter, parseInt($(this).find('.counter').attr('value')));									 
			});
			
			counter++;
			
			// add the panel using AJAX
			if (!ajaxRequestInProgress) {
				ajaxRequestInProgress = true;
				
				$.ajax({
					url: sp_js_vars.ajaxurl,
					type: 'post',
					data: {action: action, counter: counter, id: id},
					complete: function(data) {
						var slide = $(data.responseText).appendTo($('.slideboxes'));		
						slide.find('.position').attr('value', position);
						prepareSlide(slide);
						ajaxRequestInProgress = false;
						slide.hide().fadeIn();
					}
				});
			}
		});
		
		
		// create the tinyMCE editor
		
		slide.find('.sp-editor').each(function() {
			$(this).tinymce({
				script_url : sp_js_vars.url + '/slider-pro/js/tinymce/tiny_mce.js',
				theme : "advanced",
				skin: "wp_theme", 
				width: "100%", 
				theme_advanced_toolbar_location: "top",
			  	theme_advanced_toolbar_align: "left",
			  	theme_advanced_statusbar_location: "bottom",
			  	theme_advanced_resizing: true,
			  	theme_advanced_resize_horizontal: false,
			 	plugins: "inlinepopups,spellchecker,paste,wordpress,fullscreen,wpeditimage,wpgallery,tabfocus",
			  	dialog_type: "modal",
			  	theme_advanced_buttons1: "bold,italic,underline,strikethrough,|,bullist,numlist,blockquote,|,removeformat,|,link,unlink,|,image,charmap,|,undo,redo,|,wp_adv,code",
			  	theme_advanced_buttons2: "formatselect,fontselect,fontsizeselect,forecolor,backcolor,|,pastetext,pasteword,outdent,indent",
			  	theme_advanced_buttons3: "",
				valid_elements: "*[*]",
				apply_source_formatting: true,
				relative_urls : false,
				remove_script_host : false,
				forced_root_block : false,
				force_p_newlines : false,
				force_br_newlines : true
			});
		});
						
						
		// create a new slide segment
		var slideSymbol = $('<div class="slide-symbol"></div>').appendTo(slidesOrderContainer);
		$('<p>' + slide.find('.name').attr('value') + '</p>').appendTo(slideSymbol);
		slideSymbol.data('counter', slide.find('.counter').attr('value'));
		
		
		// show the preview image
		slide.find('a.preview-button').click(function(event) {
			event.preventDefault();
			
			var imagePath = $(this).parents('.info-input').find('.path').attr('value'),
				box = $(this).parents('.info-input').siblings('.preview-box'),
				w = parseInt(box.css('width')),
				h = parseInt(box.css('height'));
				
				
			var fullPath = sp_js_vars.enable_timthumb == true ? (sp_js_vars.timthumb + '?src=' + imagePath + '&w=' + w + '&h=' + h + '&q=95') : imagePath;
			
			box.find('.image').remove();
			
			if (box.hasClass('no-image'))
				box.removeClass('no-image');
				
			if (box.hasClass('image-not-found'))
				box.removeClass('image-not-found');
				
			box.addClass('image-preload');
			
			$('<img class="image"/>').load(function() {
										box.removeClass('image-preload');
										$(this).hide().fadeIn().appendTo(box);
										
										addDialogBox($(this));
									 })
									 .error(function() {
										box.removeClass('image-preload')
										   .addClass('image-not-found');
									 })
									 .attr('src', fullPath);
		});
				
		
		// open the lightbox for uploading and/or inserting an image
		slide.find('a.add-button').click(function(event) {
			event.preventDefault();
			
			if (ajaxRequestInProgress)
				return;
			
			showAjaxPreloader();
			
			var url = $.url.setUrl($(this).attr('href')),
				action = $.url.param('action'),
				showPage = $.url.param('show_page'),
				showDate = $.url.param('show_date'),
				containerHeight = $(window).height() - 200;
				
			mediaLoaderImagesHeight = containerHeight - 100;
			
			mediaLoaderCurrentButton = $(this);
				
			ajaxRequestInProgress = true;
			
			$.ajax({
				url: sp_js_vars.ajaxurl,
				type: 'post',
				dataType:'html',
				data: {action: action, images_total_height: mediaLoaderImagesHeight, show_page: showPage, show_date: showDate},
				complete: function(data) {						
					ajaxRequestInProgress = false;
						
					mediaContainer = $('<div id="media-container"></div>');
					$(data.responseText).appendTo(mediaContainer);
					
					mediaContainer.dialog({
						resizable:false,
						modal:true,
						width:'auto',
						height:containerHeight,
						title:sp_js_vars.media_loader,
						create:function() {
							hideAjaxPreloader();
						},
						close:function() {
							mediaContainer.dialog('destroy');
							mediaContainer.remove();
						}});
						
					prepareShowButton();
					
					$('.ui-dialog').addClass('slider-pro-media-dialog');
					
					$('.ui-widget-overlay').addClass('slider-pro-dialog-overlay')
										   .click(function() {
												mediaContainer.dialog('destroy');
												mediaContainer.remove();
											});
				}
			});
		});
		
		
		// when a label is clicked make it bold
		// a bold label will indicate that the slide setting will override the global setting
		slide.find('.slide-tabs-settings label').each(function() {
			var label = $(this),
				override = label.find('.override'),
				currentValue = parseInt(override.attr('value'));
			
			if (currentValue == 1)
				label.addClass('override-label');
			
			label.click(function(event) {
				event.preventDefault();
				
				currentValue = parseInt(override.attr('value'));
				
				if (currentValue == 0) {
					override.attr('value', 1);
					label.addClass('override-label');
				} else {
					override.attr('value', 0);
					label.removeClass('override-label');
				}
			});
		});
		
		
		// create the color picker
		slide.find('.slide-tabs-settings .sp-color-picker').each(function(){
			addColorPicker($(this));
		});
		
		
		// add the help functionality
		slide.find('label').each(function(){
			addHelpTooltip($(this));
		});
	}
	
	
	function prepareShowButton() {
		mediaContainer.find('a.show-button').click(function(event) {
			event.preventDefault();
			
			if (ajaxRequestInProgress)
				return;
			
			var url = $.url.setUrl($(this).attr('href')),
				action = $.url.param('action'),
				showPage = mediaContainer.find('#selection-categories #page-select').val();
				showDate = mediaContainer.find('#selection-categories #date-select').val();
				
			ajaxRequestInProgress = true;
			
			$.ajax({
				url: sp_js_vars.ajaxurl,
				type: 'post',
				dataType:'html',
				data: {action: action, images_total_height: mediaLoaderImagesHeight, show_page: showPage, show_date: showDate},
				complete: function(data) {						
					ajaxRequestInProgress = false;
					
					// reload the conent	
					mediaContainer.empty();
					$(data.responseText).appendTo(mediaContainer);
					
					prepareShowButton();
				}
			});
		});
		
		
		mediaContainer.find('a.insert-image').click(function(event) {
			event.preventDefault();
			
			// add the image url into the 'Path' field
			mediaLoaderCurrentButton.parents('.info-input').find('.path').attr('value', $(this).attr('href'));
			
			// remove the lightbox
			mediaContainer.dialog('destroy');
			mediaContainer.remove();
			
			// trigger the click event in order to display the iamge
			mediaLoaderCurrentButton.siblings('a.preview-button').trigger('click');
		});
		
		
		mediaContainer.find('.thumb-image').hover(
			function() {
				var imagePath = sp_js_vars.enable_timthumb == true ? ($(this).attr('src')).split('src=')[1] : $(this).attr('src'),
					fullPath = sp_js_vars.enable_timthumb == true ? (sp_js_vars.timthumb + '?src=' + imagePath + '&w=' + 150 + '&h=' + 100 + '&q=95') : imagePath,
					imageContainer = $('<div class="media-loader-image"></div').appendTo(mediaContainer),
					positionTop = $(this).position().top - (imageContainer.outerHeight(true) - $(this).outerHeight(true))/2,
					positionLeft = $(this).position().left + $(this).outerWidth(true) + 10; 
					
				imageContainer.css({'opacity': 0, 'top': positionTop, 'left': positionLeft})
							  .animate({'opacity':1}, 300)
				
				$('<img/>').load(function() {
									imageContainer.css('background-image', 'url(' + fullPath + ')');
								 })
						   .attr('src', fullPath);
			},
			
			function() {
				var imageContainer = mediaContainer.find('.media-loader-image');
				imageContainer.animate({'opacity':0}, 300, function() {imageContainer.remove()});
			}
		);
		
	}
	
	
	function showAjaxPreloader() {
		var preloaderOverlay = $('<div id="ajax-preloader-overlay"></div>').appendTo($('body')),
			preloaderContainer = $('<div id="preloader-container"></div>').appendTo($('body'));
			
		preloaderOverlay.css('width', $(document).width());
		preloaderOverlay.css('height', $(document).height());
		
		var topPosition = $(document).scrollTop() + ($(window).height() - preloaderContainer.outerHeight(true)) / 2,
			leftPosition = ($(document).width() - preloaderContainer.outerWidth(true)) / 2;
			
		preloaderContainer.css({top: topPosition, left: leftPosition});
	}
	
	
	function hideAjaxPreloader() {
		$('body').find('#ajax-preloader-overlay').remove();	
		$('body').find('#preloader-container').remove();
	}
	
	
	// close/open the panel
	function setPanelState(target) {
		if (target.find('.panel-state').attr('value') == 'closed')
			target.find('.inside').hide();
	}
	
	
	function addPanelSliding(target) {
		target.click(function() {
			var panel = target.parent(),
				panelsState = panel.find('.panel-state');
					
			if (panelsState.attr('value') == 'closed')
				panelsState.attr('value', 'opened');
			else
				panelsState.attr('value', 'closed');
				
			panel.find('.inside').slideToggle();
		});
	}
	
	
	function addDialogBox(target) {
		var url = $.url.setUrl(target.attr('src')),
			imagePath = $.url.param('src') || target.attr('src');
			
		target.css('cursor', 'pointer')
			  .click(function() {
					$('<img/>').load(function() {
						var dialog = $(this).dialog({
							resizable:false,
							modal:true,
							width:'auto'
						});
																				
						$('.ui-dialog-titlebar').remove();
						$('.ui-dialog-content').css({'padding': 0});
						$('.ui-widget-overlay').addClass('slider-pro-dialog-overlay')
											   .click(function() {
													dialog.dialog('close');
												});
						
						dialog.click(function() {
							dialog.remove();
						});
					})
			.attr('src', imagePath);
		});
	}
	
	
	/*
	* Create the help tooltip that will contain some description of the property
	*/
	function addHelpTooltip(target) {
		var label = target;
		
		if (label.attr('title') != '') {
				// get the name of the setting from the title attribute
				var titleValue = label.attr('title');
				
				label.hover(function() {	
								label.attr('title', '');
								
								// create the tooltip, add some temporary text and fade it in
								var tooltip = $('<div id="help-tooltip"> loading... </div>').hide().appendTo($('body'));
								
								// set the initial position of the tooltip
								var top = label.offset().top - tooltip.outerHeight(true) - 10,
									left = label.offset().left + (label.outerWidth(true) - tooltip.outerWidth(true)) / 2;
									
								if (left + tooltip.outerWidth(true) > $('body').outerWidth(true))
									left = $('body').outerWidth(true) -  tooltip.outerWidth(true);
								else if (left  < $('.slider-pro').offset().left)
									left = $('.slider-pro').offset().left;
																	
								tooltip.css({'top': top, 'left': left}).fadeIn();
								
								// load the description of the settings
								$.ajax({
									url: sp_js_vars.ajaxurl,
									type: 'get',
									data: {action: 'sp_get_help_text', title: titleValue},
									complete: function(data) {
										tooltip.html(data.responseText);
										
										// reset the position of the tooltip
										tooltip.css('top', label.offset().top - tooltip.outerHeight(true) - 10);
									}
								});
							},
							function() {
								label.attr('title', titleValue);
								$('body').find('#help-tooltip').remove();
							});
			}
	}
	
	
	/*
	* Create the color picker
	*/
	function addColorPicker(target) {
		var instance = target,
			colorInput = instance.prev(),
			color = rgb2hex(colorInput.attr('value'));
			
		instance.css('background-color', color);
		
		instance.ColorPicker({
			color: color,
	
			onShow: function (instance) {
				$(instance).fadeIn(300);
			},
			
			onHide: function (instance) {
				$(instance).fadeOut(300);
			},
			
			onChange: function (hsb, hex, rgb) {
				instance.css('background-color', '#' + hex);
				colorInput.attr('value', '#' + hex);
			}
		});
	}
	
	
	/*
	* Transforms an RGB value to a HEX value
	*/
	function rgb2hex(rgb) {
		 if (  rgb.search("rgb") == -1 ) {
			  return rgb;
		 } else {
			  rgb = rgb.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+))?\)$/);
			  function hex(x) {
				   return ("0" + parseInt(x).toString(16)).slice(-2);
			  }
			  return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]); 
		 }
	}

})(jQuery)