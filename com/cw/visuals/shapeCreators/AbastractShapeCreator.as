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
	import flash.display.Sprite;
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// ABSTRACT Class (should be subclassed and not instantiated)
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	internal class AbastractShapeCreator extends Sprite{
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// ABSTRACT Method (should be implemented in subclassed)
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		internal function createShape():void {}
		internal function setXYZShapeLocation(shapesX:int, shapesY:int, shapesZ:int):void{
			this.x = shapesX;
			this.y = shapesY;
			this.z = shapesZ;
		}
	}
}