package com.cw.visuals.animations{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Class discription: package com.cw.visuals.animations
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: christian
	 * created: Oct 17, 2011
	 * TODO;  
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.visuals.shapeCreators.CreateShape;
	import com.greensock.TweenMax;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.display.Shape;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class SimpleLine{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var line:Shape = new Shape();
		private var shapeHolder:Sprite = new Sprite();
		private var placementTarget:Sprite
		private var startX:int
		private var startY:int
		private var toX:int
		private var toY:int
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function SimpleLine(){}
		public function simpleLineInterface(placementTarget:Sprite, startX:int, startY:int, toX:int, toY:int):void {
			this.placementTarget = placementTarget;
			this.startX = startX;
			this.startY = startY;
			this.toX = toX;
			this.toY = toY;
			addShape();
		}
		private function addShape():void {
			shapeHolder = new Sprite();
			var theShapeCreator:CreateShape = new CreateShape();
			theShapeCreator.draw(CreateShape.CIRCLE_FILLED, shapeHolder, 0, 0, 7, 7)
			TweenMax.to (shapeHolder, 0, {alpha:.5, x:startX, y:startY, tint:0x5D0000});
			placementTarget.addChild(shapeHolder);
			addLine();
		}
		private function addLine():void {
			line = new Shape();
			placementTarget.addChild(line);
			startAnimation();
		}
		private function startAnimation():void {
			TweenMax.to(shapeHolder, 1,{x:toX, y:toY, onUpdate:drawLine});
			line.graphics.clear();
			line.graphics.lineStyle(1, 0x5D0000);
			line.graphics.moveTo(shapeHolder.x, shapeHolder.y);
		}
		private function drawLine():void{
			line.graphics.lineTo(shapeHolder.x, shapeHolder.y);
		}
	}
}
