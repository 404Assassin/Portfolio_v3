package com.cw.visuals.contentArea.states{
	/**
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * StateContactOn Class
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: Christian Worley
	 * created: 09/2011
	 * TODO:
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.visuals.contentArea.ResizeContentArea;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	import flash.display.Stage;
	import flash.display.MovieClip;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	internal class StateContactOn implements IContentAreaState{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var contentAreaHeight:Number = 500;
		private var contentAreaWidth:Number = 1000;
		private var stateTarget:MovieClip
		private var rotationAmount:int = 180;
		private var contentsArray:Array = new Array();
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function StateContactOn(stageReference:Stage, stateTarget:MovieClip){
			this.stateTarget = stateTarget;
			stateChanges();
			//mainMovieClipResize();
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function stateChanges(){
			TweenMax.to (stateTarget.StageAlignmentButtons, 1.5, {delay:.25, rotationY:-180, z:0, ease:Sine.easeInOut});
			TweenMax.to (stateTarget.content_stage, .5, {z:0});
			TweenMax.to (stateTarget, 1.5, {rotationY:rotationAmount, ease:Sine.easeInOut, onComplete:mainMovieClipResize});
		}
		private function mainMovieClipResize () {
			var theResizeContentArea:ResizeContentArea = new ResizeContentArea();
			theResizeContentArea.resizeContentAreaInterface(stateTarget, contentAreaHeight, contentAreaWidth);
		}
	}
}