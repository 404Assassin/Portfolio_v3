package com.cw.visuals.color{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.BitmapData;
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	public class AverageBitmapColor{
/*		public function AverageBitmapColor(){
		}*/
		public static function averageColor(sourceBitmap:BitmapData){
			var red:Number = 0;
			var green:Number = 0;
			var blue:Number = 0;
			var count:Number = 0;
			var pixel:Number;
			for (var x:int = 0; x < sourceBitmap.width; x++){
				for (var y:int = 0; y < sourceBitmap.height; y++){
/*			for (var x:int = 0; x < sourceBitmap.width; x++){
				for (var y:int = 0; y < sourceBitmap.height; y++){*/
					pixel = sourceBitmap.getPixel(x, y);
					red += pixel >> 16 & 0xFF;
					green += pixel >> 8 & 0xFF;
					blue += pixel & 0xFF;
					count++
				}
			}
			red /= count;
			green /= count;
			blue /= count;
			return red << 16 | green << 8 | blue;
		}
	}
}