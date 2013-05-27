/*
* jQuery Mobile Framework : events
* Copyright (c) jQuery Project
* Dual licensed under the MIT or GPL Version 2 licenses.
* http://jquery.org/license
*/
(function(a,b,c){function i(b,c,d){var e=d.type;d.type=c;a.event.handle.call(b,d);d.type=e}a.each(("touchstart touchmove touchend orientationchange throttledresize "+"tap taphold swipe swipeleft swiperight scrollstart scrollstop").split(" "),function(b,c){a.fn[c]=function(a){return a?this.bind(c,a):this.trigger(c)};a.attrFn[c]=true});var d=a.support.touch,e="touchmove scroll",f=d?"touchstart":"mousedown",g=d?"touchend":"mouseup",h=d?"touchmove":"mousemove";a.event.special.scrollstart={enabled:true,setup:function(){function g(a,c){d=c;i(b,d?"scrollstart":"scrollstop",a)}var b=this,c=a(b),d,f;c.bind(e,function(b){if(!a.event.special.scrollstart.enabled){return}if(!d){g(b,true)}clearTimeout(f);f=setTimeout(function(){g(b,false)},50)})}};a.event.special.tap={setup:function(){var b=this,c=a(b);c.bind("vmousedown",function(d){function k(a){j();if(e==a.target){i(b,"tap",a)}}function j(){h();c.unbind("vclick",k).unbind("vmouseup",h).unbind("vmousecancel",j)}function h(){clearTimeout(g)}if(d.which&&d.which!==1){return false}var e=d.target,f=d.originalEvent,g;c.bind("vmousecancel",j).bind("vmouseup",h).bind("vclick",k);g=setTimeout(function(){i(b,"taphold",a.Event("taphold"))},750)})}};a.event.special.swipe={scrollSupressionThreshold:10,durationThreshold:1e3,horizontalDistanceThreshold:30,verticalDistanceThreshold:75,setup:function(){var b=this,d=a(b);d.bind(f,function(b){function j(b){if(!f){return}var c=b.originalEvent.touches?b.originalEvent.touches[0]:b;i={time:(new Date).getTime(),coords:[c.pageX,c.pageY]};if(Math.abs(f.coords[0]-i.coords[0])>a.event.special.swipe.scrollSupressionThreshold){b.preventDefault()}}var e=b.originalEvent.touches?b.originalEvent.touches[0]:b,f={time:(new Date).getTime(),coords:[e.pageX,e.pageY],origin:a(b.target)},i;d.bind(h,j).one(g,function(b){d.unbind(h,j);if(f&&i){if(i.time-f.time<a.event.special.swipe.durationThreshold&&Math.abs(f.coords[0]-i.coords[0])>a.event.special.swipe.horizontalDistanceThreshold&&Math.abs(f.coords[1]-i.coords[1])<a.event.special.swipe.verticalDistanceThreshold){f.origin.trigger("swipe").trigger(f.coords[0]>i.coords[0]?"swipeleft":"swiperight")}}f=i=c})})}};(function(a,b){function g(){var a=e();if(a!==f){f=a;c.trigger("orientationchange")}}var c=a(b),d,e,f;a.event.special.orientationchange=d={setup:function(){if(a.support.orientation){return false}f=e();c.bind("throttledresize",g)},teardown:function(){if(a.support.orientation){return false}c.unbind("throttledresize",g)},add:function(a){var b=a.handler;a.handler=function(a){a.orientation=e();return b.apply(this,arguments)}}};a.event.special.orientationchange.orientation=e=function(){var a=document.documentElement;return a&&a.clientWidth/a.clientHeight<1.1?"portrait":"landscape"}})(jQuery,b);(function(){a.event.special.throttledresize={setup:function(){a(this).bind("resize",c)},teardown:function(){a(this).unbind("resize",c)}};var b=250,c=function(){f=(new Date).getTime();g=f-d;if(g>=b){d=f;a(this).trigger("throttledresize")}else{if(e){clearTimeout(e)}e=setTimeout(c,b-g)}},d=0,e,f,g})();a.each({scrollstop:"scrollstart",taphold:"tap",swipeleft:"swipe",swiperight:"swipe"},function(b,c){a.event.special[b]={setup:function(){a(this).bind(c,a.noop)}}})})(jQuery,this)


jQuery.fn.megaMenu = function()
{
	
	var	menuItem = $('.menu li'),
	    menuItemLink = $(menuItem).find('a');
	    menuItemChildren = $(menuItem).children('div');

	function openCloseMegamenu() {
		
		$(menuItemLink).bind({
			
			touchstart: function(e) {
				
				var $this = $(this);
				
				$this.parent('li').toggleClass('isvisible');
				
				if( $this.parent('li').hasClass('isvisible') ) {
					if( $this.parent('li').hasClass('right') ) {
						$this.parent('li').removeClass('noactive').children('div').css("left", "auto");
					}
					else {
						if( $this.next('div').hasClass('dropdown_fullwidth') ) {
							$this.parent('li').removeClass('noactive').children('div').css("left", "20px");
						}
						else {
							$this.parent('li').removeClass('noactive').children('div').css("left", "0px");
						}
					}
					$this.parent('li').siblings().addClass('noactive').removeClass('isvisible').children('div').css("left", "-999em");
				}
				
				else {
					$this.parent('li').addClass('noactive').children('div').css("left", "-999em");
				}
			}
			
		});

		$('.menu').bind('touchstart', function(e) {
			e.stopPropagation();
		});
		$(document).bind('touchstart', function(){
			$(menuItemChildren).css("left", "-999em");
			$(menuItem).addClass('noactive').removeClass('isvisible');
		});

				
	}  

	openCloseMegamenu();
	
}

$(function() {
	$(".menu").megaMenu();
});
