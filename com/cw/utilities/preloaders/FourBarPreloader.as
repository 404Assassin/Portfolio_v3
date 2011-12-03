package com.cw.utilities.preloaders{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * FourBarPreloader
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: Christian Worley
	 * created: 06/2011
	 * TODO:
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.math.RatioConversion;
	import com.cw.stageAlignments.StageResize;
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;
	import com.greensock.easing.Sine;
	import com.greensock.events.LoaderEvent;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Stage;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class FourBarPreloader implements IPreload{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var barAlpha:Number = .75;
		private var placementTarget:MovieClip;
		private var stageReference:Stage;
		private var stageWidth:int;
		private var stageHeight:int;
		private var theProgressBars:progressBars = new progressBars();
		private var theRatioConversion:RatioConversion;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function FourBarPreloader(){};
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function preloaderInterface(stageReference:Stage, placementTarget:MovieClip):void{
			this.stageReference = stageReference;
			this.stageWidth = stageReference.stageWidth;
			this.stageHeight = stageReference.stageHeight;
			this.placementTarget = placementTarget;
			addProgressBars();
			stageResizeEvents();
		}
		public function progressHandlerInterface(loaderEvent:LoaderEvent):void {
			progressHandler(loaderEvent)
		}
		public function progressCompleteInterface():void {
			TweenMax.to (theProgressBars, 2, {alpha:0, ease:Sine.easeOut});
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function addProgressBars():void {
			var barPlacementX:int = stageWidth * .5;
			var barPlacementY:int = stageHeight * .5;
			TweenMax.to (theProgressBars, 0, {alpha:0, x:barPlacementX, y:barPlacementY});
			TweenMax.to (theProgressBars.bar1, 0, {alpha:0, scaleX:.1});
			TweenMax.to (theProgressBars.bar2, 0, {alpha:0, scaleX:.1});
			TweenMax.to (theProgressBars.bar3, 0, {alpha:0, scaleX:.1});
			TweenMax.to (theProgressBars.bar4, 0, {alpha:0, scaleX:.1});
			placementTarget.addChild(theProgressBars);
			TweenMax.to (theProgressBars, 2, {alpha:1, ease:Sine.easeOut});
		}
		private function progressHandler(loaderEvent:LoaderEvent):void {
			var theRatioConversion:RatioConversion = new RatioConversion();
			if(loaderEvent.target.progress <= .25){
				TweenMax.to(theProgressBars.bar2, .2, {alpha:0, scaleX:.1, ease:Sine.easeOut});
				TweenMax.to(theProgressBars.bar3, .2, {alpha:0, scaleX:.1, ease:Sine.easeOut});
				TweenMax.to(theProgressBars.bar4, .2, {alpha:0, scaleX:.1, ease:Sine.easeOut});
				TweenMax.to(theProgressBars.bar1, .2, {alpha:barAlpha, scaleX:theRatioConversion.ratioConversionInterface(loaderEvent.target.progress, 0,.25,0,1), ease:Sine.easeInOut});
			}else if(loaderEvent.target.progress >= .25 && loaderEvent.target.progress <= .5){
				TweenMax.to(theProgressBars.bar3, .2, {alpha:0, scaleX:.1, ease:Sine.easeOut});
				TweenMax.to(theProgressBars.bar4, .2, {alpha:0, scaleX:.1, ease:Sine.easeOut});
				TweenMax.to(theProgressBars.bar1, 0, {alpha:barAlpha, scaleX:1});
				TweenMax.to(theProgressBars.bar2, .2, {alpha:barAlpha, scaleX:theRatioConversion.ratioConversionInterface(loaderEvent.target.progress, .25,.5,0,1), ease:Sine.easeInOut});
			}else if(loaderEvent.target.progress >= .5 && loaderEvent.target.progress <= .75){
				TweenMax.to(theProgressBars.bar4, .2, {alpha:0, scaleX:.1, ease:Sine.easeOut});
				TweenMax.to(theProgressBars.bar1, 0, {alpha:barAlpha, scaleX:1});
				TweenMax.to(theProgressBars.bar2, 0, {alpha:barAlpha, scaleX:1});
				TweenMax.to(theProgressBars.bar3, .2, {alpha:barAlpha, scaleX:theRatioConversion.ratioConversionInterface(loaderEvent.target.progress, .5,.75,0,1), ease:Sine.easeInOut});
			}else if(loaderEvent.target.progress >= .75 && loaderEvent.target.progress <= 1){
				TweenMax.to(theProgressBars.bar1, 0, {alpha:barAlpha, scaleX:1});
				TweenMax.to(theProgressBars.bar2, 0, {alpha:barAlpha, scaleX:1});
				TweenMax.to(theProgressBars.bar3, 0, {alpha:barAlpha, scaleX:1});
				TweenMax.to(theProgressBars.bar4, .2, {alpha:barAlpha, scaleX:theRatioConversion.ratioConversionInterface(loaderEvent.target.progress, .75,1,0,1), ease:Sine.easeInOut});
			}
		}
		private function stageResizeEvents(){
			var theStageResize:StageResize = new StageResize();
			theStageResize.addStageResizeEventListener(stageReference, theProgressBars)
			theStageResize.StageAlignmentChange('4');
		}
	}
}