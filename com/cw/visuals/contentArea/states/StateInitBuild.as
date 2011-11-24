package com.cw.visuals.contentArea.states{
	/**
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * StateInitBuild Class
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
	import com.cw.visuals.flipOpen3D.Flip3DOpen5;
	import com.cw.visuals.flipOpen3D.FlipOpen3dAnime5;
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;

	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	internal class StateInitBuild implements IContentAreaState{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var contentAreaHeight:Number = 400;
		private var contentAreaWidth:Number = 1000;
		private var stageReference:Stage;
		private var stageWidth:int;
		private var stageHeight:int;
		private var stateTarget:MovieClip
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function StateInitBuild(stageReference:Stage, stateTarget:MovieClip){
			this.stageReference = stageReference;
			this.stateTarget = stateTarget;
			this.stageWidth = stageReference.stageWidth;
			this.stageHeight = stageReference.stageHeight;
			pushToTheMiddle ()
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Reposition the movieclip to stage center & opening
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function pushToTheMiddle () {
			stateTarget.x = (stageWidth*.5);
			stateTarget.y = (stageHeight*.5);
			openingAnimation ();
		}
		private function openingAnimation () {
			TweenMax.to (stateTarget, 0, {alpha:0, scaleX:1, scaleY:1, rotationY:-180});
			TweenMax.to (stateTarget.dottedLine, 0, {alpha:1, z:25});
			TweenMax.to (stateTarget.main_mc_BG, 0, {alpha:0, scaleX:1, scaleY:1, z:1500});
			TweenMax.to (stateTarget.main_mc_BG, 2, {alpha:.5, z:0});
			TweenMax.to (stateTarget.content_stage, 0, {z:-1525, alpha:0});
			TweenMax.to (stateTarget.content_stage, 2, {x:0, z:-20, alpha:1});
			TweenMax.to (stateTarget.content_stage.stageBG, .5, {alpha:.5});
			TweenMax.to (stateTarget, 4, {alpha:1, scaleX:1, scaleY:1, rotationY:0, ease:Sine.easeOut, onComplete:mainMovieClipResize});
		}
		private function mainMovieClipResize () {
			var theResizeContentArea:ResizeContentArea = new ResizeContentArea();
			theResizeContentArea.resizeContentAreaInterface(stateTarget, contentAreaHeight, contentAreaWidth);
		}
	}
}