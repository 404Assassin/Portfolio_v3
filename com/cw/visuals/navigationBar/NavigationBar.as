package com.cw.visuals.navigationBar {
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.stageAlignments.StageAlignmentBottom;
	import com.cw.visuals.shapeCreators.CreateShape;
	import com.cw.controls.fullscreenButton.FullscreenButton;
	import com.greensock.*;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import com.cw.utilities.MovieClipChildren;
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Class Characteristics
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	public class NavigationBar implements INavigationBar {
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private var stageReference:Stage;
		private var swfWidth:int;
		private var swfHeight:int;
		private var navBarArray:Array = new Array();
		private var navBarContentsArray:Array = new Array();
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		public function NavigationBar(){}
		public function updateStageReference(stageReference:Stage):void {
			this.stageReference = stageReference;
			addContentStage();
		}
		private function addContentStage():void {
			swfWidth = stageReference.stageWidth;
			swfHeight = stageReference.stageHeight;
			var navigationBar:MovieClip = new MovieClip;
			stageReference.addChild (navigationBar);
			var navigationBarBG:MovieClip = new MovieClip;
			navigationBar.addChild (navigationBarBG);
			navBarContentsArray.push(navigationBarBG);
			var fullscreenButton:FullscreenButton = new FullscreenButton;
			fullscreenButton.fullscreenButtonInterface(stageReference, navigationBar);
			var theShapeCreator:CreateShape = new CreateShape();
			theShapeCreator.draw(CreateShape.SQUARE_ROUNDED_FILLED, navBarContentsArray[0],-1000, -12, 2000, 24)
			TweenMax.to (navBarContentsArray[0], 0, {alpha:.85, width:swfWidth-50, height:24, tint:000000});
			TweenMax.to (navigationBar, 0, {x:swfWidth*.5, y:swfHeight-navigationBar.height});
			trace('@ addContentStage navigationBar x and width '+navBarContentsArray[0].x +' '+ navBarContentsArray[0].width +' '+ swfWidth*.5);
			//:::::::::::::::::::::::::::::::::::::::::::::::::
			// to view all the contents of a MC by type pass the MC's ref to targetMc
			//:::::::::::::::::::::::::::::::::::::::::::::::::
			new MovieClipChildren(navigationBar);
			addBarAlignment(navigationBar, navBarContentsArray[0]);
		}
		private function addBarAlignment(movieClipReference:MovieClip, backgroundMovieClipReference:MovieClip):void {
			var theStageAlingmentBottom:StageAlignmentBottom = new StageAlignmentBottom();
			theStageAlingmentBottom.stageAlignmentInterface(stageReference, movieClipReference, backgroundMovieClipReference);
		}
	}
}