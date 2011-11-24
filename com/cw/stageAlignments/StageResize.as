package com.cw.stageAlignments{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Stage Alignments based on current MovieClip postion and stage resize event
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: christian
	 * created: 08/2011
	 * TODO; create custom ADDED_TO_STAGE Event that can include params in the 
	 * method call.
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Transform;
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class StageResize implements IStageResize {
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private var stageReference:Stage;
		private var mainMC:MovieClip;
		private var swfWidth:int;
		private var swfHeight:int;
		private var resizeDelay:Number = .25;
		private var theStageCurrentAlignment:String;
		private var stageBorderBuffer:Number = 5;
		private var topStageBorderBuffer:Number = 5;
		private var leftStageBorderBuffer:Number = 5;
		private var rightStageBorderBuffer:Number = 5;
		private var bottomStageBorderBuffer:Number = 30;
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		public function StageResize(){};
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function StageAlignmentChange(theStageCurrentAlignment:String):void{
			this.theStageCurrentAlignment = theStageCurrentAlignment;
		}
		public function addStageResizeEventListener(stageReference:Stage, mainMC:MovieClip):void{
			this.stageReference = stageReference;
			this.mainMC = mainMC;
			stageReference.addEventListener(Event.RESIZE, resizeDisplay);
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function resizeDisplay (event:Event):void {
			centerStagePerspective();
			swfWidth = stageReference.stageWidth;
			swfHeight = stageReference.stageHeight;
			var targetValue:String = theStageCurrentAlignment;
			if ('0' == targetValue) {
				TweenMax.to (mainMC, 1, {delay:resizeDelay, overwrite:1, x:stageBorderBuffer+(mainMC.width*.5), y:stageBorderBuffer+(mainMC.height*.5), ease:Sine.easeOut});
			} else if ('1' == targetValue) {
				TweenMax.to (mainMC, 1, {delay:resizeDelay, overwrite:1, x:swfWidth*.5, y:stageBorderBuffer+(mainMC.height*.5), ease:Sine.easeOut});
			} else if ('2' == targetValue) {
				TweenMax.to (mainMC, 1, {delay:resizeDelay, overwrite:1, x:((stageReference.stageWidth-(mainMC.width*.5))-stageBorderBuffer), y:stageBorderBuffer+(mainMC.height*.5), ease:Sine.easeOut});
			} else if ('3' == targetValue) {
				TweenMax.to (mainMC, 1, {delay:resizeDelay, overwrite:1, x:stageBorderBuffer+(mainMC.width*.5), y:swfHeight*.5, ease:Sine.easeOut});
			} else if ('4' == targetValue) {
				TweenMax.to (mainMC, 1, {delay:resizeDelay, overwrite:1, x:swfWidth*.5, y:swfHeight*.5, ease:Sine.easeOut});
			} else if ('5' == targetValue) {
				TweenMax.to (mainMC, 1, {delay:resizeDelay, overwrite:1, x:(stageReference.stageWidth-(mainMC.width*.5))-stageBorderBuffer, y:swfHeight*.5-stageBorderBuffer, ease:Sine.easeOut});
			} else if ('6' == targetValue) {
				TweenMax.to (mainMC, 1, {delay:resizeDelay, overwrite:1, x:stageBorderBuffer+(mainMC.width*.5), y:stageReference.stageHeight-(mainMC.height*.5)-bottomStageBorderBuffer, ease:Sine.easeOut});
			} else if ('7' == targetValue) {
				TweenMax.to (mainMC, 1, {delay:resizeDelay, overwrite:1, x:swfWidth*.5, y:stageReference.stageHeight-(mainMC.height*.5)-bottomStageBorderBuffer, ease:Sine.easeOut});
			} else if ('8' == targetValue) {
				TweenMax.to (mainMC, 1, {delay:resizeDelay, overwrite:1, x:stageReference.stageWidth-(mainMC.width*.5)-stageBorderBuffer, y:stageReference.stageHeight-(mainMC.height*.5)-bottomStageBorderBuffer});
			}
		}
		private function centerStagePerspective():void {
			stageReference.transform.perspectiveProjection.projectionCenter = new Point(stageReference.stageWidth * .5, stageReference.stageHeight * .5);
		}
	}
}