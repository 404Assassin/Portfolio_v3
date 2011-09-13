package com.cw.controls.dynamicButton{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.Stage;
	import flash.display.MovieClip;
	internal interface IDynamicButton{
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// DynamicButton, by both name and type; placementTarget:MovieClip, xPlacement:int, yPlacement:int, textContent:String
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		function buttonInterface(placementTarget:MovieClip, xPlacement:int, yPlacement:int, textContent:String):void
	}
}