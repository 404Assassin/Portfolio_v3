package com.cw.data.bitmaps{
	import flash.display.MovieClip;
	public interface IBitmapLoader{
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// params for LoadBitmap are, by both name and type the bitmap's; imageSourceRefrence:String, the placementTarget MC path, and the init placementX:Number, placementY:Number
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		function LoadBitmap(imageSourceRefrence:String, placementTarget:MovieClip, placementX:Number, placementY:Number);
	}
}