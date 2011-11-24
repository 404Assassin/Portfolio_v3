package com.cw.controls.prompt{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	public interface IErrorPopUp{
		function errorPopUpInterface(placementTarget:MovieClip, xPlacement:int, yPlacement:int, textContent:String):void;
		function getErrorPopUp():Sprite;
	}
}