package com.cw.visuals.shapeCreators{
	
	internal class ShapeSquareOutline extends AbastractShapeCreator{
		
		override internal function createShape():void {
			graphics.lineStyle(3, 0xFFFFFF);
			graphics.drawRect(-10,-10,20,20);
		}
	}
}