package com.cw.visuals{
	
	
	import flash.display.MovieClip;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.events.Event;
	
	
	public class Flip3D extends MovieClip{
		//[=-------------------------------------------------
		// Public Variables
		//[=-------------------------------------------------
		//////////// first on stage display objects x and y ///////////
		public var the_mcX:Number;
		public var the_mcY:Number;
		
		//[=-------------------------------------------------
		// Private Variables
		//[=-------------------------------------------------
		//private var the_mc:MovieClip;main.swfStage.mainMC
		private var theStage:MovieClip;
		private var mainMC:MovieClip;
		
		private var the_mc:mc = new mc();
		private var the_Center_placement0:placement = new placement();
		private var the_Top_placement:placement = new placement();
		private var the_Top_placement0:placement = new placement();
		private var the_Top_placement1:placement = new placement();
		private var the_Right_mc0:mc = new mc();
		private var the_Right_placement0:placement = new placement();
		private var the_Right_placement1:placement = new placement();
		private var the_Right_placement2:placement = new placement();
		private var the_Bottom_mc0:mc = new mc();
		private var the_Bottom_placement0:placement = new placement();
		private var the_Bottom_placement1:placement = new placement();
		private var the_Left_mc0:mc = new mc();
		private var the_Left_placement0:placement = new placement();
		private var the_Left_placement1:placement = new placement();
		private var the_mcWidth:Number;
		private var the_mcHeight:Number;
		private var the_mcScaleX:int;
		private var the_mcScaleY:int ;
		//[=-------------------------------------------------
		// Constructor
		//[=-------------------------------------------------
		public function Flip3D(){
			var the_mcX:Number = 0;
			var the_mcY:Number = 0;
			//addToDisplay();
		}
		public function addToDisplay(/*the_mcX:Number, the_mcY:Number*/){
			the_mcX = the_mcX
			the_mcY = the_mcY
			main.swfStage.addChild (the_Center_placement0);
			the_mcWidth = the_mc.width;
			the_mcHeight = the_mc.height;
			trace(the_mcWidth);
			trace(the_mcHeight);
			
			//var the_mc1:mc = new mc();
			
			//TweenMax.to (the_Center_placement0, 5, {alpha:.75, z:0, ease:Sine.easeInOut, onComplete:initOpenAnime});
			//initOpenAnime();
			//addEventListener(Event.ADDED_TO_STAGE, FirstRotate);
			
			
			TweenMax.to (the_Center_placement0, 0, {alpha:.0, x:the_mcX, y:the_mcY, z:-3000,  rotationY:0, ease:Sine.easeOut});
			TweenMax.to (the_Center_placement0, 4, {alpha:.75, z:0, ease:Sine.easeInOut, onComplete:initOpenAnime});
		}
		
		//////////////////-=] stage additions, init alpha, placement (x,y,z) and rotation(Y,X) [=-\\\\\\\\\\\\\\\\\\
		private function initOpenAnime(){

			addOpenItem1();
			addOpenItem2();
			addOpenItem3();
			addOpenItem4();
			FirstRotate();
			
		}
		private function addOpenItem1(){
			main.swfStage.addChild (the_Top_placement0);
			TweenMax.to(the_Top_placement0.square, 0, {y:-the_mcHeight});
			trace('the x '+the_Top_placement0.x + ' Number for the_mcX ' + the_mcX);
			trace('the y '+the_Top_placement0.y + ' Number for the_mcY ' + the_mcY);
			TweenMax.to (the_Top_placement0, 0,{alpha:.0, x:the_mcX, y:the_mcY, rotationX:-179});
			
		}
		private function addOpenItem2(){
			main.swfStage.addChild (the_Right_placement0);
			TweenMax.to(the_Right_placement0.square, 0, {y:-the_mcHeight});
			TweenMax.to (the_Right_placement0, 0, {alpha:.0, x:the_mcX+the_mcWidth, y:the_mcY+the_mcHeight, rotationX:0, rotationY:-179});
		}
		private function addOpenItem3(){
			main.swfStage.addChild (the_Bottom_placement0);
			/*TweenMax.to(the_Bottom_placement0.square, 0, {y:-the_mcHeight});*/
			TweenMax.to (the_Bottom_placement0, 0, {alpha:.0, x:the_mcX, y:the_mcY+the_mcHeight, rotationX:-179});
		}
		private function addOpenItem4(){
			main.swfStage.addChild (the_Left_placement0);
			TweenMax.to(the_Left_placement0.square, 0, {x:-the_mcWidth});
			TweenMax.to (the_Left_placement0, 0, {alpha:.0, x:the_mcX, y:the_mcY, rotationY:-179});
			main.swfStage.addEventListener(Event.ADDED_TO_STAGE, FirstRotate);
		}
		private function FirstRotate(/*the_mc:MovieClip, mcMask:MovieClip*/):void {
			trace('FirstRotate');
			
			TweenMax.to (the_Center_placement0, 1, {alpha:.75, rotationX:0, ease:Sine.easeInOut});
			TweenMax.to (the_Top_placement0, 1, {alpha:.75, rotationX:0, ease:Sine.easeInOut});
			TweenMax.to (the_Right_placement0, 1, {alpha:.75, rotationY:0, ease:Sine.easeInOut});
			TweenMax.to (the_Bottom_placement0, 1, {alpha:.75, rotationX:0, ease:Sine.easeInOut});
			TweenMax.to (the_Left_placement0, 1, {alpha:.75, rotationY:0, ease:Sine.easeInOut, onComplete:FirstAdditions}); 
		}
		private function FirstAdditions(/*the_mc:MovieClip, mcMask:MovieClip*/):void {
			trace('FirstAdditions');
			
			main.swfStage.addChild (the_Right_placement1);
			/*TweenMax.to(the_Right_placement1.square, 0, {y:-the_mcHeight});*/
			TweenMax.to (the_Right_placement1, 0,{alpha:.0, y:the_mcY+the_mcHeight, x:the_mcX+the_mcWidth, rotationX:-179/*, rotationY:-180*/});
			
			main.swfStage.addChild (the_Bottom_placement1);
			TweenMax.to(the_Bottom_placement1.square, 0, {x:-the_mcWidth});
			TweenMax.to (the_Bottom_placement1, 0, {alpha:.0, x:the_mcX, y:the_mcY+the_mcHeight, rotationY:-179});
			
			main.swfStage.addChild (the_Left_placement1);
			TweenMax.to(the_Left_placement1.square, 0, {y:-the_mcHeight});
			TweenMax.to (the_Left_placement1, 0, {alpha:.0, x:the_mcX-the_mcWidth, y:the_mcY, rotationX:-179});
			
			//TweenMax.to(the_mc, 1, {shortRotation:{rotationX:-179.9}, ease:Sine.easeInOut, onComplete:FirstRotateFinish});
			FirstRotateFinish();
		}
		
		private function FirstRotateFinish(/*the_mc:MovieClip, mcMask:MovieClip*/):void {
			TweenMax.to (the_Right_placement1, 1.25, {alpha:.75, rotationX:0, ease:Sine.easeInOut, onComplete:SecondRotate});
			TweenMax.to (the_Bottom_placement1, 1, {alpha:.75, rotationY:0, ease:Sine.easeInOut});
			TweenMax.to (the_Left_placement1, 1, {alpha:.75, rotationX:0, ease:Sine.easeInOut});
			
			/*			TweenMax.to(the_mc.square, 0, {x:-the_mcWidth});
			TweenMax.to(the_mc, 0, {x:the_mcX+the_mcWidth});*/
			
			main.swfStage.addChild (the_Top_placement1);
			TweenMax.to(the_Top_placement1.square, 0, {y:-the_mcHeight});
			TweenMax.to (the_Top_placement1, 0, {alpha:.0, x:the_mcX+the_mcWidth, y:the_mcY, rotationY:-179});
			
			//TweenMax.to(the_mc, .25, {onComplete:SecondRotate/*, onCompleteParams:[the_mc, mcMask]*/});
		}
		
		private function SecondRotate(/*the_mc:MovieClip, mcMask:MovieClip*/):void {
			//TweenMax.to (the_Right_mc0, 3, {alpha:.75, rotationX:-179.9, ease:Sine.easeInOut});
			TweenMax.to (the_Right_placement1, 3, {alpha:.75, /*rotationX:0,*/ ease:Sine.easeInOut});
			
			//TweenMax.to (the_Bottom_placement0, 3, {alpha:.75, rotationY:-179.9, ease:Sine.easeInOut});
			//TweenMax.to (the_Bottom_placement1, 3, {alpha:.75, /*rotationX:180,*/ ease:Sine.easeInOut});
			
			//TweenMax.to (the_Left_placement0, 3, {alpha:.75, rotationX:-179.9, ease:Sine.easeInOut});
			//TweenMax.to (the_Left_placement1, 3, {alpha:.75, rotationX:0, ease:Sine.easeInOut});
			
			TweenMax.to(the_Top_placement1, 1.5, {alpha:.75, rotationY:0, ease:Sine.easeInOut});
			//TweenMax.to(the_mc, 1.5, {shortRotation:{rotationY:-179.9}, ease:Sine.easeInOut/*, onComplete:TheClose, onCompleteParams:[the_mc]*/});
		}
		
		////////////////////-=• closeing tween •=-\\\\\\\\\\\\\\\\\\
		private function TheClose(/*the_mc:MovieClip, mcMask:MovieClip*/):void {
			//trace('TheCloseStartsHere');
			//TweenMax.to(the_mc.square, 0,  {x:0});
			TweenMax.to(the_mc, 1,  {y:175, onComplete:TheCloseSecondRotate/*, onCompleteParams:[the_mc, mcMask]*/});
		}
		private function TheCloseSecondRotate(/*the_mc:MovieClip, mcMask:MovieClip*/):void {
			//trace('SecondCloseRotation');
			TweenMax.to(the_mc, .25, {shortRotation:{rotationY:.2}, ease:Sine.easeInOut, onComplete:TheCloseReposition/*, onCompleteParams:[the_mc, mcMask]*/});
			//TweenMax.to(mcMask, 0,  {y:200});
			//trace('the value of the_mc.x '+ the_mc.x);
		}
		private function TheCloseReposition(/*the_mc:MovieClip, mcMask:MovieClip*/):void {
			//trace('CloseRotationFinish');
			TweenMax.to(the_mc.square, 0,  {/*x:-54, */y:-66, ease:Sine.easeOut});
			TweenMax.to(the_mc, 1,  {y:200, ease:Sine.easeOut, onComplete:TheCloseBounce/*, onCompleteParams:[the_mc, mcMask]*/});
			//trace('the value of the_mc.x '+ the_mc.x);
		}
		private function TheCloseBounce(/*the_mc:MovieClip, mcMask:MovieClip*/):void {
			//trace('CloseFinish');
			//TweenMax.to(the_mc, 0, {shortRotation:{rotationY:0}, onComplete:onOpenFinish, ease:Sine.easeInOut});
			//TweenMax.to(mcMask, 0,  {y:200});
			//TweenMax.to(the_mc.square , .25, {y:50, y:66,scaleX:.29, scaleY:.29, /**/ onComplete:onOpenFinish/*, ease:Bounce.easeOut*/});
			//TweenMax.to(the_mc.parent, .5, {x:my_current_x, y:my_current_y, ease:Sine.easeOut});
			//trace('what is the_mc.parent here? ' + the_mc.parent);
			
		}
	}
}
