package com.cw.visuals.text{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Class discription: public class DynamicTextField
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: christian
	 * contact: christian@worleydev.com
	 * created: Nov 25, 2011
	 * TODO;  
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.patterns.observer.IInvokedObserver;
	import com.cw.patterns.observer.InvokedObserver;
	import com.cw.visuals.tweenStates.ButtonStates;
	import com.cw.visuals.shapeCreators.CreateShape;
	import com.greensock.TweenMax;
	import com.greensock.loading.*;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.EventPhase;
	import flash.filters.DropShadowFilter;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.AntiAliasType;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class CDynamicTextField{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var theTextFieldHolder:Sprite;
		private var theTextFieldBGHolder:Sprite;
		private var textHorizontalBuffer:uint = 20;
		private var textVerticalBuffer:uint = 20;
		private var textHorizontalOffset:Number = 4;
		private var textVerticalOffset:Number = 2;
		private var textContent:String
		private var textFieldHeight:uint
		private var textFieldWidth:uint
		private var xPlacement:int;
		private var yPlacement:int;
		private var dynamicButtonObserver:InvokedObserver
		private var eventTarget:Object;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function CDynamicTextField(){};
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		/**
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 * Dynamic text field interfaces for composition 
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		public function textFieldInterface(textContent:String, textFieldWidth:uint, textFieldHeight:uint):void{
			this.textContent = textContent;
			this.textFieldWidth = textFieldWidth
			this.textFieldHeight = textFieldHeight
			this.textHorizontalOffset = textHorizontalOffset;
			this.textVerticalOffset = textVerticalOffset;
			textFieldHolder()
		}
		public function getTheTextField():Sprite{
			return theTextFieldHolder
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function textFieldHolder():void {
			theTextFieldHolder = new Sprite();
			textFieldBGHolder();
		}
		private function textFieldBGHolder():void {
			theTextFieldBGHolder = new Sprite();
			var theShapeCreator:CreateShape = new CreateShape();
			theShapeCreator.draw(CreateShape.SQUARE_FILLED, theTextFieldBGHolder, 0, 0, 100, 100)
			TweenMax.to (theTextFieldBGHolder, 0, {alpha:.5, tint:0xFFFFFF});
			//theTextFieldBGHolder.filters = [new DropShadowFilter(2, 45, 0x000000, 1, 2, 2, 1, 2, true, true, false)];
			theTextFieldHolder.addChild(theTextFieldBGHolder);
			addTextFieldText();
		}
		private function addTextFieldText():void{
			var textField:TextField = new TextField();
			textField.embedFonts = false;
			textField.background = true;
			textField.backgroundColor = 0xFFFFFF;
			textField.width = textFieldWidth - textHorizontalBuffer;
			textField.height = textFieldHeight - textVerticalBuffer;
			textField.multiline = true;
			textField.wordWrap = true;
			textField.autoSize = TextFieldAutoSize.NONE;
			textField.antiAliasType = AntiAliasType.ADVANCED; 
			textField.styleSheet = LoaderMax.getContent("flashStyleSheet");;
			textField.htmlText = textContent;
			theTextFieldHolder.addChild(textField);
			TweenMax.to(textField, 0, {dropShadowFilter:{color:0x000000, alpha:.5, blurX:5, blurY:5, distance:5}});
			resizeTextFieldBG(textField);
		}
		private function resizeTextFieldBG(textField:TextField):void{
			theTextFieldBGHolder.width = textFieldWidth;
			theTextFieldBGHolder.height = textFieldHeight;
			theTextFieldBGHolder.x = 0;
			theTextFieldBGHolder.y = 0;
			centerTextWithBackground(textField)
		}
		private function centerTextWithBackground(textField:TextField):void{
			var totalTextWidth:int = textField.width;
			textField.x = (textFieldWidth-totalTextWidth) * .5;
			var totalTextHeight:int = textField.height;
			textField.y = (textFieldHeight - totalTextHeight)*.5;
		}
	}
}

