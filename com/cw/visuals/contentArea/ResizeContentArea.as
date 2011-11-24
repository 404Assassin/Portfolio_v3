package com.cw.visuals.contentArea{
	/**
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * resizeContentArea Class
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
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class ResizeContentArea implements IResizeContentArea{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var main_mc_BGLeftX:Number;
		private var main_mc_BGCenterX:Number;
		private var main_mc_BGRightX:Number;
		private var main_mc_BGTopY:Number;
		private var main_mc_BGCenterY:Number;
		private var main_mc_BGBottomY:Number;
		private var contentArea:MovieClip;
		private var contentAreaHeight:int;
		private var contentAreaWidth:int;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function ResizeContentArea(){
		}
		public function resizeContentAreaInterface(contentArea:MovieClip, contentAreaHeight:int, contentAreaWidth:int):void {
			this.contentArea = contentArea;
			this.contentAreaHeight = contentAreaHeight;
			this.contentAreaWidth = contentAreaWidth;
			mainMovieClipResize ();
		}
		private function mainMovieClipResize () {
			TweenMax.to (contentArea.content_stage.stageBG, 1.5, {height:contentAreaHeight-50, width:contentAreaWidth-50, ease:Sine.easeOut});
			TweenMax.to (contentArea.main_mc_BG, 3, {height:contentAreaHeight, width:contentAreaWidth, ease:Sine.easeOut});
			main_mc_BGLeftX = contentArea.main_mc_BG.x-(contentAreaWidth)/2;
			main_mc_BGCenterX = contentArea.main_mc_BG.x;
			main_mc_BGRightX = ((contentArea.main_mc_BG.x)+(contentAreaWidth)/2);
			main_mc_BGTopY = contentArea.main_mc_BG.y-(contentAreaHeight)/2;
			main_mc_BGCenterY = contentArea.main_mc_BG.y;
			main_mc_BGBottomY = ((contentArea.main_mc_BG.y)+(contentAreaHeight)/2);
			TweenMax.to (contentArea.StageAlignmentButtons.alignment_bttn_0, 1.5, {y:main_mc_BGTopY, x:main_mc_BGLeftX, ease:Sine.easeOut});
			TweenMax.to (contentArea.StageAlignmentButtons.alignment_bttn_1, 1.5, {y:main_mc_BGTopY, x:main_mc_BGCenterX, ease:Sine.easeOut});
			TweenMax.to (contentArea.StageAlignmentButtons.alignment_bttn_2, 1.5, {y:main_mc_BGTopY, x:main_mc_BGRightX, ease:Sine.easeOut});
			TweenMax.to (contentArea.StageAlignmentButtons.alignment_bttn_3, 1.5, {y:main_mc_BGCenterY, x:main_mc_BGLeftX, ease:Sine.easeOut});
			TweenMax.to (contentArea.StageAlignmentButtons.alignment_bttn_4, 1.5, {y:main_mc_BGCenterY, x:main_mc_BGCenterX, ease:Sine.easeOut});
			TweenMax.to (contentArea.StageAlignmentButtons.alignment_bttn_5, 1.5, {y:main_mc_BGCenterY, x:main_mc_BGRightX, ease:Sine.easeOut});
			TweenMax.to (contentArea.StageAlignmentButtons.alignment_bttn_6, 1.5, {y:main_mc_BGBottomY, x:main_mc_BGLeftX, ease:Sine.easeOut});
			TweenMax.to (contentArea.StageAlignmentButtons.alignment_bttn_7, 1.5, {y:main_mc_BGBottomY, x:main_mc_BGCenterX, ease:Sine.easeOut});
			TweenMax.to (contentArea.StageAlignmentButtons.alignment_bttn_8, 1.5, {y:main_mc_BGBottomY, x:main_mc_BGRightX, ease:Sine.easeOut});
			
		}
	}
}