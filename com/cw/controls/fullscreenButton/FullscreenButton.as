package com.cw.controls.fullscreenButton{
	/**
	-=] Full Screen Button [=-
	-=] language version ActionScript 3.0 [=-
	-=] player version Flash 10.0 [=-
	-=] author Christian Worley [=-
	-=] created 09/2011 [=-
	-=] TODO;  [=-
	*/
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.utilities.FullScreenToggle;
	import com.cw.visuals.tweenStates.ButtonStates;
	import flash.display.StageDisplayState;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class FullscreenButton implements IFullscreenButton{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var fullscreenButton:bttn_fullscreen = new bttn_fullscreen();
		private var fullscreenButtonStates:ButtonStates = new ButtonStates();
		private var fullScreenToggler:FullScreenToggle = new FullScreenToggle();
		private var theStageReference:Stage;
		private var placementTarget:MovieClip;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function FullscreenButton(){
		}
		public function fullscreenButtonInterface(stageReference:Stage, placementTarget:MovieClip):void{
			this.theStageReference = stageReference;
			this.placementTarget = placementTarget;
			alphaButton();
		}
		private function alphaButton():void {
			fullscreenButton.arrowsIn.alpha = 0;
			addButton()
		}
		private function addButton():void {
			placementTarget.addChild(fullscreenButton);
			addTheButtonEvents()
		}
		private function addTheButtonEvents():void {
			addFullScreenEventListener();
			theStageReference.addEventListener(Event.RESIZE, changeInDisplayState);
			fullscreenButton.buttonTarget.buttonMode = true;
			fullscreenButton.buttonTarget.addEventListener (MouseEvent.MOUSE_UP, placementTargetUp);
			fullscreenButton.buttonTarget.addEventListener (MouseEvent.MOUSE_DOWN, placementTargetDown);
			fullscreenButton.buttonTarget.addEventListener (MouseEvent.MOUSE_OUT, placementTargetOut);
			fullscreenButton.buttonTarget.addEventListener (MouseEvent.MOUSE_OVER, placementTargetOver);
		}
		private function addFullScreenEventListener():void{
			//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			// adds the fullScreenEventListener and pass it the targeted object and a stage reference
			//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			fullScreenToggler.fullScreenEventListener(fullscreenButton.buttonTarget, theStageReference);
		}
		private function placementTargetOver(overEvent:Event){
			fullscreenButtonStates.buttonStatesInterface(fullscreenButton.arrows, 'OverState');
			fullscreenButtonStates.buttonStatesInterface(fullscreenButton.arrowsIn, 'OverState');
		}
		private function placementTargetOut(outEvent:Event){
			fullscreenButtonStates.buttonStatesInterface(fullscreenButton.arrows, 'OutState');
			fullscreenButtonStates.buttonStatesInterface(fullscreenButton.arrowsIn, 'OutState');
		}
		private function placementTargetDown(downEvent:Event){
			fullscreenButtonStates.buttonStatesInterface(fullscreenButton.arrows, 'DownState');
			fullscreenButtonStates.buttonStatesInterface(fullscreenButton.arrowsIn, 'DownState');
		}
		private function placementTargetUp(upEvent:Event){
			fullscreenButtonStates.buttonStatesInterface(fullscreenButton.arrowsIn, 'UpState');
			fullscreenButtonStates.buttonStatesInterface(fullscreenButton.arrows, 'UpState');
			var change
			changeInDisplayState(change);
		}
		private function changeInDisplayState(stateChange:Event):void{
			if (theStageReference.displayState == StageDisplayState.NORMAL) {
				fullscreenButton.arrows.alpha = 1;
				fullscreenButton.arrowsIn.alpha = 0;
			} else if (theStageReference.displayState == StageDisplayState.FULL_SCREEN) {
				fullscreenButton.arrows.alpha = 0;
				fullscreenButton.arrowsIn.alpha = 1;
			}
		}
	}
}