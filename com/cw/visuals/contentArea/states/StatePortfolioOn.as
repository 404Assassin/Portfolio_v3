package com.cw.visuals.contentArea.states{
	/**
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * StatePortfolioOn Class
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
	import flash.display.MovieClip;
	import flash.display.Stage;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	internal class StatePortfolioOn implements IContentAreaState{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var contentAreaHeight:Number = 500;
		private var contentAreaWidth:Number = 1000;
		private var stateTarget:MovieClip
		private var rotationAmount:int = -180;
		private var contentsArray:Array = new Array();
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function StatePortfolioOn(stageReference:Stage, stateTarget:MovieClip){
			this.stateTarget = stateTarget;
			stateChanges();
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function stateChanges(){
			TweenMax.to (stateTarget.StageAlignmentButtons, 1.5, {delay:.25, rotationY:180, ease:Sine.easeInOut});
			TweenMax.to (stateTarget, 1.5, {rotationY:rotationAmount, ease:Sine.easeInOut, onComplete:mainMovieClipResize});
		}
		private function mainMovieClipResize () {
			var theResizeContentArea:ResizeContentArea = new ResizeContentArea();
			theResizeContentArea.resizeContentAreaInterface(stateTarget, contentAreaHeight, contentAreaWidth);
		}
	}
}