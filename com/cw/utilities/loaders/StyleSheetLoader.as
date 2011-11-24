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
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class StyleSheetLoader{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var styleSheetURL:String
		private var textFieldTarget:TextField;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function StyleSheetLoader(){
		}
		public function styleSheetLoaderInterface(styleSheetURL:String):void{
			this.styleSheetURL = styleSheetURL;
/*			var fonts:Array = Font.enumerateFonts();
			for (var i:int = 0; i < fonts.length; i++){
				//trace(fonts[i].fontName + " - " + fonts[i].fontStyle + " - " + fonts[i].fontType);
			}*/
			loadCSS()
		}
		private function loadCSS():void{
			//trace('@@@@ loadCSS');
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onLoadCSS);
			var cssDoc:URLRequest = new URLRequest(styleSheetURL);
			loader.load(cssDoc);
		}
		private function onLoadCSS(event:Event):void{
			var css:StyleSheet = new StyleSheet();
			css.parseCSS(URLLoader(event.target).data);
			//externalCSSMethod(css);
		}
		private function externalCSSMethod(styles:StyleSheet):void{
			var myTextField:TextField = new TextField();
			myTextField.autoSize = TextFieldAutoSize.LEFT;
			myTextField.styleSheet = styles;
			myTextField.embedFonts = true;
			myTextField.htmlText = "<p>!  The quick <em><brown>brown</brown> fox </p>jumped over the lazy dog. </em>!";
			myTextField.x = 10;
			myTextField.y = 250;
			//addChild(myTextField);
		}
	}
}