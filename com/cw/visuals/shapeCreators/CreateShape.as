package com.cw.visuals.shapeCreators{
	
	public class CreateShape extends ShapeCreator{
		
		public static const CIRCLE_OUTLINE:uint = 0;
		public static const CIRCLE_FILLED:uint = 1;
		public static const SQUARE_OUTLINE:uint = 2;
		public static const SQUARE_FILLED:uint = 3;
		
		override protected function createShape(shapeType:uint):AbastractShapeCreator{
			if(shapeType == CIRCLE_OUTLINE){
				return new ShapeCircleOutline();
			}else if(shapeType == CIRCLE_FILLED){
				return new ShapeSquareFilled();
			}else if(shapeType == SQUARE_OUTLINE){
				return new ShapeSquareFilled();
			}else if(shapeType == SQUARE_FILLED){
				return new ShapeSquareFilled();
			}else{
				throw new Error('Invalid shape');
			}
		}
	}
}