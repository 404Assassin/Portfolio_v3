package com.cw.utilities{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Class discription: Full Screen Toggle - make sure to set HTML 
	 * Embed/Object :: allowfullscreen = "true";
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: christian
	 * contact: christian@worleydev.com
	 * created: 08/2011
	 * TODO; 
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.events.MouseEvent;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class FullScreenToggle implements IFullScreenToggle{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var theStageReference:Stage;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function FullScreenToggle(){};
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// adds the fullScreenEventListener and pass it the targeted object and a stage reference
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function fullScreenEventListener(eventTarget:Sprite, stageReference:Stage):void{
			theStageReference = stageReference;
			eventTarget.addEventListener(MouseEvent.CLICK, handleClickEvent)
		}
		private function handleClickEvent(event:MouseEvent):void{
			goFullScreen();
		}
		private function goFullScreen():void{
			if (theStageReference.displayState == StageDisplayState.NORMAL) {
				theStageReference.displayState = StageDisplayState.FULL_SCREEN;
			} else {
				theStageReference.displayState = StageDisplayState.NORMAL;
			}
		}
	}
}