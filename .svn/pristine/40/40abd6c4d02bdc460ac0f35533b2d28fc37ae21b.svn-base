stop();

var focusListener:Object = new Object ();
focusListener.onSetFocus = function (oldFocus, newFocus) {
    if (newFocus instanceof TextField) {
        newFocus.borderColor = 0x000000;
    }
    if (oldFocus != undefined && oldFocus instanceof TextField) {
        oldFocus.borderColor = 0x999999;
    }
};
Selection.addListener (focusListener);

pr.onRelease = function(){
	if(allow_print != '1') return false;
	
	var pj = new PrintJob();
	pj.start();
	old_pagenr=pagenr;
	pagenr = 1;
	old_zoomtype=zoomtype;
	zoomtype = "2";
	old_zoom=zoom;
    setNoScrollZoomLevel();
	while(pagenr <= swf._totalframes) {
			setPageNr();
			pj.addPage("swf");
			pagenr = pagenr + 1;
	}
	pagenr=old_pagenr;
	setPageNr();
	zoom=old_zoom;
	zoomtype = old_zoomtype;
	if (zoomtype != "1"){
		if (zoomtype != "2"){
			setOneDirScrollZoomLevel();
		}else{
			setNoScrollZoomLevel();
		}
	}else{
		set11ZoomLevel();
	}

	pj.send();
	delete pj;
};


a1.onRelease = function (){
	if(allow_clipboard != '1') return false;
	
	if(Key.isDown(16)) return;	
	if(!my_snap) _root.my_snap = swf.getTextSnapshot();
	var count:Number = my_snap.getCount();
	seltxt=my_snap.getSelectedText(true);
	if(!seltxt){
		my_snap.setSelectColor(0xcccccc); // Set the selection color to red.
		my_snap.setSelected(0, count, true); // Select	
		seltxt=my_snap.getSelectedText(true);
	}
	System.setClipboard(seltxt);
	setTimeout(clearSel,1000);
}
c1.onRelease = function (){
	if(allow_search != '1') return false;

	if(Key.isDown(16)) return;
	st.text="";
	my_snap=null;
}
s1.onRelease = function(){
	if(allow_search != '1') return false;

	if(Key.isDown(16)) return;
	if(!my_snap) _root.my_snap = swf.getTextSnapshot();
	hltext(st.text);
	if(!st.text) my_snap=null;
}
et.onChanged = function(){
	if(allow_pager != '1') return false;

	if(et.text>swf._totalframes) et.text=swf._totalframes;
	pagenr=int(et.text);
	trace(pagenr);
	swf.gotoAndStop(et.text);
}
et.onSetFocus = function(){
	if(allow_pager != '1') return false;

	et.text='';	
	Selection.setFocus (this);
}
et.onKillFocus = function (){
	if(allow_pager != '1') return false;

	setPageNr();
}

l1.onRelease = function ()
{
	if(allow_pager != '1') return false;

	if(Key.isDown(16)) return;
	Selection.setFocus (null);
	if (pagenr > 1)
    {
        pagenr = pagenr - 1;
        setPageNr();

    } // end if
};
r1.onRelease = function ()
{
	if(allow_pager != '1') return false;

	if(Key.isDown(16)) return;
	Selection.setFocus (null);
    if (pagenr < swf._totalframes)
    {
        pagenr = pagenr + 1;
        setPageNr();
    } // end if
};
p1.onRelease = function ()
{
   	if(Key.isDown(16)) return;
	if (zoom < 4)
    {
		zoomtype=4;
		zoom = zoom + 1;
        setZoomLevel();
    } // end if
};
m1.onRelease = function ()
{
	if(Key.isDown(16)) return;    
	if (zoom > 1)
    {
		zoomtype=4;
		zoom = zoom - 1;
        if (zoom < 1)
        {
            zoom = 1;
        } // end if
        setZoomLevel();
    } // end if
};
o1.onRelease = function ()
{
	if(Key.isDown(16)) return;
	zoomtype = "2";
    setNoScrollZoomLevel();
};
z1.onRelease = function ()
{
   	if(Key.isDown(16)) return;
	zoomtype=3;
	setOneDirScrollZoomLevel();
};
f1.onRelease = function (){
	if(allow_fullscreen != '1') return false;
	
	if(Key.isDown(16)) return;
	trace(Stage["displayState"]);
	if(Stage["displayState"] == "normal"){
        Stage["displayState"] = "fullScreen";
    }else{
        Stage["displayState"] = "normal";
    }
}
//66

FirstCaracter = -1;
textDown = function() {
if(Key.isDown(16)){	
   // find which character the mouse pointer is over (if any)
   trace(swf._xmouse + " - " + _xmouse);
   FirstCaracter = my_snap.hitTestTextNearPos(swf._xmouse, swf._ymouse, 0);
   trace(FirstCaracter);
   // deselect everything
   my_snap.setSelected(0, my_snap.getCount(), false);
}
};

textUp = function() {
	if(Key.isDown(16)){
		if (FirstCaracter>=0) {
			LastCaracter = my_snap.hitTestTextNearPos(swf._xmouse, swf._ymouse, 0);
   			if (FirstCaracter != LastCaracter) {
	  			// select the zone
   				if (FirstCaracter < LastCaracter) {
					my_snap.setSelected(FirstCaracter, LastCaracter+1, true);
				}else {
					my_snap.setSelected(LastCaracter,FirstCaracter+1,  true);
				}
			}
			FirstCaracter = -1;
			LastCaracter = -1;
		}
	}
};

textMove = function() {
	if(Key.isDown(16)){	
	   if (FirstCaracter != -1) {
			// deselect everything to update selection
			my_snap.setSelected(0, my_snap.getCount(), false);
	   }
	   if (FirstCaracter>=0) {
			LastCaracter = my_snap.hitTestTextNearPos(swf._xmouse, swf._ymouse, 0);
			if (FirstCaracter < LastCaracter) {
				my_snap.setSelected(FirstCaracter, LastCaracter+1, true);
			}else{
				my_snap.setSelected(LastCaracter,FirstCaracter+1,  true);
			}
		}
		scrollIfNeeded(_xmouse,_ymouse);
	}
};

scrollIfNeeded = function(xm,ym){
	if(ym>areabutton._y+areabutton._yscale){
		trace("out");
		Dragging = "v";
		vscrollbar._y+=_root.mydelta;
	}else{
		if(ym<areabutton._y){
			trace("out");
			Dragging = "v";
			vscrollbar._y-=_root.mydelta;
		}
	}
	if(xm>areabutton._x+areabutton._xscale){
		trace("out");
		Dragging = "h";
		hscrollbar._x+=_root.mydelta;
	}else{
		if(xm<areabutton._x){
			trace("out");
			Dragging = "h";
			hscrollbar._x-=_root.mydelta;
		}
	}
	if(xm>areabutton._x && xm<areabutton._x+areabutton._xscale && ym>areabutton._y && ym<areabutton._y+areabutton._yscale){
		Dragging = "";
	}
}

abPress = function(){
	if(!Key.isDown(16)){
		startDrag(swf,false, left - scrollxrange, top - scrollyrange, left, top);
    	Dragging = "xy";
		this.useHandCursor=true;
	}
}


abRelease = function(){
	if(!Key.isDown(16)){
	    swf.stopDrag();
    	Dragging = "";
	}
}



areabutton.onPress=abPress;
areabutton.onRelease=abRelease;
areabutton.onReleaseOutside=abRelease;
areabutton.dragOut=abRelease;


//43
vsPress = function (){
	if(Key.isDown(16)) return;
    startDrag(this,false, _root.fullwidth - 22, 40, _root.fullwidth - 22, 40 + _root.scrollbaryrange);
    Dragging = "v";
}
vsRelease = function (){
    stopDrag();
	refreshDrag();
    Dragging = "";
}

vscrollbar.onPress=vsPress;
vscrollbar.onRelease=vsRelease;
vscrollbar.onReleaseOutside=vsRelease;
vscrollbar.dragOut=vsRelease;

//53
hsPress = function(){
	if(Key.isDown(16)) return;
    startDrag(this, false, 10, _root.fullheight - 22, 10 + _root.scrollbarxrange, _root.fullheight - 22);
    Dragging = "h";
}
hsRelease = function(){
    stopDrag();
	refreshDrag();
    Dragging = "";
}

hscrollbar.onPress=hsPress;
hscrollbar.onRelease=hsRelease;
hscrollbar.onReleaseOutside=hsRelease;
hscrollbar.dragOut=hsRelease;

a1.onRollOver = function() {
	tt.showTip("Copy to Clipboard");
}
a1.onRollOut = function() {
	tt.removeTip();
}
c1.onRollOver = function() {
	tt.showTip("Clear Search");
}
c1.onRollOut = function() {
	tt.removeTip();
}
l1.onRollOver = function() {
	tt.showTip("Previous Page");
}
l1.onRollOut = function() {
	tt.removeTip();
}
r1.onRollOver = function() {
	tt.showTip("Next Page");
}
r1.onRollOut = function() {
	tt.removeTip();
}

p1.onRollOver = function() {
	tt.showTip("Zoom In");
}
p1.onRollOut = function() {
	tt.removeTip();
}
m1.onRollOver = function() {
	tt.showTip("Zoom Out");
}
m1.onRollOut = function() {
	tt.removeTip();
}
z1.onRollOver = function() {
	tt.showTip("Zoom Best Fit");
}
z1.onRollOut = function() {
	tt.removeTip();
}
o1.onRollOver = function() {
	tt.showTip("Zoom Show All");
}
o1.onRollOut = function() {
	tt.removeTip();
}

s1.onRollOver = function() {
	tt.showTip("Search");
}
s1.onRollOut = function() {
	tt.removeTip();
}
f1.onRollOver = function() {
	tt.showTip("Full Screen");
}
f1.onRollOut = function() {
	tt.removeTip();
}

pr.onRollOver = function() {
	tt.showTip("Print");
}
pr.onRollOut = function() {
	tt.removeTip();
}


// Creating the listener object

mouseListener = new Object();

mouseListener.onMouseWheel = function (delta) {
	trace(hscrollbar._x+" - "+hscrollbar._width+" - "+_root.fullwidth);
	trace(_root.Dragging);
	if(_root.Zooming){
		if(delta>0){
			p1.onRelease();
		}else{
			m1.onRelease();			
		}
		return;
	}
	if(Dragging == "h"){
		hscrollbar._x-=delta*3;
		if(hscrollbar._x<10) hscrollbar._x=10;		
		if(hscrollbar._x+hscrollbar._width +26>= _root.fullwidth){
			hscrollbar._x=_root.fullwidth-hscrollbar._width-26;
		}
		
	}else{
		Dragging = "v";
		vscrollbar._y-=delta*3;
		if(vscrollbar._y<40) vscrollbar._y=40;			
		if(vscrollbar._y+vscrollbar._height +25>= _root.fullheight){
			vscrollbar._y=_root.fullheight-vscrollbar._height-25;
		}
	}
	
	refreshDrag();
} 

// Registering the listener to the Mouse object

Mouse.addListener(mouseListener);

/*

You may also want to try the following sample:

mcForMouseWheel.onMouseWheel = function (roll_mc_y) {
	this._y += roll_mc_y;
}
Mouse.addListener(mcForMouseWheel);

*/

var keyListener:Object = new Object();
keyListener.onKeyDown = function() {
	if(Key.getCode()==34 || Key.getCode()==99){//pgDown
		r1.onRelease();
	}
	if(Key.getCode()==33 || Key.getCode()==104){//pgUp
		l1.onRelease();
	}
	if(Key.getCode()==35 || Key.getCode()==97){//End
		if(allow_pager != '1') return false;

		pagenr = swf._totalframes;
		setPageNr();
	}
	if(Key.getCode()==36 || Key.getCode()==103){//Home
		if(allow_pager != '1') return false;

		pagenr = 1;
		setPageNr();
	}
	if(Key.getCode()==45 || Key.getCode()==96){//Ins
		a1.onRelease();
	}
	if(Key.getCode()==107){// +
		p1.onRelease();
	}
	if(Key.getCode()==109){// -
		m1.onRelease();
	}
	if(Key.getCode()==106){//* - best fit
		z1.onRelease();
	}
	if(Key.getCode()==111){// /-1:1
		o1.onRelease();
	}
	if(Key.getCode()==101){// /full screen
		f1.onRelease();
	}

	if(Key.getCode()==17){//Ctrl
		_root.Zooming = true;
	}
	
	if(Key.getCode()==16){//Shift
		_root.Dragging = "h";
	}
	if(Key.getCode()==37 || Key.getCode()==100){//left
		Dragging = "h";
		hscrollbar._x-=_root.mydelta;
	}else
	if(Key.getCode()==39 || Key.getCode()==102){//right
		Dragging = "h";
		hscrollbar._x+=_root.mydelta;
	}
	
	if(Key.getCode()==40  || Key.getCode()==98){//down
	    Dragging = "v";
		vscrollbar._y+=_root.mydelta;
	}else
	if(Key.getCode()==38 || Key.getCode()==104){//up
	    Dragging = "v";
		vscrollbar._y-=_root.mydelta;
	}
	if(hscrollbar._x<10) hscrollbar._x=10;		
	if(hscrollbar._x+hscrollbar._width +26>= _root.fullwidth){
		hscrollbar._x=_root.fullwidth-hscrollbar._width-26;
	}
	if(vscrollbar._y<40) vscrollbar._y=40;			
	if(vscrollbar._y+vscrollbar._height +25>= _root.fullheight){
		vscrollbar._y=_root.fullheight-vscrollbar._height-25;
	}
	
	refreshDrag();
};
keyListener.onKeyUp = function() {
	Dragging = "";
	_root.Zooming = false;
};
Key.addListener(keyListener);

