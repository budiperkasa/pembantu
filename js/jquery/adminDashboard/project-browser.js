
 $(document).ready(function(){
	$('.fzoom').fancybox({
		'zoomOpacity' : true,
		 'overlayShow' : true,
		 'zoomSpeedIn' : 300,
		 'zoomSpeedOut' : 300,
		 'overlayOpacity': .3
		 		 });

	switchTo('web');	
	$("#scroller-web-window").scrollable({
		easing: 'swing',
		size: '1',
		items: '#scroller-web-wrap',
		loop: 'true',
		next: '#button-next-project-web' ,
		navi: '#project-dots-web',
		naviItem: 'a',
		keyboard: true,
		speed: '800'
	});	

	$("#scroller-iphone-window").scrollable({
		easing: 'swing',
		size: '1',
		items: '#scroller-iphone-wrap',
		loop: 'true',
		next: '#button-next-project-iphone' ,
		navi: '#project-dots-iphone',
		naviItem: 'a',
		keyboard: true,			
		speed: '800'
	});	
	
	/*$("#scroller-desk-window").scrollable({
		easing: 'swing',
		size: '1',
		items: '#scroller-desk-wrap',
		loop: 'true',
		next: '#button-next-project-desk' ,
		navi: '#project-dots-desk',
		naviItem: 'a',
		keyboard: true,			
		speed: '800'
	});*/
	
	
	$("#scroller-setup-window").scrollable({
		easing: 'swing',
		size: '1',
		items: '#scroller-setup-wrap',
		loop: 'true',
		next: '#button-next-project-setup' ,
		navi: '#project-dots-setup',
		naviItem: 'a',
		keyboard: true,			
		speed: '800'
	});
		
			
 	//set up events to handle browsing project categories
    $("#projects .web a ").bind("click", function(){ switchTo("web"); });
    $("#projects .iphone a ").bind("click", function(){ switchTo("iphone");});
    /*$("#projects .desktop a ").bind("click", function(){ switchTo("desktop");});*/
	$("#projects .setup a ").bind("click", function(){ switchTo("setup");}); 
    		
  });
 		
var curSect = "";

function switchTo(which){
	jQuery.easing.def = "easeInOutSine";
	
	h = $(".project").height();  //so we don't have to hardcode the row height;
	if (which == curSect) { return; }  //don't switch if we are on the selected tab
	
	if (which == "web"){
		$(".button-next-project").hide();
		$("#button-next-project-web").show();		
		$(".project-dots").hide();
		$("#project-dots-web").show(300);		
		$("#project-type-nav span").animate({opacity: '.65'}, { "duration": 300 } );	
		$("#project-type-nav a").css("cursor", "pointer");		
		$("#project-type-nav .web a").css("cursor", "default");			
		$("#project-type-nav .current").animate({top: "-1px"  }, { "duration": 300 } );
		$("#project-type-nav .web span").animate({opacity: '1.0'}, { "duration": 300 } );
		$("#scroller-vertical").animate({top: '0'}, { "duration": 300 } );
	}
		
	if (which == "iphone"){
		$(".button-next-project").hide();
		$("#button-next-project-iphone").show();		
		$(".project-dots").hide();	
		$("#project-type-nav span").animate({opacity: '.65'}, { "duration": 300 } );
		$("#project-type-nav a").css("cursor", "pointer");		
		$("#project-type-nav .iphone a").css("cursor", "default");					
		$("#project-type-nav .current").animate({ 	top: "35px"   }, { "duration": 300 } );
		$("#project-type-nav .iphone span").animate({opacity: '1.0'}, { "duration": 300 } );
		$("#scroller-vertical").animate({top: "-"+(h)+"px"}, { "duration": 300 } );
		$("#project-dots-iphone").show(300);
	}
	
	if (which == "desktop"){
	
		$(".button-next-project").hide();
		$("#button-next-project-desk").show();		
		$(".project-dots").hide();
		$("#project-type-nav span").animate({opacity: '.65'}, { "duration": 300 } );	
		$("#project-type-nav a").css("cursor", "pointer");		
		$("#project-type-nav .desktop a").css("cursor", "default");				
		$("#project-type-nav .current").animate({ 		top: "71px"	    }, { "duration": 300} );
		$("#project-type-nav .desktop span").animate({opacity: '1.0'}, { "duration": 300 } );
		$("#scroller-vertical").animate({top: "-"+(h*2)+"px"}, { "duration": 300 } );
		$("#project-dots-desk").show(300);	
	}
	
	if (which == "setup"){
	
		$(".button-next-project").hide();
		$("#button-next-project-setup").show();		
		$(".project-dots").hide();
		$("#project-type-nav span").animate({opacity: '.65'}, { "duration": 300 } );	
		$("#project-type-nav a").css("cursor", "pointer");		
		$("#project-type-nav .setup a").css("cursor", "default");				
		$("#project-type-nav .current").animate({ 		top: "71px"	    }, { "duration": 300} );
		$("#project-type-nav .setup span").animate({opacity: '1.0'}, { "duration": 300 } );
		$("#scroller-vertical").animate({top: "-"+(h*2)+"px"}, { "duration": 300 } );
		$("#project-dots-setup").show(300);	
	}			
	
	curSect = which;

}

