stop();
setPageNr = function (){
	et.text = pagenr + " / " + swf._totalframes;
	swf.gotoAndStop(pagenr);
	topOfPage();
	_root.my_snap = swf.getTextSnapshot();
	hltext(st.text);
};

topOfPage = function (){
	swf._y = top;
	swf._x = left;
	swfpos2scrollbars();
}

setNoScrollZoomLevel = function (){
    xscale = contentwidth / swfwidth;
    yscale = contentheight / swfheight;
    if (xscale >= yscale)
    {
        zoom = yscale;
        setZoomLevel();
    }
    else
    {
        zoom = xscale;
        setZoomLevel();
    } // end else if
};

setOneDirScrollZoomLevel = function ()
{
    xscale = contentwidth / swfwidth;
    yscale = contentheight / swfheight;
    if (yscale >= xscale)
    {
        zoom = yscale;
        setZoomLevel();
    }
    else
    {
        zoom = xscale;
        setZoomLevel();
    } // end else if
};
set11ZoomLevel = function ()
{
    zoom = 1;
    setZoomLevel();
};
swfpos2scrollbars = function ()
{
    if (!scrollxrange)
    {
        hscrollbar._x = 10;
    }
    else
    {
        hscrollbar._x = 10 + (left - swf._x) * scrollbarxrange / scrollxrange;
    } // end else if
    if (!scrollyrange)
    {
        vscrollbar._y = 40;
    }
    else
    {
        vscrollbar._y = 40 + (top - swf._y) * scrollbaryrange / scrollyrange;
    } // end else if
};
setZoomLevel = function ()
{
    width = contentwidth;
    height = contentheight;
    left = 10;
    top = 40;
    if (swfwidth * zoom < contentwidth){
        width = swfwidth * zoom;
        left = 10 + (contentwidth - width) / 2;
    }
	
    if (swfheight * zoom < contentheight){
        height = swfheight * zoom;
        top = 40 + (contentheight - height) / 2;
    }
    scrollxrange = swfwidth * zoom - width;
    scrollyrange = swfheight * zoom - height;
    hscrollbar._xscale = contentwidth * width / (swfwidth * zoom);
    vscrollbar._yscale = contentheight * height / (swfheight * zoom);
    scrollbarxrange = contentwidth - hscrollbar._xscale;
    scrollbaryrange = contentheight - vscrollbar._yscale;
    if (scrollbarxrange < 0)
    {
        scrollbarxrange = 0;
    } // end if
    if (scrollbaryrange < 0)
    {
        scrollbaryrange = 0;
    } // end if
    swf._xscale = zoom * 100;
    swf._yscale = zoom * 100;
    focusx = contentwidth / 2 - (swf._x - 10);
    focusy = contentheight / 2 - (swf._y - 40);
    swf._x = left - focusx * zoom / lastzoom + width / 2;
    swf._y = top - focusy * zoom / lastzoom + height / 2;
    if (left >= swf._x)
    {
        if (swf._x < left - scrollxrange)
        {
            swf._x = left - scrollxrange;
        } // end if
    }
    else
    {
        swf._x = left;
    } // end else if
    if (top >= swf._y)
    {
        if (swf._y < top - scrollyrange)
        {
            swf._y = top - scrollyrange;
        } // end if
    }
    else
    {
        swf._y = top;
    } // end else if
    swfpos2scrollbars();
    if (!scrollxrange)
    {
    }
    else
    {
        hscrollbar._visible = 1;
    } // end else if
    if (!scrollyrange)
    {
    }
    else
    {
        vscrollbar._visible = 1;
    } // end else if
    lastzoom = zoom;
    vscrollbar.t1._y = vscrollbar.t2._y - 6.000000E+002 / vscrollbar._yscale;
    vscrollbar.t3._y = vscrollbar.t2._y + 6.000000E+002 / vscrollbar._yscale;
    hscrollbar.th1._x = hscrollbar.th2._x - 6.000000E+002 / hscrollbar._xscale;
    hscrollbar.th3._x = hscrollbar.th2._x + 7.000000E+002 / hscrollbar._xscale;
    vscrollbar.vshadow._x = vscrollbar.vbox._x + 400 / vscrollbar._xscale;
    vscrollbar.vshadow._y = vscrollbar.vbox._y + 400 / vscrollbar._yscale;
    hscrollbar.hshadow._x = hscrollbar.hbox._x + 400 / hscrollbar._xscale;
    hscrollbar.hshadow._y = hscrollbar.hbox._y + 400 / hscrollbar._yscale;
};
initDocument = function (target_mc) {
	swf=target_mc;
	swf.gotoAndPlay(1);  //fixes loading issue, part 2
	swfwidth = target_mc._width;
	swfheight = target_mc._height;
	target_mc.gotoAndStop(1);
	//target_mc._lockroot = true;
	target_mc.setMask(cliparea);
	if (zoomtype != "1"){
		if (zoomtype != "2"){
			setOneDirScrollZoomLevel();
		}else{
			setNoScrollZoomLevel();
		}
	}else{
		set11ZoomLevel();
	}
	setPageNr();
	swf.onMouseDown=textDown;
	swf.onMouseUp=textUp;
	swf.onMouseMove=textMove;
}
refreshDrag = function ()
{
    if (Dragging != "h")
    {
        if (Dragging != "v")
        {
            if (Dragging == "xy")
            {
                swfpos2scrollbars();
            } // end if
        }
        else
        {
            swf._y = top + (40 - vscrollbar._y) * scrollyrange / scrollbaryrange;
        } // end else if
    }
    else
    {
        swf._x = left + (10 - hscrollbar._x) * scrollxrange / scrollbarxrange;
    } // end else if
};
resizeUI = function (){
	fullwidth = Stage.width;
	fullheight = Stage.height;
	contentwidth = fullwidth - 40;
	contentheight = fullheight - 70;
	vscrollbar._x = fullwidth - 22;
	hscrollbar._y = fullheight - 22;
	
	f1._x = fullwidth - 20 - f1._width / 2;
	
	p1._x = fullwidth - 25 - 20 - p1._width / 2;
	m1._x = fullwidth - 50 - 20 - m1._width / 2;
	
	o1._x = fullwidth - 75 - 20 - o1._width / 2;
	z1._x = fullwidth - 100 - 20 - z1._width / 2;

	a1._x = fullwidth - 125 - 20 - a1._width / 2;
	pr._x = fullwidth - 150 - 20 - pr._width / 2;
	
	et._x = fullwidth / 2 - et._width / 2;
	l1._x = et._x-10 - l1._width;
	r1._x = et._x+et._width+ 10;

	
	bg.clear();
	bg.lineStyle(1, 0x999999, 96);
	bg.moveTo(10, fullheight - 20);
	bg.lineTo(10, fullheight - 10);
	bg.lineTo(10 + fullwidth - 40, fullheight - 10);
	bg.lineTo(10 + fullwidth - 40, fullheight - 20);
	bg.lineTo(10, fullheight - 20);
	bg.moveTo(fullwidth - 20, 40);
	bg.lineTo(fullwidth - 20, fullheight - 30);
	bg.lineTo(fullwidth - 10, fullheight - 30);
	bg.lineTo(fullwidth - 10, 40);
	bg.lineTo(fullwidth - 20, 40);
	bg.lineStyle(1, 0x999999);
	bg.startFill(0);
	bg.moveTo(9, 39);
	bg.lineTo(fullwidth - 30 + 1, 39);
	bg.lineTo(fullwidth - 30 + 1, fullheight - 29);
	bg.lineTo(9, fullheight - 29);
	bg.lineTo(9, 39);
	bg.endFill();
	
	areabutton._xscale = contentwidth;
	areabutton._yscale = contentheight;
	cliparea._xscale = contentwidth;
	cliparea._yscale = contentheight;
	if (zoomtype != "1"){
		if (zoomtype != "2"){
			if (zoomtype != "3"){
				setZoomLevel();
			}else{
				setOneDirScrollZoomLevel();
			}
		}else{//zoomtype=3
			setNoScrollZoomLevel();
		}
	}else{
		set11ZoomLevel();
	}
	noDoc._x=Stage.width/2-noDoc._x/2;
	noDoc._y=Stage.height/2-noDoc._y/2;
}
var fnd_arr = new Array();
hltext = function(txt){
	var start_pos:Number = 0;
	start_pos = my_snap.findText(start_pos, txt, false);
	trace("start_pos : " + start_pos);
	//my_snap.setSelectColor(0xFF0000);
	found=0;
	while (start_pos > 0) {
		found=found+1;
		trace(start_pos);
		fnd_arr[found]=start_pos;
		my_snap.setSelected(start_pos, start_pos + txt.length, true);
		start_pos += txt.length;
		start_pos = my_snap.findText(start_pos, txt, false);
	}
	if(found>0){
		er1.text=found;
	}else{
		er1.text="";
	}
}
function clearSel(){
	_root.my_snap=null;
}
