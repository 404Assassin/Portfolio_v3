package com.cw.visuals{
	/*
	-=] 3D flip open graphic animation [=-
	-=] language version ActionScript 3.0 [=-
	-=] player version Flash 10.0 [=-
	-=] author Christian Worley [=-
	-=] created 08/2011 [=-
	-=] TODO; create custom ADDED_TO_STAGE Event that can include params in the method call [=-
	*/
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.data.bitmaps.BitmapLoader;
	import com.cw.visuals.shapeCreators.CreateShape;
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Constructor
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	public class Flip3DOpen5 extends Sprite implements IFlip3D{
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		//private var placement:Object;
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
		private var placementArray:Array = new Array();
		
		//private var BitmapLoaderIteration:BitmapLoader = new BitmapLoader();

		public function addToDisplay(placementTarget:MovieClip, the_mcX:Number, the_mcY:Number, imagePath:String, imageName:String, imageType:String){
			mainPath = placementTarget;
			for(var i:uint = 0; i < 9; i++){
				var placementObject:placement = new placement();
				placementObject.alpha = 0;
				placementObject.placement_contents.placement_BG.alpha = placement_BGAlpha;
				var theShapeCreator:CreateShape = new CreateShape();
				theShapeCreator.draw(CreateShape.SQUARE_FILLED, placementObject.placement_contents.placement_BG, 0,0,0)
				TweenMax.to (placementObject.placement_contents.placement_BG, 0, {width:62, height:62, x:31, y:31, tint:000000});
				
				var imagesRefIteration:String = imagePath + imageName + i + imageType;
				var BitmapLoaderIteration:BitmapLoader = new BitmapLoader();
				//:::::::::::::::::::::::::::::::::::::::::::::::::
				// params for LoadBitmap are, by both name and type the bitmap's; imageSourceRefrence:String, the placementTarget MC path, and the init placementX:Number, placementY:Number
				//:::::::::::::::::::::::::::::::::::::::::::::::::
				BitmapLoaderIteration.LoadBitmap(imagesRefIteration, placementObject.placement_contents.placement_graphic, the_mcX, the_mcY);
				mainPath.addChild (placementObject);
				placementArray.push(placementObject);
			}
			the_mcWidth = placementArray[4].width;
			the_mcHeight = placementArray[4].height;
			//mainPath.addEventListener(Event.ADDED_TO_STAGE, initStagePlacement(the_mcX, the_mcY));
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
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// init the open animations
		//:::::::::::::::::::::::::::::::::::::::::::::::::
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
