package com.cw.controls.fullscreenButton{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.Stage;
	import flash.display.MovieClip;
	public interface IFullscreenButton{
		function fullscreenButtonInterface(stageReference:Stage, placementTarget:MovieClip):void;
	}
}