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
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class StateColorChange implements IContentAreaState{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var averageColor:uint;
		private var contentAreaHeight:Number = 450;
		private var contentAreaWidth:Number = 1000;
		private var stageReference:Stage;
		private var stageWidth:int;
		private var stageHeight:int;
		private var stateTarget:MovieClip
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function StateColorChange(stageReference:Stage, stateTarget:MovieClip){
			//trace('StateInitBuild');
			this.stageReference = stageReference;
			this.stateTarget = stateTarget;
		}
		public function stateColorChangeInterface(averageColor:uint){
			this.averageColor = averageColor;
			setContentAreaBGColor(averageColor);
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// target object and pass it the new hex color reference
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function setContentAreaBGColor(theAverageColor:Object){
			TweenMax.to (stateTarget.content_stage.stageBG, 1, {delay:2.5, tint:theAverageColor});
			TweenMax.to (stateTarget.main_mc_BG, 2, {delay:3, tint:theAverageColor});
		}
	}
}