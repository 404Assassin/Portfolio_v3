package com.cw.stageAlignments{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.Stage;
	import flash.display.MovieClip;
	public interface IStageResize{
		function StageAlignmentChange(theStageCurrentAlignment:String):void
		function addStageResizeEventListener(stageReference:Stage, mainMC:MovieClip):void
	}
}