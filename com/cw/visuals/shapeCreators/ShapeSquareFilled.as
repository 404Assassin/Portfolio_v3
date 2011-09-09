package com.cw.visuals.shapeCreators
{
	internal class ShapeSquareFilled extends AbastractShapeCreator{
		
		override internal function createShape():void {
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(-10,-10,20,20);
			graphics.endFill();
		}
	}
}