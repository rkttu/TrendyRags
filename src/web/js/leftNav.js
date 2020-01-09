// JavaScript Document

function isIE() {
	return (navigator.userAgent.indexOf("MSIE") != -1);
}

var theHandle, theRoot, theThumb, theScroll;
var thumbTravel, ratio;

var distanceFromLeft = 3;
var distanceFromTop = 118;
var spotToStarDragDistanceFromLeft = 147;
var scrollLength = 450;

var scrollPullBarDistanceFromLeft = 151;
var bottomLimitOfScrollPullBarDistanceFromTop = (isIE()) ? 473 : 471;
/*note: heightOfTheThumb is duplicated in thumb div*/
var heightOfTheThumb = 78;


theScroll = new ypSimpleScroll("scroll", distanceFromLeft, distanceFromTop - 7, spotToStarDragDistanceFromLeft, scrollLength);

function intializeLeftNav() {
	//
	theHandle = document.getElementById("handle");
	theRoot   = document.getElementById("root");
	theThumb  = document.getElementById("thumb");
	//if the thumb is null we don't have a scroll bar and we don't want a 
		// javascript error.
	if ( theThumb == null ) {
		return;
	}
	
	if (theRoot.addEventListener)
        /** DOMMouseScroll is for mozilla. */
       theRoot.addEventListener('DOMMouseScroll', wheel, false);

	theScroll.load();

	Drag.init(theHandle, theRoot);
	Drag.init(theThumb, null, scrollPullBarDistanceFromLeft, scrollPullBarDistanceFromLeft, distanceFromTop, bottomLimitOfScrollPullBarDistanceFromTop);

	// the number of pixels the thumb can travel vertically (max - min)
	thumbTravel = theThumb.maxY - theThumb.minY;

	// the ratio between scroller movement and thumbMovement
	ratio = theScroll.scrollH / thumbTravel;

	theThumb.onDrag = function(x, y) {
		theScroll.jumpTo(null, Math.round((y - theThumb.minY) * ratio));
	}


	var bottomBorderOfBrandsList = $('scrollContent').getDimensions().height;
	
	/*
	* IF we don't have enought brands then we should not display 
	* scrolling functionality.
	*/
	if(bottomBorderOfBrandsList < scrollLength) {
		var leftNavHandle = document.getElementById("thumb");
		leftNavHandle.style.display="none";
		
		
		var scrollUpImage = document.getElementById("scrollUpImage");
		var scrollDownImage = document.getElementById("scrollDownImage");
		var scrollBarSeparatorTopCell = document.getElementById("scrollBarSeparatorTopCell");
		var scrollBarSeparatorBottomCell = document.getElementById("scrollBarSeparatorBottomCell");
		var scrollBarSeparatorCenterCell = document.getElementById("scrollBarSeparatorCenterCell");

		scrollUpImage.style.display="none";
		scrollDownImage.style.display="none";
		scrollBarSeparatorTopCell.style.backgroundColor = "#595959";
		scrollBarSeparatorBottomCell.style.backgroundColor = "#595959";
		scrollBarSeparatorCenterCell.style.backgroundColor = "#595959";
	}

}


/*Event Handling follows*/

// indicates whether the scroll bar should be moving currently
var stop = true;
// timer for smooth motion scrolling
var scrollTimer;
// delay between movement to make motion appear smooth
var delay = 10;



function handleMouseDownOnDownArrow() {
	stop = false;
	scrollDown();
}

function handleMouseDownOnUpArrow() {
	stop = false;
	scrollUp();
}

function handleMouseDown(event) {
	stop = false;
	y = event.clientY
	var topOfThumb = parseInt(theThumb.style.top);
	var bottomOfThumb = topOfThumb + heightOfTheThumb;
	if ( bottomOfThumb < y ) {
		scrollDown(y - heightOfTheThumb);
	} else if (  topOfThumb > y ) { 
		scrollUp(y);
	}
	
}


// stops on mouse up
function handleMouseUp() {
	clearTimer(scrollTimer);	
}

// stops on mouse out
function handleMouseOut() {
	clearTimer(scrollTimer);	
}

// moves scroll up until scrollTimer is cleared
function scrollUp(vertical) {
	if ( theThumb == null ) {
		return;
	}
	x = parseInt(theThumb.style.top);
	if (stop 
		|| x <= distanceFromTop
		|| vertical != null && x <= vertical ) {
		return;
	}
	
	x = x - 1;
	theThumb.onDrag(null, x);
	theThumb.style.top=x + "px";
	scrollTimer = setTimeout('scrollUp('+ vertical +')', delay);

}

// moves scroll down until scrollTimer is cleared
function scrollDown(vertical) {
	if ( theThumb == null ) {
		return;
	}
	x = parseInt(theThumb.style.top);
	if (stop 
		|| x >= bottomLimitOfScrollPullBarDistanceFromTop
		|| vertical != null && x >= vertical ) {
		return;
	}
	
	x = x + 1;
	theThumb.onDrag(null, x);
	theThumb.style.top=x + "px";
	scrollTimer = setTimeout('scrollDown('+ vertical +')', delay);
}
	
// clears timer
function clearTimer(timer) {
   	if (timer) clearTimeout(timer);
   	timer = null;
   	stop = true;
}


/* Mouse wheel event handling */

/* wheels down smoothly.
amount is the number of pixels to move down.
*/
function wheelDown(id, amount) {
	var target = document.getElementById(id);
	if ( target == null ) {
		return;
	}
	x = parseInt(target.style.top);
	if (x >= bottomLimitOfScrollPullBarDistanceFromTop || amount == 0) {
		return;
	}
	
	x = x + 1;
	target.onDrag(null, x);
	target.style.top=x + "px";
	amount = amount - 1;
	scrollTimer = setTimeout('wheelDown("'+ id +'", '+amount+')', delay);
}

/* wheels up smoothly
amount is the number of pixels to move up.
*/
function wheelUp(id, amount) {
	var target = document.getElementById(id);
	if ( target == null ) {
		return;
	}
	x = parseInt(target.style.top);
	if (x <= distanceFromTop || amount == 0) {
		return;
	}
	
	x = x - 1;
	target.onDrag(null, x);
	target.style.top=x + "px";
	amount = amount - 1;
	scrollTimer = setTimeout('wheelUp("'+ id +'", '+amount+')', delay);

}


/** This is high-level function.
 * It must react to delta being more/less than zero.
 */
function handle(id, delta) {
	    if ( delta < 0 ) {
			wheelDown(id, Math.abs(delta) * 10);
		} else if ( delta > 0 ) {
			wheelUp(id, delta * 10);
		}
}

/** Event handler for mouse wheel event.
 */
function wheel(event){
        var delta = 0;
        if (!event) /* For IE. */
                event = window.event;
        if (event.wheelDelta) { /* IE/Opera. */
                delta = event.wheelDelta/120;
                /** In Opera 9, delta differs in sign as compared to IE.
                 */
                if (window.opera)
                        delta = -delta;
        } else if (event.detail) { /** Mozilla case. */
                /** In Mozilla, sign of delta is different than in IE.
                 * Also, delta is multiple of 3.
                 */
                delta = -event.detail/3;
        }
        /** If delta is nonzero, handle it.
         * Basically, delta is now positive if wheel was scrolled up,
         * and negative, if wheel was scrolled down.
         */
 
        if (delta)
                handle("thumb", delta);
                

	/** Prevent default actions caused by mouse wheel.
         * That might be ugly, but we handle scrolls somehow
         * anyway, so don't bother here..
         */
       if (event.preventDefault) {
                event.preventDefault();
		} 
        event.returnValue = false;
}
