package com.cw.stageAlignments{
	/*
	-=] StageAlignment document class for the CW D&D [=-
	-=] language version ActionScript 3.0 [=-
	-=] player version Flash 10.0 [=-
	-=] author Christian Worley [=-
	-=] created 06/2011 [=-
	-=] TODO: 
	*/
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.stageAlignments.StageResize;
	import com.cw.visuals.tweenStates.ButtonStates;
	import com.cw.visuals.mouseStates;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	public class StageAlignment implements IStageAlignment {
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private var evt:String;
		private var target_mc:MovieClip;
		private var targetValue:String
		private var fullscreenButtonStates:ButtonStates = new ButtonStates();
		private var StageResizeHandler:StageResize = new StageResize();
		private var stageCurrentAlignment:String;
		private var theStageReference:Stage;
		private var mainMC:MovieClip;
		private var swfWidth:int;
		private var swfHeight:int;
		private var navSize_height:Number = 100;
		private var navSize_width:Number = 1000;
		private var my_current_x:Number;
		private var my_current_y:Number;
		private var theMainBGTopY:Number;
		private var theMainBGCenterY:Number;
		private var theMainBGBottomY:Number;
		private var alignment_bttn_count:Number = 9;
		private var stageBorderBuffer:Number = 5;
		private var topStageBorderBuffer:Number = 5;
		private var leftStageBorderBuffer:Number = 5;
		private var rightStageBorderBuffer:Number = 5;
		private var bottomStageBorderBuffer:Number = 30;
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		public function StageAlignment(){
			StageResizeHandler.StageAlignmentChange('4');
		}
		public function addStageAlignmentEventListeners(stageReference:Stage, theMainMC:MovieClip):void{
			this.theStageReference = stageReference;
			mainMC = theMainMC;
			initEvents ();
			StageResizeHandler.addStageResizeEventListener(theStageReference, mainMC)
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Alignment buttons iterative MouseEvents build
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private function initEvents (){
			for (var k:Number = 0; k < alignment_bttn_count; k++) {
				var alignment_bttn_iterator = 'alignment_bttn_' + String(k);
				trace (mainMC[alignment_bttn_iterator].name);
				mainMC[alignment_bttn_iterator].buttonTarget.addEventListener (MouseEvent.MOUSE_UP, onAlignmentBttnUp);
				mainMC[alignment_bttn_iterator].buttonTarget.addEventListener (MouseEvent.MOUSE_OVER, onAlignmentBttnOver);
				mainMC[alignment_bttn_iterator].buttonTarget.addEventListener (MouseEvent.MOUSE_DOWN, onAlignmentBttnDown);
				mainMC[alignment_bttn_iterator].buttonTarget.addEventListener (MouseEvent.MOUSE_OUT, onAlignmentBttnRollOut);
			}
		}
		private function onAlignmentBttnUp (alignmentBttnMouseEvent:MouseEvent):void {
			this.swfWidth = theStageReference.stageWidth;
			this.swfHeight = theStageReference.stageHeight;
			this.my_current_x = (mainMC.x-10);
			var animeTarget:MovieClip = MovieClip(alignmentBttnMouseEvent.target.parent);
			fullscreenButtonStates.buttonStatesInterface(animeTarget.circle, 'UpState')
			fullscreenButtonStates.buttonStatesInterface(animeTarget, 'UpState')
			targetValue = String(animeTarget.name);
			targetValue = targetValue.slice(-1,targetValue.length);
			this.stageCurrentAlignment = stageCurrentAlignment;
			StageResizeHandler.StageAlignmentChange(targetValue);
			//trace('::::::::::::::What is the value of targetValue: '+targetValue);
			if ('0' == targetValue) {
				stageCurrentAlignment = '0';
				TweenMax.to (mainMC, 1, {x:stageBorderBuffer+(mainMC.width*.5), y:stageBorderBuffer+(mainMC.height*.5), ease:Sine.easeOut});
			} else if ('1' == targetValue) {
				stageCurrentAlignment = '1';
				TweenMax.to (mainMC, 1, {x:(swfWidth*.5), y:stageBorderBuffer+(mainMC.height*.5), ease:Sine.easeOut});
			} else if ('2' == targetValue) {
				stageCurrentAlignment = '2';
				TweenMax.to (mainMC, 1, {x:((theStageReference.stageWidth-(mainMC.width*.5))-stageBorderBuffer), y:stageBorderBuffer+(mainMC.height*.5), ease:Sine.easeOut});
			} else if ('3' == targetValue) {
				stageCurrentAlignment = '3';
				TweenMax.to (mainMC, 1, {x:stageBorderBuffer+(mainMC.width*.5), y:swfHeight*.5, ease:Sine.easeOut});
			} else if ('4' == targetValue) {
				stageCurrentAlignment = '4';
				TweenMax.to (mainMC, 1, {x:theStageReference.stageWidth*.5, y:swfHeight*.5, ease:Sine.easeOut});
			} else if ('5' == targetValue) {
				stageCurrentAlignment = '5';
				TweenMax.to (mainMC, 1, {x:(theStageReference.stageWidth-(mainMC.width*.5))-stageBorderBuffer, y:swfHeight*.5, ease:Sine.easeOut});
			} else if ('6' == targetValue) {
				stageCurrentAlignment = '6';
				TweenMax.to (mainMC, 1, {x:stageBorderBuffer+(mainMC.width*.5), y:theStageReference.stageHeight-(mainMC.height*.5)-bottomStageBorderBuffer, ease:Sine.easeOut});
			} else if ('7' == targetValue) {
				stageCurrentAlignment = '7';
				TweenMax.to (mainMC, 1, {x:(swfWidth*.5), y:theStageReference.stageHeight-(mainMC.height*.5)-bottomStageBorderBuffer, ease:Sine.easeOut});
			} else if ('8' == targetValue) {
				stageCurrentAlignment = '8';
				TweenMax.to (mainMC, 1, {x:(theStageReference.stageWidth-(mainMC.width*.5))-stageBorderBuffer, y:theStageReference.stageHeight-(mainMC.height*.5)-bottomStageBorderBuffer, ease:Sine.easeOut});
			}
		}
		private function onAlignmentBttnOver (alignmentBttnMouseEvent:MouseEvent):void {
			var animeTarget:MovieClip = MovieClip(alignmentBttnMouseEvent.target.parent);
			fullscreenButtonStates.buttonStatesInterface(animeTarget.circle, 'OverState')
			fullscreenButtonStates.buttonStatesInterface(animeTarget, 'OverState')
		}
		private function onAlignmentBttnDown (alignmentBttnMouseEvent:MouseEvent):void {
			var animeTarget:MovieClip = MovieClip(alignmentBttnMouseEvent.target.parent);
			fullscreenButtonStates.buttonStatesInterface(animeTarget.circle, 'DownState')
			fullscreenButtonStates.buttonStatesInterface(animeTarget, 'DownState')
		}
		private function onAlignmentBttnRollOut (alignmentBttnMouseEvent:MouseEvent):void {
			var animeTarget:MovieClip = MovieClip(alignmentBttnMouseEvent.target.parent);
			fullscreenButtonStates.buttonStatesInterface(animeTarget.circle, 'OutState')
			fullscreenButtonStates.buttonStatesInterface(animeTarget, 'OutState')
		}
	}
}