package com.cw.visuals.flipOpen3D{
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.Sprite;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Interface
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public interface ICFlip3D{
		function setCFlip3D(imageName:String, backgroundWidth:Number, backgroundHeight:Number):void;
		function getCFlipOpen3D():Sprite;
	}
}