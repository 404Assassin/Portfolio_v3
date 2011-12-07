package com.cw.utilities.loaders{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * externalCSS Class with both embeded fonts, html formatting and 
	 * external css.
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: Christian Worley
	 * created: 09/2011
	 * TODO; external font sorage in .swf files for localization,
	 * working version useing greensock CSSloader
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.patterns.observer.IInvokedObserver;
	import com.cw.patterns.observer.InvokedObserver;
	import com.cw.utilities.loaders.swfExplorer.SWFExplorer;
	import com.cw.utilities.loaders.swfExplorer.events.SWFExplorerEvent;
	import flash.display.Loader;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.text.Font;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class FontSWFLoader implements IInvokedObserver{
		public static var NAME_CHANGED:String="nameChanged";
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var _name:String;
		private var fonts:Array
		private var fontSWFURL:String;
		private var fontSWFLoader:Loader = new Loader();
		private var explorer:SWFExplorer = new SWFExplorer();
		private var fontLoadObserver:InvokedObserver;
		/**
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 * 1. create a .fla doc and in the library create a new libaray font 
		 * class.
		 * 2. select the font you wish to use, embbed the charecters you wish 
		 * to use.
		 * 3. select the ActionScript tab and export for ActionScript. Make sure 
		 * your class name does not match the font name as listed in the font
		 * info window.
		 * 4. compile your .swf and target it's location below.
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function FontSWFLoader(){
		}
		/**
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 * 1. pass the interface the font swf URL.
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		public function fontSWFLoaderInterface(fontSWFURL:String):void{
			this.fontSWFURL = fontSWFURL;
			swfXplorerLoad()
		}
		public function observableInstanceRef(fontLoadObserver:InvokedObserver):void{
			this.fontLoadObserver = fontLoadObserver;
			fontLoadObserver.addObserver(this)
		}
		/**
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 * 1. enter the class name of your fonts as the string value below to 
		 * add your loaded swf font class to your application.
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		private function swfXplorerLoad(){
			explorer.load ( new URLRequest ( fontSWFURL));
			explorer.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loadProgress);
			explorer.addEventListener ( SWFExplorerEvent.COMPLETE, assetsReady, false );
		}
		private function loadProgress(event:ProgressEvent):void {
			var percentLoaded:Number = event.bytesLoaded/event.bytesTotal;
			percentLoaded = Math.round(percentLoaded * 100);
		}
		private function assetsReady (explorerEvent:SWFExplorerEvent):void{
			var domain:ApplicationDomain = explorer.contentLoaderInfo.applicationDomain;
			var fontClass:Class;
			for (var i:int = 0; i < explorerEvent.target.getTotalDefinitions(); i++){
				fontClass = domain.getDefinition(explorerEvent.definitions[i]) as Class;
				Font.registerFont(fontClass);
			}
			fontLoadObserver.notifyObservers('fonts are loaded');
			fontCheck();
		}
		/**
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 * 1. lists loaded fonts in the output window.
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		private function fontCheck(){
			fonts = Font.enumerateFonts();
			for (var i:int = 0; i < fonts.length; i++){
				trace('fonts loaded:\n' + fonts[i].fontName + " - " + fonts[i].fontStyle + " - " + fonts[i].fontType);
			}
		}
		public function update(theObserver:InvokedObserver, infoObject:Object):void {
			//trace('@ FontSWFLoader' + InvokedObserver + ' ' + infoObject);
		}
	}
}