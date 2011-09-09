package com.cw.visuals.shapeCreators
{
	internal class ShapeCircleFilled extends AbastractShapeCreator{
		
		override internal function createShape():void {
			graphics.beginFill(0xFFFFFF);
			graphics.drawCircle(0, 0, 10);
			graphics.endFill();
		}
	}
}