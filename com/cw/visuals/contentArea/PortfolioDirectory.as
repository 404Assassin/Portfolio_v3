package com.cw.visuals.contentArea{
	import com.cw.controls.directoryUIs.CSectionDirectory;
	import com.cw.visuals.flipOpen3D.CDevelopmentDirectory;
	import com.cw.visuals.flipOpen3D.CFlipOpen3Dv1;
	import com.cw.visuals.flipOpen3D.Flip3DOpen1;
	import com.cw.visuals.flipOpen3D.Flip3DOpen2;
	import com.cw.visuals.flipOpen3D.Flip3DOpen3;
	import com.cw.visuals.flipOpen3D.Flip3DOpen4;
	import com.cw.visuals.flipOpen3D.Flip3DOpen5;
	import com.cw.visuals.flipOpen3D.FlipOpen3dAnime5;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class PortfolioDirectory{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var directoryButtonWidth:int = 62;
		private var directoryButtonHeight:int = 62;
		private var displayContainer:MovieClip;
		private var stageReference:Stage;
		private var mainMC:MovieClip;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function PortfolioDirectory(){};
		public function portfolioDirectoryInterface(stageReference:Stage, mainMC:MovieClip):void{
			this.stageReference = stageReference;
			this.mainMC = mainMC;
			addDisplayContainer();
		}
		public function portfolioDirectoryOffInterface():void{
			TweenMax.to (displayContainer, 1, {delay:.5, alpha:0, visible:false, ease:Sine.easeOut});
			displayContainer = null;
		}
		private function addDisplayContainer():void{
			displayContainer = new MovieClip();
			mainMC.content_stage.addChild(displayContainer);
			TweenMax.to (displayContainer, 1, {delay:.5, alpha:1, z:-25, ease:Sine.easeOut});
			//TweenMax.to(displayContainer, 1, {dropShadowFilter:{color:0x000000, alpha:.75, blurX:12, blurY:12, distance:12, ease:Sine.easeOut}});
			addToDisplay();
		}
		private function addToDisplay():void{
			developmentDirectory();
			motionDirectory();
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// params for Flipout5.addToDisplay are, by both name and type, are the_mcX:Number, the_mcY:Number, imagePath:String, imageName:String, imageType:String
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function motionDirectory():void {
			var motionDirectoryHolder:MovieClip = new MovieClip();
			displayContainer.addChild(motionDirectoryHolder);
			var theCFlipOpen3Dv1:CFlipOpen3Dv1 = new CFlipOpen3Dv1();
			theCFlipOpen3Dv1.setCFlip3D('TheRaven_0', directoryButtonWidth, directoryButtonHeight);
			var motionDirectory:Sprite = theCFlipOpen3Dv1.getCFlipOpen3D();
			motionDirectoryHolder.addChild(motionDirectory);
			TweenMax.to(motionDirectory, 0, {rotationY:-180, x:320, y:-45});
			TweenMax.to(motionDirectoryHolder, 1, {delay:2.5, alpha:1, z:50, dropShadowFilter:{color:0x000000, alpha:.5, blurX:15, blurY:15, distance:30}, ease:Sine.easeOut, onComplete:animeLoop, onCompleteParams:[motionDirectoryHolder]});
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// params for Flipout5.addToDisplay are, by both name and type, are the_mcX:Number, the_mcY:Number, imagePath:String, imageName:String, imageType:String
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
/*		private function developmentDirectory():void {
			var developmentDirectoryHolder:MovieClip = new MovieClip();
			displayContainer.addChild(developmentDirectoryHolder);
			var theCDevelopmentDirectory:CDevelopmentDirectory = new CDevelopmentDirectory();
			theCDevelopmentDirectory.setCFlip3D('compass_v0', directoryButtonWidth, directoryButtonHeight);
			theCDevelopmentDirectory.stageAccess(stageReference);
			var developmentDirectory:Sprite = theCDevelopmentDirectory.getCFlipOpen3D();
			developmentDirectoryHolder.addChild(developmentDirectory);
			TweenMax.to(developmentDirectory, 0, {rotationY:-180, x:-260, y:-45});
			TweenMax.to(developmentDirectoryHolder, 1, {delay:2.5, alpha:1, z:50, dropShadowFilter:{color:0x000000, alpha:.5, blurX:15, blurY:15, distance:30}, ease:Sine.easeOut, onComplete:animeLoop, onCompleteParams:[developmentDirectoryHolder]});
		}*/
		private function developmentDirectory():void {
			var designDirectoryHolder:MovieClip = new MovieClip();
			displayContainer.addChild(designDirectoryHolder);
			var CDesignDirectory:CSectionDirectory = new CSectionDirectory();
			CDesignDirectory.setCFlip3D('design', directoryButtonWidth, directoryButtonHeight);
			CDesignDirectory.stageAccess(stageReference, 'design');
			var developmentDirectory:Sprite = CDesignDirectory.getCFlipOpen3D();
			designDirectoryHolder.addChild(developmentDirectory);
			TweenMax.to(developmentDirectory, 0, {rotationY:-180, x:-260, y:-45});
			TweenMax.to(designDirectoryHolder, 1, {delay:2.5, alpha:1, z:50, dropShadowFilter:{color:0x000000, alpha:.5, blurX:15, blurY:15, distance:30}, ease:Sine.easeOut, onComplete:animeLoop, onCompleteParams:[designDirectoryHolder]});
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// loop for nested 3d displayObject bug
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function animeLoop(animeHolder:MovieClip):void {
			var timeline:TimelineMax = new TimelineMax({repeat:-1, yoyo:true, repeatDelay:0});
			timeline.append(TweenMax.to(animeHolder, 1, {alpha:1}));
			timeline.append(TweenMax.to(animeHolder, 1, {alpha:.99999}));
		}
	}
}
