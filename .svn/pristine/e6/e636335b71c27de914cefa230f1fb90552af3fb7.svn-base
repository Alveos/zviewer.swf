stop();
removeMovieClip(swf);
var swf = this.createEmptyMovieClip("swf", this.getNextHighestDepth());
var my_mcl:MovieClipLoader = new MovieClipLoader();
// Create listener object:
var mclListener:Object = new Object();
mclListener.onLoadError = function(target_mc:MovieClip, errorCode:String, status:Number) {
	noDoc._visible=true;
	//trace("Error loading image: " + errorCode + " [" + status + "]");
};
mclListener.onLoadStart = function(target_mc:MovieClip):Void {
target_mc.gotoAndStop(1); //fixes loading issue, part 1
//trace("onLoadStart: " + target_mc);
};

mclListener.onLoadProgress = function(target_mc:MovieClip, numBytesLoaded:Number, numBytesTotal:Number):Void {
    var numPercentLoaded:Number = numBytesLoaded / numBytesTotal * 100;
	et.text=" "+Math.round(numPercentLoaded)+"% loaded";
    //trace("onLoadProgress: " + target_mc + " is " + numPercentLoaded + "% loaded");
};
mclListener.onLoadComplete = function(target_mc:MovieClip, status:Number):Void {
    //trace("onLoadComplete: " + target_mc);
};
mclListener.onLoadInit = function(target_mc:MovieClip, status:Number):Void {
    //trace("onLoadComplete: " + target_mc);
	initDocument(target_mc);
};

my_mcl.addListener(mclListener);