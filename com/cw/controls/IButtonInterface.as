package com.cw.controls{
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.Stage;
	import flash.display.MovieClip;
	public interface IButtonInterface{
		function buttonInterface(stageReference:Stage, placementTarget:MovieClip):void;
	}
}