/*
 * Image preview script 
 * powered by jQuery (http://www.jquery.com)
 * 
 * written by Alen Grakalic (http://cssglobe.com)
 * 
 * for more info visit http://cssglobe.com/post/1695/easiest-tooltip-and-image-preview-using-jquery
 *
 */
 
this.imagePreview = function(){	
	/* CONFIG */
		
		xOffset = 10;
		yOffset = 30;
		
		// these 2 variable determine popup's distance from the cursor
		// you might want to adjust to get the right result
		
	/* END CONFIG */
	$("a.preview").hover(function(e){
		this.t = this.title;
		this.title = "";	
		var prm = ($(this).attr('width') && $(this).attr('width') != "") ? "width='"+$(this).attr('width')+"'" : "";
			prm += ($(this).attr('height') && $(this).attr('height') != "") ? " height='"+$(this).attr('height')+"'" : "";			
		var c = (this.t != "") ?  this.t : "";
		var img_val = ($(this).attr('link') != '') ? "<img src='"+ $(this).attr('link') +"' alt='"+ c +"' "+prm+" /><br/>" : "";
		$("body").append("<span id='preview'>"+ img_val + c +"</span>");								 
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px")
			.fadeIn("fast");						
    },
	function(){
		this.title = this.t;	
		$("#preview").remove();
    });	
	$("a.preview").mousemove(function(e){
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px");
	});			
};


// starting the script on page load
$(document).ready(function(){
	imagePreview();
});