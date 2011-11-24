package com.cw.utilities.loaders{
	/**
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * CSSLoad Class
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: Christian Worley
	 * created: 09/2011
	 * TODO:
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import com.greensock.loading.*;
	
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class CSSLoad{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var cssDocLocation:String;
		private var textFieldTarget:TextField;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function CSSLoad(){
		}
		/**
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::n/
		 * cssLoadInterface where cssDocLocation is the css docs URL & 
		 * textFieldTarget is the text field being targeted for the css styling.
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		public function cssLoadInterface(cssDocLocation:String, textFieldTarget:TextField):void{
			this.cssDocLocation = cssDocLocation;
			this.textFieldTarget = textFieldTarget;
			loadCSS();
		}
		private function loadCSS():void{
			//trace('@@@@ loadCSS');
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onLoadCSS);
			var cssDoc:URLRequest = new URLRequest(cssDocLocation);
			loader.load(cssDoc);
		}
		private function onLoadCSS(event:Event):void{
			//trace('@@@@ onLoadCSS/textFieldTarget is ' + textFieldTarget);
			var css:StyleSheet = new StyleSheet();
			css.parseCSS(URLLoader(event.target).data);
			textFieldTarget.styleSheet = css;
		}
	}
}