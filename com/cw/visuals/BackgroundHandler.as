package com.cw.visuals{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * ContentArea Class
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: Christian Worley
	 * created: 01/2011
	 * TODO:
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.data.bitmaps.BitmapLoader;
	import com.cw.math.RatioConversion;
	import com.cw.patterns.observer.IInvokedObserver;
	import com.cw.patterns.observer.InvokedObserver;
	import com.cw.utilities.preloaders.FourBarPreloader;
	import com.cw.visuals.color.ApplyColorChange;
	import com.cw.visuals.color.AverageBitmapColor;
	import com.cw.visuals.filters.DropShadowFilterExample;
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.*;
	import com.greensock.loading.display.*;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class BackgroundHandler implements IInvokedObserver{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var BG_mc:theBG = new theBG();
		private var loaderBG:Loader = new Loader();
		private var stageReference:Stage;
		private var stageWidth:int;
		private var stageHeight:int;
		private var backgroundObserver:InvokedObserver;
		private var backgroundColorState:uint
		private var TheProgressBar:progressBar = new progressBar();
		private var TheProgressBars:progressBars = new progressBars();
		private var theFourBarPreloader:FourBarPreloader = new FourBarPreloader();
		///////////////////
		private var centerX:Number;
		private var centerY:Number;
		private var speed:Number = 0.05;
		private var radius:Number = 75;
		private var angle:Number = 0;
		private var xpos:Number;
		private var ypos:Number;
		private var theCircle:Shape = new Shape();  
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function BackgroundHandler(){
			var theDropShadowFilterExample:DropShadowFilterExample = new DropShadowFilterExample();
		}
		public function BackgroundHandlerInterface(stageReference:Stage):void {
			this.stageReference = stageReference;
			this.stageWidth = stageReference.stageWidth;
			this.stageHeight = stageReference.stageHeight;
			//addBG_mc();
			loadBackground();
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// InvokedObserver interface, reference update, and subscription
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function observableInstanceRef(backgroundObserver:InvokedObserver):void{
			this.backgroundObserver = backgroundObserver;
			backgroundObserver.addObserver(this)
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// InvokedObserver notification
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function notifyTheObservers(theAverageColor:uint):void{
			backgroundColorState = theAverageColor;
			backgroundObserver.notifyObservers(backgroundColorState);
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// InvokedObserver update
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function update(o:InvokedObserver, infoObj:Object):void{
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// loadBackground
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function loadBackground():void{
			TweenMax.to (BG_mc.BGsBG, 0, {tint:0xFFFFFF});
			stageReference.addChild (BG_mc);
			TweenMax.to (BG_mc.BGsBG, 3, {delay:1, tint:0x000000});
			theFourBarPreloader.preloaderInterface(stageReference, BG_mc);
			var randomNumber:uint = Math.round(Math.random() * (8 - 0) + 0);
			var imagesReference:String ='./images/BG_IMG_'+randomNumber+'.png';
			var loader:ImageLoader = new ImageLoader(imagesReference, {name:"bacgroundImage", estimatedBytes:200000, container:BG_mc, alpha:0, scaleMode:"none"});
			var queue:LoaderMax = new LoaderMax({name:"backgroundQueue", onProgress:progressHandler, onComplete:loaderBGLoaded, onCompleteParams:[loader] /*onError:errorHandler*/});
			queue.append( loader );
			queue.load();
		}
		private function progressHandler(loaderEvent:LoaderEvent):void {
			theFourBarPreloader.progressHandlerInterface(loaderEvent);
		}
		private function loaderBGLoaded(BGloadedEvent:Event):void{
			var params:Array = BGloadedEvent.target.vars.onCompleteParams;
			var bitmap:BitmapData = params[0].rawContent.bitmapData;
			getAverageBGColor(bitmap);
			trace("completed " + BGloadedEvent.target + " and the parameters are: " + params[0] + " and " + params[1]);
			var image:Sprite = LoaderMax.getContent("bacgroundImage");
			TweenMax.to (image, 5, {delay:1.5, alpha:1, rotationY:0, ease:Linear.easeOut});
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// target a bitmap and get it's average hex color
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function getAverageBGColor(theBitmap:BitmapData){
			var theAverageColor:uint = AverageBitmapColor.averageColor( theBitmap );
			trace('what is the average color? '+theAverageColor);
			notifyTheObservers(theAverageColor);
		}
	}
}