package com.cw.visuals.navigationBar{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.Stage;
	public interface INavigationBar{
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// invoke addNavigationBar and pass the Class interface a stage reference
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		function updateStageReference(stageReference:Stage):void
	}
}