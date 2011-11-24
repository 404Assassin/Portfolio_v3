package com.cw.visuals.flipOpen3D{
	
	import flash.display.MovieClip;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.events.Event;
	
	public class Flip3DOpen4 extends MovieClip{
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
		private var placement_contents:MovieClip;
		
		
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
		
		public function Flip3DOpen4(placementTarget){
			trace(':::::::Flip3DOpen4 this placementTarget? '+ placementTarget);
			mainPath = placementTarget;
		}
		
		public function addToDisplay(the_mcX, the_mcY){
			mainPath.addChild (the_Center_placement0);
			the_mcWidth = the_Center_placement0.width;
			the_mcHeight = the_Center_placement0.height;
			trace(the_mcWidth);
			trace(the_mcHeight);
			
			TweenMax.to (the_Center_placement0, 0, {alpha:.0, x:the_mcX, y:the_mcY, z:3000, rotationY:-180, ease:Sine.easeOut});
			TweenMax.to (the_Center_placement0, 2, {alpha:.75, x:the_mcX, y:the_mcY, z:0, rotationY:0, ease:Sine.easeInOut, onComplete:addOpenItem1, onCompleteParams:[the_mcX, the_mcY]});
		}
		
		//////////////////-=] stage additions, init alpha, placement (x,y,z) and rotation(Y,X) [=-\\\\\\\\\\\\\\\\\\
		private function initOpenAnime(the_mcX, the_mcY){
			addOpenItem1(the_mcX, the_mcY);
			addOpenItem2(the_mcX, the_mcY);
			addOpenItem3(the_mcX, the_mcY);
			addOpenItem4(the_mcX, the_mcY);
/*			FirstRotate(the_mcX, the_mcY);*/
		}
		private function addOpenItem1(the_mcX, the_mcY){
			mainPath.addChild (the_Top_placement0);
			TweenMax.to (the_Top_placement0.placement_contents, 0, {y:-the_mcHeight});
			TweenMax.to (the_Top_placement0, 0,{alpha:.0, x:the_mcX, y:the_mcY, rotationX:179});
			TweenMax.to (the_Top_placement0, .5, {alpha:.75, rotationX:0, rotationY:0, ease:Sine.easeInOut, onComplete:addOpenItem2, onCompleteParams:[the_mcX, the_mcY]});
		}
		private function addOpenItem2(the_mcX, the_mcY){
			mainPath.addChild (the_Top_placement1);
			TweenMax.to (the_Top_placement1.placement_contents, 0, {y:-the_mcHeight});
			TweenMax.to (the_Top_placement1, 0, {alpha:.0, x:the_mcX+the_mcWidth, y:the_mcY, rotationX:179, rotationY:-179});
			TweenMax.to (the_Top_placement1, .5, {alpha:.75, rotationX:0, rotationY:0, ease:Sine.easeInOut, onComplete:addOpenItem3, onCompleteParams:[the_mcX, the_mcY]});
		}
		private function addOpenItem3(the_mcX, the_mcY){
			mainPath.addChild (the_Right_placement0);
			TweenMax.to (the_Right_placement0.placement_contents, 0, {y:-the_mcHeight});
			TweenMax.to (the_Right_placement0, 0, {alpha:.0, x:the_mcX+the_mcWidth, y:the_mcY+the_mcHeight, rotationY:-179});
			TweenMax.to (the_Right_placement0, .5, {alpha:.75, rotationY:0, ease:Sine.easeInOut, onComplete:addOpenItem4, onCompleteParams:[the_mcX, the_mcY]});
		}
		private function addOpenItem4(the_mcX, the_mcY){
			mainPath.addChild (the_Right_placement1);
			TweenMax.to (the_Right_placement1, 0,{alpha:.0, y:the_mcY+the_mcHeight, x:the_mcX+the_mcWidth, rotationX:-179, rotationY:-179});
			TweenMax.to (the_Right_placement1, .5, {alpha:.75, rotationX:0, rotationY:0, ease:Sine.easeOut, onComplete:addOpenItem5, onCompleteParams:[the_mcX, the_mcY]});
		}
		private function addOpenItem5(the_mcX, the_mcY){
			mainPath.addChild (the_Bottom_placement0);
			TweenMax.to (the_Bottom_placement0, 0, {alpha:.0, x:the_mcX, y:the_mcY+the_mcHeight, rotationX:-179});
			TweenMax.to (the_Bottom_placement0, .5, {alpha:.75, rotationX:0, ease:Sine.easeInOut, onComplete:addOpenItem6, onCompleteParams:[the_mcX, the_mcY]});
		}
		private function addOpenItem6(the_mcX, the_mcY){
			mainPath.addChild (the_Bottom_placement1);
			TweenMax.to (the_Bottom_placement1.placement_contents, 0, {x:-the_mcWidth});
			TweenMax.to (the_Bottom_placement1, 0, {alpha:.0, x:the_mcX, y:the_mcY+the_mcHeight, rotationX:-179, rotationY:-179});
			TweenMax.to (the_Bottom_placement1, .5, {alpha:.75, rotationX:0, rotationY:0, ease:Sine.easeInOut, onComplete:addOpenItem7, onCompleteParams:[the_mcX, the_mcY]});
		}
		
		private function addOpenItem7(the_mcX, the_mcY){
			mainPath.addChild (the_Left_placement0);
			TweenMax.to (the_Left_placement0.placement_contents, 0, {x:-the_mcWidth});
			TweenMax.to (the_Left_placement0, 0, {alpha:.0, x:the_mcX, y:the_mcY, rotationY:-179});
			TweenMax.to (the_Left_placement0, .5, {alpha:.75, rotationY:0, ease:Sine.easeInOut, onComplete:addOpenItem8, onCompleteParams:[the_mcX, the_mcY]}); 
		}
		
		private function addOpenItem8(the_mcX, the_mcY){
			mainPath.addChild (the_Left_placement1);
			TweenMax.to(the_Left_placement1.placement_contents, 0, {x:-the_mcWidth, y:-the_mcHeight});
			TweenMax.to (the_Left_placement1, 0, {alpha:.0, x:the_mcX, y:the_mcY, rotationX:-179, rotationY:-179});
			TweenMax.to (the_Left_placement1, 1.25, {alpha:.75, rotationX:0, rotationY:0, ease:Sine.easeInOut});
/*			TweenMax.to (the_Left_placement1, 0, {alpha:.0, x:the_mcX+the_mcWidth, y:the_mcY+the_mcHeight, rotationX:179, rotationY:179});
			TweenMax.to (the_Left_placement1, .75, {alpha:.75, x:the_mcX-the_mcWidth, y:the_mcY-the_mcHeight, rotationX:0, rotationY:0, ease:Sine.easeOut});*/
		}

		
	}
}
