package com.cw.visuals.flipOpen3D{
	import flash.display.MovieClip;
	public interface IFlip3D{
		function addToDisplay(placementTarget:MovieClip, the_mcX:Number, the_mcY:Number, imagePath:String, imageName:String, imageType:String):void;
	}
}