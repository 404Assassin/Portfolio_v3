package com.cw.stageAlignments{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Class Characteristics
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	public class StageAlignmentBottom implements IStageAlignmentBottom{
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private var theStageReference:Stage;
		private var theMCReference:MovieClip;
		private var bgMovieClipReference:MovieClip;
		private var swfWidth:int;
		private var swfHeight:int;
		private var stageBorderBuffer:Number = 0;
		private var resizeDelay:Number = .15;
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		public function StageAlignmentBottom(){
		}
		public function stageAlignmentInterface(stageReference:Stage, theMCReference:MovieClip, backgroundMovieClipReference:MovieClip):void{
			this.theStageReference = stageReference;
			this.theMCReference = theMCReference;
			this.bgMovieClipReference = backgroundMovieClipReference;
			addStageResizeEventListener();
			var emptyEvent:Event;
			displayResized(emptyEvent);
		}
		private function addStageResizeEventListener():void{
			theStageReference.addEventListener(Event.RESIZE, displayResized);
		}
		private function displayResized (event:Event):void {
			swfWidth = theStageReference.stageWidth;
			swfHeight = theStageReference.stageHeight;
			TweenMax.to (bgMovieClipReference, .25, {delay:resizeDelay, overwrite:1, width:swfWidth/*-50, height:24, tint:000000*/});
			TweenMax.to (theMCReference, .25, {delay:resizeDelay, overwrite:1, /*width:swfWidth, */x:swfWidth*.5, y:theStageReference.stageHeight-(theMCReference.height*.5)-stageBorderBuffer, ease:Sine.easeOut});
		}
	}
}