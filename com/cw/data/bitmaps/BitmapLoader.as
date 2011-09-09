package com.cw.data.bitmaps{
	/*
	-=] bitmap loader and load events handler [=-
	-=] language version ActionScript 3.0 [=-
	-=] player version Flash 10.0 [=-
	-=] author Christian Worley [=-
	-=] created 08/2011 [=-
	-=] TODO; error alerts and handling [=-
	*/
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;
	import flash.text.*;
	
	public class BitmapLoader extends Sprite implements IBitmapLoader{
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private var imageSourceRefrence:String;
		private var placementTarget:MovieClip;
		private var placementX:Number;
		private var placementY:Number;
		private var preloaderState:TextField;
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		public function BitmapLoader():void{
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// params for LoadBitmap are, by both name and type the bitmap's; imageSourceRefrence:String, the placementTarget MC path, and the init placementX:Number, placementY:Number
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		public function LoadBitmap(imageSourceRefrence:String, placementTarget:MovieClip, placementX:Number, placementY:Number){
			var loader:Loader = new Loader();
			addEventListeners(loader.contentLoaderInfo);
			trace('::::::what is imageSourceRefrence '+ imageSourceRefrence);
			trace('::::::what is placementTarget '+ placementTarget);
			trace('::::::what is placementX '+ placementX);
			trace('::::::what is placementY '+ placementY);
			placementTarget.addChild(loader);
			//:::::::::::::::::::::::::::::::::::::::::::::::::
			// load the external bitmap
			//:::::::::::::::::::::::::::::::::::::::::::::::::
			loader.load(new URLRequest(imageSourceRefrence));
		}
			//:::::::::::::::::::::::::::::::::::::::::::::::::
			// loader progress and error events handling
			//:::::::::::::::::::::::::::::::::::::::::::::::::
		private function addEventListeners(dispatcher:IEventDispatcher):void {
			dispatcher.addEventListener(Event.OPEN, handleOpenEvent);
			dispatcher.addEventListener(ProgressEvent.PROGRESS, handleProgressEvent);
			dispatcher.addEventListener(Event.INIT, initHandler);
			dispatcher.addEventListener(Event.COMPLETE, handleCompleteEvent);
			dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, handleIOError);
			dispatcher..addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, handleUncaughtError);
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// create preloader
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private function handleOpenEvent(event:Event):void{
			trace('opening');
			preloaderState = new TextField();
			addChild(preloaderState);
			preloaderState.text = 'loading: 0%';
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// preloader progress
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private  function handleProgressEvent(event:ProgressEvent):void{
			var percentageLoaded:Number = event.bytesLoaded / event.bytesTotal * 100;
			trace('progress, what is the percentage loaded = ' + percentageLoaded);
			preloaderState.text = 'loading: ' + percentageLoaded + '%';
		}
		private function initHandler(event:Event):void {
			trace("initHandler - bitmaps can now accessed");
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// garbage collection on preloader assets
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private function handleCompleteEvent(event:Event):void{
			trace('bitmap load complete!');
			removeChild(preloaderState);
			preloaderState = null;
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// garbage collection on preloader assets
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private function handleIOError(event:IOErrorEvent):void{
			trace('::::IO Error Event '+ event);
		}
		private function httpStatusHandler(event:HTTPStatusEvent):void {
			trace("httpStatusHandler: " + event);
		}
		private function handleUncaughtError(event:UncaughtErrorEvent):void{
			if (event.error is Error){
				var error:Error = event.error as Error;
				// do something with the error
			}
			else if (event.error is ErrorEvent){
				var errorEvent:ErrorEvent = event.error as ErrorEvent;
				// do something with the error
			}
			else{
				// a non-Error, non-ErrorEvent type was thrown and uncaught
			}
		}
	}
}
