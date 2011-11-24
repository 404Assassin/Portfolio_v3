package com.cw.visuals.tweenStates{
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.Sprite;
	internal interface IButtonStates{
		function buttonStatesInterface(animeTarget:Sprite, actionType:String):void;
	}
}