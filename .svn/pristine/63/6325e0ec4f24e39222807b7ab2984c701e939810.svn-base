class Tooltip {
	
	private var theTip:MovieClip;
	private var tFormat:TextFormat;
	
	function Tooltip(hex:Number,hex2:Number) {
		
		this.theTip = _root.createEmptyMovieClip("tooltip", _root.getNextHighestDepth());
		this.theTip.createTextField("theText",this.theTip.getNextHighestDepth(),-100,1,100,20);
		this.theTip.beginFill(hex);
		this.theTip.lineStyle(1, hex2, 100);
		this.theTip.moveTo(0, 0);
		this.theTip.lineTo(-10, 0);
		this.theTip.lineTo(-15, -10);	
		this.theTip.lineTo(-20, 0);
		this.theTip.lineTo(-100, 0);
		this.theTip.lineTo(-100, 20);
		this.theTip.lineTo(0, 20);
		this.theTip.lineTo(0, 0);
		
		/*
		this.theTip.lineTo(100, 0);
		this.theTip.lineTo(100, 20);
		this.theTip.lineTo(20, 20);
		this.theTip.lineTo(15, 30);
		this.theTip.lineTo(10, 20);
		this.theTip.lineTo(0, 20);
		this.theTip.lineTo(0, 0);*/
		this.theTip.endFill();
		this.theTip._visible = false;
		this.theTip.theText.selectable = false;
		this.tFormat = new TextFormat();
		this.tFormat.font = "Arial";
		this.tFormat.size = 11;
		this.tFormat.align = "center";
		this.theTip.theText.setNewTextFormat(this.tFormat);
		
	}
	
	public function showTip(theText:String):Void {
		
		this.theTip.theText.text = theText;
		this.theTip._x = _root._xmouse +15;
		this.theTip._y = _root._ymouse +30;
		this.theTip._visible = true;
		this.theTip.onMouseMove = function() {
			this._x = _root._xmouse+15 ;
			this._y = _root._ymouse+30;
			updateAfterEvent();
		}
		
	}
	
	public function removeTip():Void {
		
		this.theTip._visible = false;
		delete this.theTip.onEnterFrame;
		
	}

}