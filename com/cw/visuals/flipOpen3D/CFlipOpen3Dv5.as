package com.cw.visuals.flipOpen3D{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Class discription: public class CFlipOpen3Dv5 implements IFlip3D
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: christian
	 * created: Oct 24, 2011
	 * TODO;  
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.data.bitmaps.BitmapLoader;
	import com.cw.visuals.shapeCreators.CreateShape;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.display.ContentDisplay;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class CFlipOpen3Dv5 implements ICFlip3D{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var placementObject:placement;
		private var placementTarget:MovieClip;
		private var returnedObject:MovieClip;
		private var placement_BG:MovieClip;
		private var placement_BGAlpha:Number = .5;
		private var placement_contents:MovieClip;
		private var the_mcX:Number;
		private var the_mcY:Number;
		private var finalPlacementAlpha:Number = 1;
		private var the_mcWidth:Number;
		private var the_mcHeight:Number;
		private var placementArray:Array = new Array();
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function CFlipOpen3Dv5(){};
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function setCFlip3D(imageName:String, backgroundWidth:Number, backgroundHeight:Number):void{
			this.imageName = imageName;
			this.backgroundWidth = backgroundWidth;
			this.backgroundHeight = backgroundHeight;
			iterativeBuild();
		}
/*		public function setCFlip3D(imageName:String, backgroundWidth:Number, backgroundHeight:Number):void{
			returnedObject = new MovieClip();
			for(var i:uint = 0; i < 9; i++){
				var imagesRefIteration:String = imageName + i;
				var theImage:Bitmap = LoaderMax.getContent(imagesRefIteration).rawContent;
				var imageWidth:Number = theImage.width;
				var imageHeight:Number = theImage.height;
				var placementSprite:Sprite = new Sprite();
				var placementContents:Sprite = new Sprite();
				placementSprite.addChild(placementContents);
				var placementBackground:Sprite = new Sprite();
				placementContents.addChild(placementBackground);
				var placementGraphics:Sprite = new Sprite();
				placementContents.addChild(placementGraphics);
				contentsArray.push(placementContents);
				placementSprite.alpha = 0;
				placementBackground.alpha = placement_BGAlpha;
				var background:CreateShape = new CreateShape();
				background.draw(CreateShape.SQUARE_FILLED, placementBackground, 0,0,backgroundWidth,backgroundHeight)
				var smallSquare:CreateShape = new CreateShape();
				var backgroundCenterX:Number = (backgroundWidth - backgroundCenterWidth) / 2;
				var backgroundCenterY:Number = (backgroundHeight - backgroundCenterHeight) / 2;
				smallSquare.draw(CreateShape.SQUARE_FILLED, placementBackground, backgroundCenterX,backgroundCenterY,backgroundCenterWidth,backgroundCenterHeight)
				TweenMax.to (placementBackground, 0, {tint:000000});
				placementGraphics.addChild(theImage);
				var theImageX:Number = (backgroundWidth - imageWidth) / 2;
				var theImageY:Number = (backgroundHeight - imageHeight) / 2;
				TweenMax.to (theImage, 0, {x:theImageX, y:theImageY});
				returnedObject.addChild (placementSprite);
				placementArray.push(placementSprite);
			}
			the_mcWidth = placementArray[4].width;
			the_mcHeight = placementArray[4].height;
			initStagePlacement(the_mcX, the_mcY);
		}*/
		public function getCFlipOpen3D():Sprite{
			return returnedObject;
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function iterativeBuild():void {
			returnedObject = new MovieClip();
			for(var i:uint = 0; i < 9; i++){
				var imagesRefIteration:String = imageName + i;
				var theImage:Bitmap = LoaderMax.getContent(imagesRefIteration).rawContent;
				var imageWidth:Number = theImage.width;
				var imageHeight:Number = theImage.height;
				var placementSprite:Sprite = new Sprite();
				var placementContents:Sprite = new Sprite();
				placementSprite.addChild(placementContents);
				var placementBackground:Sprite = new Sprite();
				placementContents.addChild(placementBackground);
				var placementGraphics:Sprite = new Sprite();
				placementContents.addChild(placementGraphics);
				contentsArray.push(placementContents);
				placementSprite.alpha = 0;
				placementBackground.alpha = placement_BGAlpha;
				var background:CreateShape = new CreateShape();
				background.draw(CreateShape.SQUARE_FILLED, placementBackground, 0,0,backgroundWidth,backgroundHeight)
				var smallSquare:CreateShape = new CreateShape();
				var backgroundCenterX:Number = (backgroundWidth - backgroundCenterWidth) / 2;
				var backgroundCenterY:Number = (backgroundHeight - backgroundCenterHeight) / 2;
				smallSquare.draw(CreateShape.SQUARE_FILLED, placementBackground, backgroundCenterX,backgroundCenterY,backgroundCenterWidth,backgroundCenterHeight)
				TweenMax.to (placementBackground, 0, {tint:000000});
				placementGraphics.addChild(theImage);
				var theImageX:Number = (backgroundWidth - imageWidth) / 2;
				var theImageY:Number = (backgroundHeight - imageHeight) / 2;
				TweenMax.to (theImage, 0, {x:theImageX, y:theImageY});
				returnedObject.addChild (placementSprite);
				placementArray.push(placementSprite);
			}
			the_mcWidth = placementArray[4].width;
			the_mcHeight = placementArray[4].height;
			initStagePlacement(the_mcX, the_mcY);
		}
		private function initStagePlacement(the_mcX, the_mcY){
			TweenMax.to (placementArray[0].placement_contents, 0, {x:-the_mcWidth, y:-the_mcHeight});
			TweenMax.to (placementArray[0], 0, {alpha:.0, x:the_mcX, y:the_mcY, rotationX:-179, rotationY:-179});
			TweenMax.to (placementArray[1].placement_contents, 0, {y:-the_mcHeight});
			TweenMax.to (placementArray[1], 0,{alpha:.0, x:the_mcX, y:the_mcY, rotationX:179});
			TweenMax.to (placementArray[2].placement_contents, 0, {y:-the_mcHeight});
			TweenMax.to (placementArray[2], 0, {alpha:.0, x:the_mcX+the_mcWidth, y:the_mcY, rotationX:179, rotationY:-179});
			TweenMax.to (placementArray[3].placement_contents, 0, {x:-the_mcWidth});
			TweenMax.to (placementArray[3], 0, {alpha:.0, x:the_mcX, y:the_mcY, rotationY:-179});
			TweenMax.to (placementArray[4], 0, {alpha:.0, x:the_mcX+40, y:the_mcY, z:100, rotationY:0, ease:Sine.easeOut});
			TweenMax.to (placementArray[5].placement_contents, 0, {y:-the_mcHeight});
			TweenMax.to (placementArray[5], 0, {alpha:.0, x:the_mcX+the_mcWidth, y:the_mcY+the_mcHeight, rotationY:-179});
			TweenMax.to (placementArray[6].placement_contents, 0, {x:-the_mcWidth});
			TweenMax.to (placementArray[6], 0, {alpha:.0, x:the_mcX, y:the_mcY+the_mcHeight, rotationX:-179, rotationY:-179});
			TweenMax.to (placementArray[7], 0, {alpha:.0, x:the_mcX, y:the_mcY+the_mcHeight, rotationX:-179});
			TweenMax.to (placementArray[8], 0,{alpha:.0, y:the_mcY+the_mcHeight, x:the_mcX+the_mcWidth, rotationX:-179, rotationY:-179});
			TweenMax.to (placementArray[4], 2, {alpha:finalPlacementAlpha,x:the_mcX, y:the_mcY, z:0, rotationY:0, ease:Sine.easeInOut, onComplete:initOpenAnime});
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// init the open animations
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function initOpenAnime(){
			for(var i:uint = 1; i <= 8; i++){
				var addOpenItemIteration='addOpenItem'+String(i);
				this[addOpenItemIteration]();
			}
		}
		private function addOpenItem1(){
			TweenMax.to (placementArray[1], .5, {alpha:finalPlacementAlpha, rotationX:0, rotationY:0, ease:Sine.easeInOut});
		}
		private function addOpenItem2(){
			TweenMax.to (placementArray[2], .6, {alpha:finalPlacementAlpha, rotationX:0, rotationY:0, ease:Sine.easeInOut});
		}
		private function addOpenItem3(){
			TweenMax.to (placementArray[5], .7, {alpha:finalPlacementAlpha, rotationY:0, ease:Sine.easeInOut});
		}
		private function addOpenItem4(){
			TweenMax.to (placementArray[8], .8, {alpha:finalPlacementAlpha, rotationX:0, rotationY:0, ease:Sine.easeOut});
		}
		private function addOpenItem5(){
			TweenMax.to (placementArray[7], .9, {alpha:finalPlacementAlpha, rotationX:0, ease:Sine.easeInOut});
		}
		private function addOpenItem6(){
			TweenMax.to (placementArray[6], 1, {alpha:finalPlacementAlpha, rotationX:0, rotationY:0, ease:Sine.easeInOut});
		}
		private function addOpenItem7(){
			TweenMax.to (placementArray[3], 1.1, {alpha:finalPlacementAlpha, rotationY:0, ease:Sine.easeInOut}); 
		}
		private function addOpenItem8(){
			TweenMax.to (placementArray[0], 1.25, {alpha:finalPlacementAlpha, rotationX:0, rotationY:0, ease:Sine.easeInOut});
		}
	}
}
