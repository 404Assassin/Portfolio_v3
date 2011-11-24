package com.cw.controls.directoryUIs{
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Interface characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public interface ICSectionDirectory{
		function stageAccess(stageReference:Stage, sectionName:String):void
		function getCFlipOpen3D():Sprite
		function getButtonsBounds():Rectangle
	}
}