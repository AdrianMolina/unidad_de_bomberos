/* Author: Paolo Marchetti @ Riot Design / 2013

*/
//determina l'user agent per funzioni specifiche touch
var userAgent = window.navigator.userAgent;
//Per Android, determina la versione esatta
if (userAgent.indexOf("Android") >= 0) {
	var androidversion = parseFloat(userAgent.slice(userAgent.indexOf("Android") + 8));
}
$(document).ready(function() {
	// disattiva ajax per  ie9-  e android 4.1- a causa della mancanza di supporto di 'onpopstate'
	if ($('html').hasClass("lt-ie10") || androidversion < 4.2) {} else {
		AJAX_loadPageInit("");
	}
	startup();
})
$(window).resize(function() {
	ridimensionaHero();
	var windowWidth = $(window).width();
	$('#map_canvas').css({
		'width': windowWidth
	});
});
window.onpopstate = function(event) {
	if (AJAX_started === true && AJAX_check_ignore(document.location.toString()) == true) {
		AJAX_loadPage(document.location.toString(), 1);
	}
};
// avvia tutte le funzioni primarie 

function startup() {
   //elimina delay di 300ms su touch
    //FastClick.attach(document.body);
    
	console.log('inizia startup');
	linkFlip();
	$('select').selectpicker({
		size: 8,
		width: '100%',
		style: 'input-block-level'
	});
	chiudiNavMobile();
	startFullWidthSlider();
	isotopoPortfolio();
	isotopoBlog();
	ridimensionaHero();
	usaWaypoints();
	parallasse();
	initializeGmap();
	$('.hover').hover(function() {
		$(this).addClass('flip');
	}, function() {
		$(this).removeClass('flip');
	});
	//slider per mostrare i layout responsive
	$('.res-slider').slider().on('slideStop', function(ev) {
		$('.res-slider-img img').hide().removeClass('active');
		$('.res-slider-img img.res-' + ev.value).fadeIn().addClass('active');
		$('.res-lista div').removeClass('active');
		$('.res-lista div.ico-' + ev.value).addClass('active');
	});
}
//funzioni figlie
//funzioni di reload e gestione transizioni Ajax

function AJAX_reload_code() {
	startup();
	$('footer').show();
	jQuery.get('/plugins/contact-form-7/includes/js/scripts.js', function(data) {
		eval(data);
	});
	addthis.toolbox('.addthis_toolbox');
}

function AJAX_click_code(thiss) {
	$('footer').hide();
	// attiva la pagina corrente dopo una transizione
	jQuery('ul.nav li').each(function() {
		jQuery(this).removeClass('active');
	});
	jQuery(thiss).parents('li').addClass('active');
}

function AJAX_data_code(dataa) {
	var data = dataa.replace('<body', '<body><div id="body"').replace('</body>', '</div></body>');
	var body = $(data).filter('#body');
	bodyclasses = $(body).attr('class');
	$('body').attr('class', bodyclasses);
}
// effetto flip per i link del menu

function linkFlip() {
	var supports3DTransforms = document.body.style['webkitPerspective'] !== undefined || document.body.style['MozPerspective'] !== undefined;

	function linkify(selector) {
		if (supports3DTransforms) {
			var nodes = document.querySelectorAll(selector);
			for (var i = 0, len = nodes.length; i < len; i++) {
				var node = nodes[i];
				if (!node.className || !node.className.match(/roll/g)) {
					node.className += ' roll';
					node.innerHTML = '<span data-title="' + node.text + '">' + node.innerHTML + '</span>';
				}
			};
		}
	}
	linkify('#navbar-top nav a');
}
// orologio per pagina about

function orologio() {
	$('#clock li').fadeIn();
	setInterval(function() {
		var seconds = new Date().getSeconds();
		var sdegree = seconds * 6;
		var srotate = "rotate(" + sdegree + "deg)";
		$("#sec").css({
			"-moz-transform": srotate,
			"-webkit-transform": srotate,
			"-ms-transform": srotate,
			"transform": srotate
		});
	}, 1000);
	setInterval(function() {
		var hours = new Date().getHours();
		var mins = new Date().getMinutes();
		var hdegree = hours * 30 + (mins / 2);
		var hrotate = "rotate(" + hdegree + "deg)";
		$("#hour").css({
			"-moz-transform": hrotate,
			"-webkit-transform": hrotate,
			"-ms-transform": hrotate,
			"transform": hrotate
		});
	}, 1000);
	setInterval(function() {
		var mins = new Date().getMinutes();
		var mdegree = mins * 6;
		var mrotate = "rotate(" + mdegree + "deg)";
		$("#min").css({
			"-moz-transform": mrotate,
			"-webkit-transform": mrotate,
			"-ms-transform": mrotate,
			"transform": mrotate
		});
	}, 1000);
}
//assicuriamici che la navigazione venga chiusa su mobile quando si clicca un link

function chiudiNavMobile() {
	$('.navbar ul li a').click(function() {
		$('.btn-navbar').addClass('collapsed');
		$('.navbar-collapse').removeClass('in').addClass('collapse').css('height', '0');
	});
}

function isotopoCentra() {
	$.Isotope.prototype._getCenteredMasonryColumns = function() {
		this.width = this.element.width();
		var parentWidth = this.element.parent().width();
		// i.e. options.masonry && options.masonry.columnWidth
		var colW = this.options.masonry && this.options.masonry.columnWidth ||
		// or use the size of the first item
		this.$filteredAtoms.outerWidth(true) ||
		// if there's no items, use size of container
		parentWidth;
		var cols = Math.floor(parentWidth / colW);
		cols = Math.max(cols, 1);
		// i.e. this.masonry.cols = ....
		this.masonry.cols = cols;
		// i.e. this.masonry.columnWidth = ...
		this.masonry.columnWidth = colW;
	};
	$.Isotope.prototype._masonryReset = function() {
		// layout-specific props
		this.masonry = {};
		// FIXME shouldn't have to call this again
		this._getCenteredMasonryColumns();
		var i = this.masonry.cols;
		this.masonry.colYs = [];
		while (i--) {
			this.masonry.colYs.push(0);
		}
	};
	$.Isotope.prototype._masonryResizeChanged = function() {
		var prevColCount = this.masonry.cols;
		// get updated colCount
		this._getCenteredMasonryColumns();
		return (this.masonry.cols !== prevColCount);
	};
	$.Isotope.prototype._masonryGetContainerSize = function() {
		var unusedCols = 0,
			i = this.masonry.cols;
		// count unused columns
		while (--i) {
			if (this.masonry.colYs[i] !== 0) {
				break;
			}
			unusedCols++;
		}
		return {
			height: Math.max.apply(Math, this.masonry.colYs),
			// fit container to columns that have been used;
			width: (this.masonry.cols - unusedCols) * this.masonry.columnWidth
		};
	};
}

function isotopoPortfolio() {
	var $container = $('#portfolio-blocchi');
	$container.imagesLoaded(function() {
		$container.isotope({
			itemSelector: '.element'
		});
		//   $(window).smartresize(function() {
		//			$container.isotope({
		//
		//				update columnWidth to a percentage of container width
		//				masonry: {
		//					columnWidth: $container.width() / 3
		//				}
		//			});
		//	});
	});
}

function isotopoBlog() {
	isotopoCentra();
	var $container = $('#blog-blocchi');
	$container.imagesLoaded(function() {
		$container.isotope({
			itemSelector: '.element',
			columnWidth: function(containerWidth) {
				// valori dello .span6, usato nel blog
				var width = $(window).width();
				var col = 585;
				if (width < 1200 && width >= 980) {
					col = 485;
				} else if (width < 980 && width >= 768) {
					col = 375;
				}
				return col;
			}
		});
		$(window).smartresize(function() {
			$container.isotope({
				columnWidth: function(containerWidth) {
					var width = $(window).width();
					var col = 585;
					if (width < 1200 && width >= 980) {
						col = 485;
					} else if (width < 980 && width >= 768) {
						col = 375;
					}
					console.log(col);
					return col;
				}
			});
		});
	});
}

function cambiaHeader() {
	isotopoCentra();
	//ridimensionamento del menu principale allo scroll
	var top = $(window).scrollTop();
	// if statement 
	if (top > 100) {
		if ($('.navbar-inner').hasClass('ridotta') == false) {
			$('.navbar-inner').addClass('ridotta');
		}
	} else if (top < 100) {
		if ($('.navbar-inner').hasClass('ridotta') == true) {
			$('.navbar-inner').removeClass('ridotta');
			$('.navbar-inner').animate({
				marginTop: '0'
			}, {
				queue: false,
				duration: 100
			}, function() {});
		}
	}
}

function usaWaypoints() {
	if (userAgent.match(/iPad/i) || userAgent.match(/iPhone/i) || userAgent.match(/iPod/i)) {
		generaChartVisite();
		generaChartGlobale();
		return; // non attivare
	} else {
		// by default your element will be hidden
		$('.fadeWp').css("opacity", 0);
		// call waypoint plugin
		$('.fadeWp').waypoint(function(event, direction) {
			// do your fade in here
			$(this).animate({
				"opacity": 1
			}, {
				queue: true,
				duration: 1000
			});
		}, {
			offset: '100%'
		});
		// by default your element will be hidden
		$('#visite').css("opacity", 0);
		// call waypoint plugin
		$('#visite').waypoint(function(event, direction) {
			// do your fade in here
			if ($(this).css("opacity") == 0) {
				$(this).animate({
					"opacity": 1
				}, {
					queue: true,
					duration: 500
				});
				generaChartVisite();
			}
		}, {
			offset: '100%'
		});
		// by default your element will be hidden
		$('#globale').css("opacity", 0);
		// call waypoint plugin
		$('#globale').waypoint(function(event, direction) {
			// do your fade in here
			if ($(this).css("opacity") == 0) {
				$(this).animate({
					"opacity": 1
				}, {
					queue: true,
					duration: 500
				});
				generaChartGlobale();
			}
		}, {
			offset: '100%'
		});
	}
}

function startFullWidthSlider() {
	$('a.lead-link').bind('click', function(e) {
		e.preventDefault();
		$('html,body').animate({
			scrollTop: $(this.hash).offset().top - 60
		}, 1500);
	});
	if ($(window).width() < 768) {
		$('.royalSlider .rsImg').each(function() {
			var element = $(this);
			//sostituissi l'href con la versione ridotta per mobile (cosi' e' come finiscono le thumb ridotte di wp)
		
			this.href = this.href.replace("-1920x1300", "");

			this.href = this.href.replace(".jpg", "-960x650.jpg");
		});
	}
	if ($('#full-width-slider').length) {
		var windowHeight = $(window).height();
		var windowWidth = $(window).width();
		$('#full-width-slider').css({
			'height': windowHeight,
			'width': windowWidth
		});
		if ($('body').hasClass("home")) {
			var transizione = 'move';
		} else {
			var transizione = 'fade';
		}
		$('#full-width-slider').royalSlider({
			arrowsNav: true,
			loop: true,
			keyboardNavEnabled: true,
			controlsInside: true,
			imageScaleMode: 'fill',
			arrowsNav: false,
			controlNavigation: 'bullets',
			thumbsFitInViewport: false,
			navigateByClick: false,
			startSlideId: 0,
			numImagesToPreload: 2,
			autoPlay: {
				// autoplay options go gere
				enabled: false,
				pauseOnHover: true,
				delay: 8000
			},
			height: windowHeight,
			width: windowWidth,
			transitionType: transizione,
			globalCaption: false,
			slidesSpacing: 0,
			randomizeSlides: true,
			fadeinLoadedSlide: true,
			addActiveClass: true
		});
		$('#full-width-slider').css({
			'width': '100%'
		});
		// or globally
		var slider = $(".royalSlider").data('royalSlider');
		slider.ev.on('rsAfterContentSet', function(e, slideObject) {
			parallasseRs();
			console.log('slide cambiato');
			$(".royalSlider").addClass('pronto');
			
			if ($('#clock').length) {
				orologio();
			}
		});
	}
}

function ridimensionaHero() {
	var windowHeight = $(window).height();
	$('#full-width-slider').css({
		'height': windowHeight
	});
	if ($(window).width() >= 768) {
		$('#map_canvas, .mappa-overlay').css({
			'min-height': windowHeight
		});
		$('.royalSlider .rsImg').each(function() {
			var element = $(this);
			//sostituissi l'href con la versione full
			this.src = this.src.replace("-960x650.jpg", ".jpg");
		});
	} else {
		$('#map_canvas').css({
			'min-height': '300px'
		});
	}
}
// parallasse molto base e leggero, utilizzabile su immagini background css

function parallasse() {
	if (userAgent.match(/iPad/i) || userAgent.match(/iPhone/i) || userAgent.match(/iPod/i)) {
		return; // non attivare
	} else {
		var $window = $(window);
		$('section[data-type="background"]').each(function() {
			$(this).css('background-attachment', 'fixed').css('background-position', '50% -800px');
			var $bgobj = $(this); // assigning the object
			$(window).scroll(function() {
				// Scroll the background at var speed
				// the yPos is a negative value because we're scrolling it UP!
				var yPos = -(($window.scrollTop() - $bgobj.offset().top) / $bgobj.data('speed'));
				var coords = '50% ' + yPos.toFixed(0) + 'px';
				// Move the background
				$bgobj.css({
					backgroundPosition: coords
				});
			});
		});
		document.createElement("article");
		document.createElement("section");
	}
}

// parallasse per immagini bg RS

function parallasseRs() {
	if (userAgent.match(/iPad/i) || userAgent.match(/iPhone/i) || userAgent.match(/iPod/i)) {
		return; // non attivare
	} else {
		
		var $window = $(window);
		
					
		function scrollHandler() {		
			var $bgobj = $('.rsActiveSlide img.rsMainSlideImage, #map_canvas'); // assigning the object	
            if ($bgobj.length) {
				var yPos = (($window.scrollTop() - $bgobj.offset().top + parseInt($bgobj.css('margin-top'), 10)) / 1.4);
				
              if ($(window).scrollTop() + $(window).height() > $(document).height()) return;
              $bgobj.css({ top: yPos + 'px' });    

				//if (yPos >= 0) { //fix per il bounce di mountain lion, evita top negativi
				//	// Move the background
				//	  $bgobj.css({ top: yPos + 'px' });

				//}
				
				
				// si assicura che il parallasse torni a 0 quando lo scroll e' a 0
				//if ($window.scrollTop() == 0) {
				//	$bgobj.css({
				//		top: 0 + 'px'
				//	});
				//}
			}		
		}
		
		
		$(window).on('scroll', function() {
			
			window.requestAnimationFrame(scrollHandler);
	   	});
	   	
	   	
	   	
	}
}
/**************************************************
 GOOGLEMAPS PER PAGINA CONTATTI 
 **************************************************/
function initializeGmap() {
	if ($('#map_canvas').length) {
		var windowWidth = $(window).width();
		$('#map_canvas').css({
			'width': windowWidth
		});
		parallasseRs();
		if (document.getElementById("map_canvas") != null) {
			var latlng = new google.maps.LatLng(43.72049, 10.95605);
			var marker;
			var map;
			if (windowWidth >= 768) {
				var centermap = new google.maps.LatLng(54.03787, 33.75000);
				var myOptions = {
					zoom: 4,
					center: centermap,
					scrollwheel: false,
					mapTypeId: google.maps.MapTypeId.ROADMAP,
					zoomControl: false,
					zoomControlOptions: {
						position: google.maps.ControlPosition.LEFT_BOTTOM
					},
					disableDefaultUI: true
				};
			} else {
				var centermap = new google.maps.LatLng(43.72449, 10.95605);
				var myOptions = {
					zoom: 14,
					center: centermap,
					scrollwheel: false,
					draggable: false,
					mapTypeId: google.maps.MapTypeId.ROADMAP,
					zoomControl: true,
					zoomControlOptions: {
						position: google.maps.ControlPosition.LEFT_BOTTOM
					},
					disableDefaultUI: true
				};
			}
			var minimal = [{
				"featureType": "landscape",
				"stylers": [{
					"visibility": "simplified"
				}, {
					"saturation": -100
				}, {
					"gamma": 4.33
				}, {
					"lightness": -2
				}]
			}, {
				"featureType": "poi",
				"stylers": [{
					"visibility": "off"
				}]
			}, {
				"featureType": "water",
				"stylers": [{
					"saturation": -100
				}, {
					"lightness": 15
				}]
			}, {
				"featureType": "road.highway",
				"stylers": [{
					"visibility": "off"
				}]
			}, {
				"featureType": "road.arterial",
				"stylers": [{
					"visibility": "simplified"
				}, {
					"saturation": -100
				}]
			}, {
				"featureType": "administrative.locality",
				"stylers": [{
					"visibility": "on"
				}, {
					"saturation": -100
				}, {
					"gamma": 2.81
				}, {
					"lightness": -8
				}]
			}, {
				"featureType": "administrative.country",
				"elementType": "labels",
				"stylers": [{
					"visibility": "off"
				}]
			}, {
				"featureType": "administrative.country",
				"stylers": [{
					"lightness": -57
				}, {
					"gamma": 8.55
				}, {
					"saturation": -100
				}]
			}, {}, {
				"featureType": "road",
				"elementType": "labels",
				"stylers": [{
					"visibility": "off"
				}]
			}, {
				"featureType": "administrative.province",
				"stylers": [{
					"hue": "#00ffd5"
				}, {
					"saturation": 18
				}, {
					"visibility": "off"
				}]
			}, {
				"featureType": "administrative",
				"stylers": [{
					"saturation": -100
				}]
			}, {
				"featureType": "water",
				"stylers": [{
					"lightness": -51
				}]
			}, {
				"featureType": "water",
				"stylers": [{
					"lightness": 72
				}]
			}, {
				"featureType": "water"
			}, {
				"featureType": "administrative",
				"elementType": "geometry"
			}, {}];
			var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
			map.setOptions({
				styles: minimal
			});
			var dropshadow = new google.maps.MarkerImage("http://riotdesign.eu/assets/img/shadow.png", null, null, null, new google.maps.Size(82, 32));
			var image = new google.maps.MarkerImage("http://riotdesign.eu/assets/img/marker.png", null, null, null, new google.maps.Size(47, 56));
			var marker = new google.maps.Marker({
				map: map,
				title: "Segno Studio Creativo",
				animation: google.maps.Animation.DROP,
				position: latlng,
				icon: image,
				shadow: dropshadow
			});
		}
	}
}

function generaChartGlobale() {
	if ($("html:not(.lt-ie8) #globale").length) {
		var globaleChart = $("#globale").get(0).getContext("2d");
		var globaleData = [{
			value: 65,
			color: "#4db07a"
		}, {
			value: 16,
			color: "#5c91b5"
		}, {
			value: 14,
			color: "#e86d4c"
		}, {
			value: 7,
			color: "#eac85d"
		}]
		var globaleOptions = {
			segmentShowStroke: true,
			segmentStrokeColor: "#fff",
			segmentStrokeWidth: 4,
			percentageInnerCutout: 50,
			animation: true,
			animationSteps: 100,
			animationEasing: "easeOutQuart",
			animateRotate: true,
			animateScale: false,
			onAnimationComplete: null
		}
		var globale = new Chart(globaleChart).Doughnut(globaleData, globaleOptions);
	}
}

function generaChartVisite() {
	if ($("html:not(.lt-ie8)  #visite").length) {
		var visiteChart = $("#visite").get(0).getContext("2d");
		var visiteData = {
			labels: ["05/2011", "11/2011", "05/2012", "11/2012", "05/2013", "09/2013"],
			datasets: [{
				fillColor: "rgba(92,145,181,0.5)",
				strokeColor: "rgba(92,145,181,1)",
				pointColor: "rgba(92,145,181,1)",
				pointStrokeColor: "#fff",
				data: [0, 1.4, 8.6, 14.2, 17.1, 32.6]
			}]
		}
		var visiteOptions = {
			scaleOverride: true,
			scaleSteps: 9,
			scaleStepWidth: 4,
			scaleStartValue: 0,
			scaleLineColor: "rgba(235,238,237,1)",
			scaleLineWidth: 1,
			scaleShowLabels: true,
			scaleLabel: "<%=value%> k",
			scaleFontFamily: "'Museo500Regular'",
			scaleFontSize: 12,
			scaleFontStyle: "normal",
			scaleFontColor: "#888",
			scaleShowGridLines: true,
			scaleGridLineColor: "rgba(235,238,237,1)",
			scaleGridLineWidth: 1,
			bezierCurve: false,
			pointDot: true,
			pointDotRadius: 3,
			pointDotStrokeWidth: 1,
			datasetStroke: true,
			datasetStrokeWidth: 2,
			datasetFill: true,
			animation: true,
			animationSteps: 60,
			animationEasing: "easeOutQuart",
			onAnimationComplete: null
		}
		var visite = new Chart(visiteChart).Line(visiteData, visiteOptions);
	}
} /*  Variabili per ajax reload */
checkjQuery = false;
jQueryScriptOutputted = false;
//Content ID
var AJAX_content = 'contenuto';
//Search Class
var AJAX_search_class = 'form-search';
var AJAX_ignore_string = new String('#, /wp-, .pdf, .zip, .rar');
var AJAX_ignore = AJAX_ignore_string.split(', ');
var AJAX_track_analytics = true;
var AJAX_scroll_top = true;
var AJAX_warnings = false;
var AJAX_reloadDocumentReady = false;
//Dont mess with these...
var AJAX_isLoad = false;
var AJAX_started = false;
var AJAX_searchPath = null;
var AJAX_ua = jQuery.browser;
//urls
var AAPLsiteurl = "http://riotdesign.eu";
var AAPLhome = "http://riotdesign.eu";
var AAPLloadingIMG = jQuery('<img/>').attr('src', '');
var AAPLloadingDIV = jQuery('<div/>').attr('style', 'display:none;').attr('id', 'ajaxLoadDivElement');
AAPLloadingDIV.appendTo('body');
AAPLloadingIMG.appendTo('#ajaxLoadDivElement');
//Loading/Error Code
var str = "<center class=\"loader\">\r\n\r\n<\/center>";
var AJAX_loading_code = str.replace('{loader}', AAPLloadingIMG.attr('src'));
str = "<center class=\"loader\">\r\n\t<p style=\"text-align: center !important;\">Error!<\/p>\r\n\t<p style=\"text-align: center !important;\">\r\n\t\tErrore: la pagina non è stata caricata.\r\n\t<\/p>\r\n<\/center>";
var AJAX_loading_error_code = str.replace('{loader}', AAPLloadingIMG.attr('src')); /* funzione principale ajax reload */

function AJAX_loadPageInit(scope) {
	jQuery(scope + "a:not(.noajax)").click(function(event) {
		//if its not an admin url, or doesnt contain #
		if (this.href.indexOf(AAPLhome) >= 0 && AJAX_check_ignore(this.href) == true && $( "body" ).hasClass( "logged-in" ) === false ) {
			// stop default behaviour
			event.preventDefault();
			// remove click border
			this.blur();
			// get caption: either title or name attribute
			var caption = this.title || this.name || "";
			// get rel attribute for image groups
			var group = this.rel || false;
			//Load click code - pass reference.
			try {
				AJAX_click_code(this);
			} catch (err) {
				if (AJAX_warnings == true) {
					txt = "ERROR: \nThere was an error with click_code.\n";
					txt += "Error description: " + err.message;
					alert(txt);
				}
			}
			// display the box for the elements href
			AJAX_loadPage(this.href);
		}
	});
}

function AJAX_loadPage(url, push, getData) {
	if (!AJAX_isLoad) {
		AJAX_isLoad = true;
		//enable onpopstate
		AJAX_started = true;
		//AJAX Load page and update address bar url! :)
		//get domain name...
		nohttp = url.replace("http://", "").replace("https://", "");
		firstsla = nohttp.indexOf("/");
		pathpos = url.indexOf(nohttp);
		path = url.substring(pathpos + firstsla);
		//Only do a history state if clicked on the page.
		if (push != 1) {
			//TODO: implement a method for IE
			if (typeof window.history.pushState == "function") {
				var stateObj = {
					foo: 1000 + Math.random() * 1001
				};
				history.pushState(stateObj, "ajax page loaded...", path);
			}
		}
		
		
		//start changing the page content.
		
		 var contentHeight = jQuery('#' + AJAX_content).height();
	    
	    jQuery('#' + AJAX_content).css("height", contentHeight+"px");  //applica manualmente l'altezza del contenuto
	    
		
		jQuery('#' + AJAX_content).fadeOut(function() {
			jQuery('#navbar-top').fadeOut();
			document.getElementById(AJAX_content).innerHTML = AJAX_loading_code;
			if (AJAX_scroll_top == true) {
				jQuery('html,body').scrollTop(0);
			}
			jQuery('#' + AJAX_content).fadeIn(function() {
				jQuery.ajax({
					type: "GET",
					url: url,
					data: getData,
					cache: false,
					dataType: "html",
					success: function(data) {
						AJAX_isLoad = false;
						jQuery('#navbar-top').fadeIn();
						//get title attribute
						datax = data.split('<title>');
						titlesx = data.split('</title>');
						if (datax.length == 2 || titlesx.length == 2) {
							datax = data.split('<title>')[1];
							titles = data.split('</title>')[0];
							//set the title?
							jQuery(document).attr('title', (jQuery("<div/>").html(titles).text()));
						}
						//Google analytics?
						if (AJAX_track_analytics == true) {
							if (typeof _gaq != "undefined") {
								if (typeof getData == "undefined") {
									getData = "";
								} else {
									getData = "?" + getData;
								}
								_gaq.push(['_trackPageview', path + getData]);
							} else {
								if (AJAX_warnings == true) {
									alert("WARNING: \nAnalytics non è stato inizializzato!");
								}
							}
						}
						try {
							AJAX_data_code(data);
						} catch (err) {
							if (AJAX_warnings == true) {
								txt = "ERROR: \n c'è un errore con data_code.\n";
								txt += "Error description: " + err.message;
								alert(txt);
							}
						}
						//get content
						data = data.split('id="' + AJAX_content + '"')[1];
						data = data.substring(data.indexOf('>') + 1);
						var depth = 1;
						var output = '';
						while (depth > 0) {
							temp = data.split('</div>')[0];
							//count occurrences
							i = 0;
							pos = temp.indexOf("<div");
							while (pos != -1) {
								i++;
								pos = temp.indexOf("<div", pos + 1);
							}
							//end count
							depth = depth + i - 1;
							output = output + data.split('</div>')[0] + '</div>';
							data = data.substring(data.indexOf('</div>') + 6);
						}
						//put the resulting html back into the page!
						document.getElementById(AJAX_content).innerHTML = output;
						
						jQuery('#' + AJAX_content).css("height", 'auto'); //reimposta height automatica



						//move content area so we cant see it.
						jQuery('#' + AJAX_content).css("position", "absolute");
						jQuery('#' + AJAX_content).css("left", "20000px");
						//show the content area
						jQuery('#' + AJAX_content).show();
						//recall loader so that new URLS are captured.
						AJAX_loadPageInit("#" + AJAX_content + " ");
						if (AJAX_reloadDocumentReady == true) {
							jQuery(document).trigger("ready");
						}
						try {
							AJAX_reload_code();
						} catch (err) {
							if (AJAX_warnings == true) {
								txt = "ERROR: \nC'è un errore con reload_code.\n";
								txt += "Error description: " + err.message;
								alert(txt);
							}
						}
						//now hide it again and put the position back!
						jQuery('#' + AJAX_content).hide();
						jQuery('#' + AJAX_content).css("position", "");
						jQuery('#' + AJAX_content).css("left", "");
						jQuery('#' + AJAX_content).fadeIn("slow", function() {});
					},
					error: function(jqXHR, textStatus, errorThrown) {
						//Would append this, but would not be good if this fired more than once!!
						AJAX_isLoad = false;
						document.title = "Error loading requested page!";
						if (AJAX_warnings == true) {
							txt = "ERROR: \nThere was an error with AJAX.\n";
							txt += "Error status: " + textStatus + "\n";
							txt += "Error: " + errorThrown;
							alert(txt);
						}
						document.getElementById(AJAX_content).innerHTML = AJAX_loading_error_code;
					}
				});
			});
		});
	}
}



function AJAX_check_ignore(url) {
	for (var i in AJAX_ignore) {
		if (url.indexOf(AJAX_ignore[i]) >= 0) {
			return false;
		}
	}
	return true;
}