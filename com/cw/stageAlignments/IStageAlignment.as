package com.cw.stageAlignments{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.MovieClip;
	import flash.display.Stage;
	public interface IStageAlignment{
		function addStageAlignmentEventListeners(stageReference:Stage, theMainMC:MovieClip):void
	}
}