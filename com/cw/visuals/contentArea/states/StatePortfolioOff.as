package com.cw.visuals.contentArea.states{
	/**
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * StatePortfolioOff Class
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
	import com.cw.utilities.MovieClipChildren;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	import flash.display.MovieClip;
	import flash.display.Stage;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	internal class StatePortfolioOff implements IContentAreaState{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var contentAreaHeight:Number = 400;
		private var contentAreaWidth:Number = 1000;
		private var stateTarget:MovieClip
		private var rotationAmount:int = 0;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function StatePortfolioOff(stageReference:Stage, stateTarget:MovieClip){
			trace('StatePortfolioOff');
			this.stateTarget = stateTarget;
			//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			// to view all the contents of a MC by type pass the MC's ref to targetMc
			//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			var mainMC:MovieClip = stateTarget;
			new MovieClipChildren(mainMC.content_stage);
			stateChanges();
		}
		private function stateChanges(){
			trace(stateTarget.StageAlignmentButtons);
			TweenMax.to (stateTarget.StageAlignmentButtons, 1.75, {delay:.25, rotationY:rotationAmount, ease:Sine.easeInOut});
			TweenMax.to (stateTarget, 1.5, {delay:.25, rotationY:rotationAmount, ease:Sine.easeInOut, onComplete:mainMovieClipResize});
		}
		private function mainMovieClipResize () {
			var theResizeContentArea:ResizeContentArea = new ResizeContentArea();
			theResizeContentArea.resizeContentAreaInterface(stateTarget, contentAreaHeight, contentAreaWidth);
		}
	}
}