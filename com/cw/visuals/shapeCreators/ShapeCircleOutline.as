package com.cw.visuals.shapeCreators{
	
	internal class ShapeCircleOutline extends AbastractShapeCreator{
		
		override internal function createShape():void {
			graphics.lineStyle(3, 0xFFFFFF);
			graphics.drawCircle(0, 0, 10);
		}
	}
}
