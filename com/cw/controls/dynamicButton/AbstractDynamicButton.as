package com.cw.controls.dynamicButton{
	/**
	 -=] DynamicButton interface through IDynamicButton. 'this' is an		[=-
	 -=] ABSTRACT Class and should be subclassed and not invoked directly.	[=-
	 -=] language version:						ActionScript 3.0			[=-
	 -=] player version:						Flash 10.0					[=-
	 -=] author:								Christian Worley 			[=-
	 -=] created:								08/2011						[=-
	 -=] TODO; add more shape classes 										[=-
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.utilities.loaders.CSSLoad;
	import com.cw.visuals.filters.DropShadowFilterExample;
	import com.cw.visuals.tweenStates.ButtonStates;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.*;
	
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilter;
	import flash.filters.DropShadowFilter;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// ABSTRACT Class (should be subclassed and not instantiated)
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class AbstractDynamicButton extends Sprite implements IAbstractDynamicButton{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Protected Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		protected var button:buttonDynamic = new buttonDynamic();
		protected var buttonStates:ButtonStates = new ButtonStates();
		protected var placementTarget:MovieClip;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var textHorizontalBuffer:uint = 16;
		private var textVerticalBuffer:uint = 4;
		private var textHorizontalOffset:Number = 4;
		private var textVerticalOffset:Number = 2;
		private var textContent:String
		private var xPlacement:int;
		private var yPlacement:int;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function AbstractDynamicButton(){
		}
		/**
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 * DynamicButton - by both name and type; placementTarget:MovieClip, 
		 * xPlacement:int, yPlacement:int, textContent:String
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		public function buttonInterface(placementTarget:MovieClip, xPlacement:int, yPlacement:int, textContent:String):void{
			this.placementTarget = placementTarget;
			this.textContent = textContent;
			this.xPlacement = xPlacement;
			this.yPlacement = yPlacement;
			addButtonText()
		}
		private function loadCSS():void{
			var cssDocLocation:String = "./css/flashSiteStyles.css";
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onLoadCSS);
			var cssDoc:URLRequest = new URLRequest(cssDocLocation);
			loader.load(cssDoc);
		}
		private function onLoadCSS(event:Event):void{
			var css:StyleSheet = new StyleSheet();
			css.parseCSS(URLLoader(event.target).data);
		}
		private function addButtonText(/*css:StyleSheet*/):void{
			
			var textField:TextField = new TextField();
			textField.embedFonts = false;
			textField.autoSize = TextFieldAutoSize.CENTER;
			textField.antiAliasType = AntiAliasType.ADVANCED; 
			textField.styleSheet = LoaderMax.getContent("flashStyleSheet");;
			textField.htmlText = textContent;
			
			button.buttonText.addChild(textField);
			
			var dropShadow:DropShadowFilter = new DropShadowFilter();dropShadow.distance = 0;
			dropShadow.angle = 45;
			dropShadow.color = 0x000000;
			dropShadow.alpha = .5;
			dropShadow.blurX = 2;
			dropShadow.blurY = 2;
			dropShadow.strength = 100;
			dropShadow.quality = 50;
			dropShadow.inner = true;
			dropShadow.knockout = true;
			dropShadow.hideObject = false; 
			//button./*buttonText.*/filters = new Array(dropShadow); 
			button.buttonText.filters = [new DropShadowFilter(5, 45, 0x000000, 1, 5, 5, 1, 2, true, true, false)]; 

			resizeButtonMCs(textField);
		}
		private function resizeButtonMCs(textField:TextField):void{
			button.buttonBG.height = textField.textHeight + textVerticalBuffer;
			button.buttonTarget.height = textField.textHeight + textVerticalBuffer;
			button.buttonBG.width = textField.textWidth + textHorizontalBuffer;
			button.buttonTarget.width = textField.textWidth + textHorizontalBuffer;
			centerTextWithBackground(textField)
		}
		private function centerTextWithBackground(textField:TextField):void{
			var totalButtonWidth:int = textField.textWidth + textHorizontalBuffer;
			var totalTextWidth:int = textField.textWidth;
			//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			// Use the below line for LEFT-justified text fields
			//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			//textField.x = (totalButtonWidth - (totalTextWidth+textHorizontalOffset))*.5;
			textField.x =- (totalTextWidth+textHorizontalOffset) * .5;
			var totalButtonHeight:int = textField.textHeight;
			var totalTextHeight:int = textField.textHeight;
			textField.y =- ((totalTextHeight+textVerticalOffset) - (totalTextHeight + textVerticalBuffer))*.5;
			addTheButtonEvents();
		}
		private function addTheButtonEvents():void {
			button.buttonTarget.buttonMode = true;
			button.buttonTarget.addEventListener (MouseEvent.MOUSE_UP, placementTargetUp);
			button.buttonTarget.addEventListener (MouseEvent.MOUSE_DOWN, placementTargetDown);
			button.buttonTarget.addEventListener (MouseEvent.MOUSE_OUT, placementTargetOut);
			button.buttonTarget.addEventListener (MouseEvent.MOUSE_OVER, placementTargetOver);
			addToDisplay();
		}
		/**
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 *  ABSTRACT Method
		 *  (the method should only be implemented in a subclass).
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		protected function placementTargetOver(overEvent:Event){
			throw new IllegalOperationError('Abstract method: must be overridden in a subclass');
			return null;
		}
		/**
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 *  ABSTRACT Method
		 *  (the method should only be implemented in a subclass).
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		protected function placementTargetOut(outEvent:Event){
			throw new IllegalOperationError('Abstract method: must be overridden in a subclass');
			return null;
		}
		/**
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 *  ABSTRACT Method
		 *  (the method should only be implemented in a subclass).
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		protected function placementTargetDown(downEvent:Event){
			throw new IllegalOperationError('Abstract method: must be overridden in a subclass');
			return null;
		}
		/**
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 *  ABSTRACT Method
		 *  (the method should only be implemented in a subclass).
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		protected function placementTargetUp(upEvent:Event){
			throw new IllegalOperationError('Abstract method: must be overridden in a subclass');
			return null;
		}
		protected function addToDisplay():void{
			placementTarget.addChild(button);
			button.x = xPlacement;
			button.y = yPlacement;
		}
	}
}