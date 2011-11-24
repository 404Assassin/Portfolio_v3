package com.cw.visuals.flipOpen3D{
	
	
	import flash.display.MovieClip;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.events.Event;
	
	
	public class Flip3DOpen2 extends MovieClip{
		//[=-------------------------------------------------
		// Public Variables
		//[=-------------------------------------------------
		
		
		//[=-------------------------------------------------
		// Private Variables
		//[=-------------------------------------------------
		private var theStage:MovieClip;
		private var mainMC:MovieClip;
		private var placementTarget:MovieClip;
		private var mainPath:MovieClip;
		
		private var the_mcX:Number;
		private var the_mcY:Number;
		
		private var the_Center_placement0:placement = new placement();
		private var the_Top_placement:placement = new placement();
		private var the_Top_placement0:placement = new placement();
		private var the_Top_placement1:placement = new placement();
		private var the_Right_placement0:placement = new placement();
		private var the_Right_placement1:placement = new placement();
		private var the_Right_placement2:placement = new placement();
		private var the_Bottom_placement0:placement = new placement();
		private var the_Bottom_placement1:placement = new placement();
		private var the_Left_placement0:placement = new placement();
		private var the_Left_placement1:placement = new placement();
		private var the_mcWidth:Number;
		private var the_mcHeight:Number;
		private var the_mcScaleX:int;
		private var the_mcScaleY:int;
		
		//[=-------------------------------------------------
		// Constructor
		//[=-------------------------------------------------
		
		public function Flip3DOpen2(placementTarget){
			mainPath = placementTarget;
		}
		
		public function addToDisplay(the_mcX, the_mcY){
			mainPath.addChild (the_Center_placement0);
			the_mcWidth = the_Center_placement0.width;
			the_mcHeight = the_Center_placement0.height;
			trace('what is the the_mcWidth '+the_mcWidth);
			trace('what is the the_mcHeight '+the_mcHeight);
			trace('what is the the_mcX '+the_mcX);
			trace('what is the the_mcY '+the_mcY);
			
			TweenMax.to (the_Center_placement0, 0, {alpha:.0, x:the_mcX, y:the_mcY, z:-3000});
			TweenMax.to (the_Center_placement0, 2, {alpha:.75, x:the_mcX, y:the_mcY, z:0, ease:Sine.easeInOut, onComplete:initOpenAnime, onCompleteParams:[the_mcX, the_mcY]});
		}
		
		//////////////////-=] stage additions, init alpha, placement (x,y,z) and rotation(Y,X) [=-\\\\\\\\\\\\\\\\\\
		private function initOpenAnime(the_mcX, the_mcY){
			addOpenItem1(the_mcX, the_mcY);
			addOpenItem2(the_mcX, the_mcY);
			addOpenItem3(the_mcX, the_mcY);
			addOpenItem4(the_mcX, the_mcY);
		}
		private function addOpenItem1(the_mcX, the_mcY){
			mainPath.addChild (the_Top_placement0);
			TweenMax.to(the_Top_placement0.placement_contents, 0, {y:-the_mcHeight});
			TweenMax.to (the_Top_placement0, 0,{alpha:.0, x:the_mcX, y:the_mcY, rotationX:179, onComplete:FirstRotate1, onCompleteParams:[the_mcX, the_mcY]});
		}
		private function addOpenItem2(the_mcX, the_mcY){
			mainPath.addChild (the_Right_placement0);
			TweenMax.to(the_Right_placement0.placement_contents, 0, {y:-the_mcHeight});
			TweenMax.to (the_Right_placement0, 0, {alpha:.0, x:the_mcX+the_mcWidth, y:the_mcY+the_mcHeight, rotationY:-179, onComplete:FirstRotate2, onCompleteParams:[the_mcX, the_mcY]});
		}
		private function addOpenItem3(the_mcX, the_mcY){
			mainPath.addChild (the_Bottom_placement0);
			TweenMax.to (the_Bottom_placement0, 0, { alpha:.0, x:the_mcX, y:the_mcY+the_mcHeight, rotationX:-179, onComplete:FirstRotate3, onCompleteParams:[the_mcX, the_mcY]});
		}
		private function addOpenItem4(the_mcX, the_mcY){
			mainPath.addChild (the_Left_placement0);
			TweenMax.to(the_Left_placement0.placement_contents, 0, {x:-the_mcWidth});
			TweenMax.to (the_Left_placement0, 0, {alpha:.0, x:the_mcX, y:the_mcY, rotationY:-179, onComplete:FirstRotate4, onCompleteParams:[the_mcX, the_mcY]});
		}
		
		//////////////////-=] First Rotations(Y,X) [=-\\\\\\\\\\\\\\\\\\

		private function FirstRotate1(the_mcX, the_mcY):void {
			TweenMax.to (the_Top_placement0, .75, {delay:.25, alpha:.75, rotationX:0, ease:Sine.easeInOut, onComplete:addOpenItem5, onCompleteParams:[the_mcX, the_mcY]});
		}
		private function FirstRotate2(the_mcX, the_mcY):void {
			TweenMax.to (the_Right_placement0, .75, {delay:.5, alpha:.75, rotationY:0, ease:Sine.easeInOut, onComplete:addOpenItem6, onCompleteParams:[the_mcX, the_mcY]});
		}
		private function FirstRotate3(the_mcX, the_mcY):void {
			TweenMax.to (the_Bottom_placement0, .75, {delay:.75, alpha:.75, rotationX:0, ease:Sine.easeInOut, onComplete:addOpenItem7, onCompleteParams:[the_mcX, the_mcY]});
		}
		private function FirstRotate4(the_mcX, the_mcY):void {
			TweenMax.to (the_Left_placement0, .75, {delay:1, alpha:.75, rotationY:0, ease:Sine.easeInOut, onComplete:addOpenItem8, onCompleteParams:[the_mcX, the_mcY]}); 
			//return
		}
		
		//////////////////-=] open anime part two; stage additions, init alpha, placement (x,y,z) and rotation(Y,X) [=-\\\\\\\\\\\\\\\\\\

		private function addOpenItem5(the_mcX, the_mcY){
			TweenMax.to(the_Top_placement1.placement_contents, 0, {y:-the_mcHeight});
			TweenMax.to (the_Top_placement1, 0, {alpha:.0, x:the_mcX+the_mcWidth, y:the_mcY, rotationY:-179, onComplete:SecondRotate1});
			mainPath.addChild (the_Top_placement1);
		}
		private function addOpenItem6(the_mcX, the_mcY){
			TweenMax.to(the_Bottom_placement1.placement_contents, 0, {x:-the_mcWidth});
			TweenMax.to (the_Right_placement1, 0,{alpha:.0, y:the_mcY+the_mcHeight, x:the_mcX+the_mcWidth, rotationX:-179, onComplete:SecondRotate2});
			mainPath.addChild (the_Right_placement1);
		}
		private function addOpenItem7(the_mcX, the_mcY){
			TweenMax.to(the_Bottom_placement1.placement_contents, 0, {x:-the_mcWidth});
			TweenMax.to (the_Bottom_placement1, 0, {alpha:.0, x:the_mcX, y:the_mcY+the_mcHeight, rotationY:-179, onComplete:SecondRotate3});
			mainPath.addChild (the_Bottom_placement1);
		}
		private function addOpenItem8(the_mcX, the_mcY){
			TweenMax.to(the_Left_placement1.placement_contents, 0, {y:-the_mcHeight});
			TweenMax.to (the_Left_placement1, 0, {alpha:.0, x:the_mcX-the_mcWidth, y:the_mcY, rotationX:179, onComplete:SecondRotate4});
			mainPath.addChild (the_Left_placement1);
		}
		
		//////////////////-=] Second Rotations(Y,X) [=-\\\\\\\\\\\\\\\\\\

		private function SecondRotate1(){
			TweenMax.to(the_Top_placement1, 1, {alpha:.75, rotationY:0, ease:Sine.easeInOut, onComplete:SecondRotate});
		}
		private function SecondRotate2(){
			TweenMax.to(the_Right_placement1, 1.25, {alpha:.75, rotationX:0, ease:Sine.easeInOut, onComplete:SecondRotate});
		}
		private function SecondRotate3(){
			TweenMax.to(the_Bottom_placement1, 1.5, {alpha:.75, rotationY:0, ease:Sine.easeInOut, onComplete:SecondRotate});
		}
		private function SecondRotate4(){
			TweenMax.to(the_Left_placement1, 1.75, {alpha:.75, rotationX:0, ease:Sine.easeInOut, onComplete:SecondRotate});
		}
		private function SecondRotate():void {
			var i:Number = 0;
			i++
			trace(this+ ' finished '+i);
		}
		
	}
}
