stop();
Stage.scaleMode = "noScale";
Stage.align = "LT";

//swf.loadClip("E:/work/tevezi/www/assets/pdf_swf/rfxview/test.swf","swf");

l1.onRelease = function ()
{
    if (pagenr > 1)
    {
        pagenr = pagenr - 1;
        setPageNr();
    } // end if
};
r1.onRelease = function ()
{
    if (pagenr < swf._totalframes)
    {
        pagenr = pagenr + 1;
        setPageNr();
    } // end if
};
p1.onRelease = function ()
{
    if (zoom < 4)
    {
        zoom = zoom + 1;
        setZoomLevel();
    } // end if
};
m1.onRelease = function ()
{
    if (zoom > 1)
    {
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
    setNoScrollZoomLevel();
};
z1.onRelease = function ()
{
    setOneDirScrollZoomLevel();
};
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

//43
vscrollbar.onPress=vsPress;
vscrollbar.onRelease=vsRelease;
vscrollbar.onReleaseOutside=vsRelease;
vscrollbar.dragOut=vsRelease;
function vsPress(){
    startDrag(this,false, _root.fullwidth - 22, 40, _root.fullwidth - 22, 40 + _root.scrollbaryrange);
    Dragging = "v";
}
function vsRelease(){
    stopDrag();
	refreshDrag();
    Dragging = "";
}

//53
hscrollbar.onPress=hsPress;
hscrollbar.onRelease=hsRelease;
hscrollbar.onReleaseOutside=hsRelease;
hscrollbar.dragOut=hsRelease;

function hsPress(){
    startDrag(this, false, 10, _root.fullheight - 22, 10 + _root.scrollbarxrange, _root.fullheight - 22);
    Dragging = "h";
}
function hsRelease(){
    stopDrag();
	refreshDrag();
    Dragging = "";
}

this.onResize = resizeUI;
Stage.addListener(this);
dragrefresh = setInterval(refreshDrag, 20);