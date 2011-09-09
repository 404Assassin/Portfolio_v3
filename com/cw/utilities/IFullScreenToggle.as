package com.cw.utilities{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.Sprite;
	import flash.display.Stage;
	public interface IFullScreenToggle{
		function fullScreenEventListener(eventTarget:Sprite, stageReference:Stage):void;
	}
}