package com.cw.visuals.shapeCreators{
	/*
	-=] shape creator interface through createShape() Factory method [=-
	-=] language version ActionScript 3.0 [=-
	-=] player version Flash 10.0 [=-
	-=] author Christian Worley [=-
	-=] created 08/2011 [=-
	-=] TODO; add more shape classes [=-
	*/
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.Shape;
	import flash.display.DisplayObjectContainer;
	import flash.errors.IllegalOperationError;
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// ABSTRACT Class (should be subclassed and not instantiated)
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	public class ShapeCreator{
		public function draw(shapeType:uint, target:DisplayObjectContainer, shapesX:int, shapesY:int, shapesZ:int):void{
			var shape = this.createShape(shapeType);
			shape.createShape();
			shape.setXYZShapeLocation(shapesX, shapesY, shapesZ);
			target.addChild(shape);
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// ABSTRACT Method error (the method should only be implemented in a subclass);
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		protected function createShape(shapeType:uint):AbastractShapeCreator{
			throw new IllegalOperationError('Abstract method: must be overridden in a subclass');
			return null;
		}
	}
}