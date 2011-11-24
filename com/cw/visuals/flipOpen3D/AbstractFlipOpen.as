package com.cw.visuals.flipOpen3D{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Class discription: public class AbstractFlipOpen 
	 * - Abstract class and should not be envoked directly -
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: christian
	 * created: Oct 22, 2011
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
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	internal class AbstractFlipOpen implements IFlip3D{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Protected Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		protected var placementArray:Array = new Array();
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var placementTarget:MovieClip;
		private var mainPath:MovieClip;
		private var placement_BG:MovieClip;
		private var placement_BGAlpha:Number = .5;
		private var placement_contents:MovieClip;
		private var the_mcX:Number;
		private var the_mcY:Number;
		private var finalPlacementAlpha:Number = 1;
		private var the_mcWidth:Number;
		private var the_mcHeight:Number;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function AbstractFlipOpen(){};
		public function addToDisplay(placementTarget:MovieClip, the_mcX:Number, the_mcY:Number, imagePath:String, imageName:String, imageType:String):void{
			
			
			mainPath = placementTarget;
			for(var i:uint = 0; i < 9; i++){
				var placementObject:placement = new placement();
				placementObject.alpha = 0;
				placementObject.placement_contents.placement_BG.alpha = placement_BGAlpha;
				var background:CreateShape = new CreateShape();
				background.draw(CreateShape.SQUARE_FILLED, placementObject.placement_contents.placement_BG, 0,0,62,62)
				var smallSquare:CreateShape = new CreateShape();
				smallSquare.draw(CreateShape.SQUARE_FILLED, placementObject.placement_contents.placement_BG, 26,26,10,10)
				TweenMax.to (placementObject.placement_contents.placement_BG, 0, {tint:000000});
				var imagesRefIteration:String = imagePath + imageName + i + imageType;
				var theImage:Bitmap = LoaderMax.getLoader(imagesRefIteration).rawContent;
				placementObject.placement_contents.placement_graphic.addChild(theImage);
				TweenMax.to (theImage, 0, {x:0, y:0});
				mainPath.addChild (placementObject);
				placementArray.push(placementObject);
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
		protected function addOpenItem1(){
			throw new IllegalOperationError('Abstract method: must be overridden in subclass');
			return null;
		}
		protected function addOpenItem2(){
			throw new IllegalOperationError('Abstract method: must be overridden in subclass');
			return null;
		}
		protected function addOpenItem3(){
			throw new IllegalOperationError('Abstract method: must be overridden in subclass');
			return null;
		}
		protected function addOpenItem4(){
			throw new IllegalOperationError('Abstract method: must be overridden in subclass');
			return null;
		}
		protected function addOpenItem5(){
			throw new IllegalOperationError('Abstract method: must be overridden in subclass');
			return null;
		}
		protected function addOpenItem6(){
			throw new IllegalOperationError('Abstract method: must be overridden in subclass');
			return null;
		}
		protected function addOpenItem7(){
			throw new IllegalOperationError('Abstract method: must be overridden in subclass');
			return null;
		}
		protected function addOpenItem8(){
			throw new IllegalOperationError('Abstract method: must be overridden in subclass');
			return null;
		}
	}
}

