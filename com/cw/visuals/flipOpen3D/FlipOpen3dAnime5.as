package com.cw.visuals.flipOpen3D{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Class discription: public class FlipOpen3dAnime5 extends AbstractFlipOpen
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: christian
	 * created: Oct 23, 2011
	 * TODO;  
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class FlipOpen3dAnime5 extends AbstractFlipOpen{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var finalPlacementAlpha:Number = 1;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function FlipOpen3dAnime5(){
			super();
		}
		override protected function addOpenItem1(){
			TweenMax.to (placementArray[1], .5, {alpha:finalPlacementAlpha, rotationX:0, rotationY:0, ease:Sine.easeInOut});
		}
		override protected function addOpenItem2(){
			TweenMax.to (placementArray[2], .6, {alpha:finalPlacementAlpha, rotationX:0, rotationY:0, ease:Sine.easeInOut});
		}
		override protected function addOpenItem3(){
			TweenMax.to (placementArray[5], .7, {alpha:finalPlacementAlpha, rotationY:0, ease:Sine.easeInOut});
		}
		override protected function addOpenItem4(){
			TweenMax.to (placementArray[8], .8, {alpha:finalPlacementAlpha, rotationX:0, rotationY:0, ease:Sine.easeOut});
		}
		override protected function addOpenItem5(){
			TweenMax.to (placementArray[7], .9, {alpha:finalPlacementAlpha, rotationX:0, ease:Sine.easeInOut});
		}
		override protected function addOpenItem6(){
			TweenMax.to (placementArray[6], 1, {alpha:finalPlacementAlpha, rotationX:0, rotationY:0, ease:Sine.easeInOut});
		}
		override protected function addOpenItem7(){
			TweenMax.to (placementArray[3], 1.1, {alpha:finalPlacementAlpha, rotationY:0, ease:Sine.easeInOut}); 
		}
		override protected function addOpenItem8(){
			TweenMax.to (placementArray[0], 1.25, {alpha:finalPlacementAlpha, rotationX:0, rotationY:0, ease:Sine.easeInOut});
		}
	}
}

