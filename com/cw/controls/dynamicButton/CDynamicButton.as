package com.cw.controls.dynamicButton{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Class discription: public class CDynamicButton for composition
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: christian
	 * contact: christian@worleydev.com
	 * created: Nov 6, 2011
	 * TODO;  
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.patterns.observer.IInvokedObserver;
	import com.cw.patterns.observer.InvokedObserver;
	import com.cw.visuals.tweenStates.ButtonStates;
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
	public class CDynamicButton{
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
		private var dynamicButtonObserver:InvokedObserver
		private var eventTarget:Object;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function CDynamicButton(){};
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		/**
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 * Dynamic button interfaces for composition 
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		public function buttonInterface(textContent:String):void{
			this.placementTarget = placementTarget;
			this.textContent = textContent;
			this.xPlacement = xPlacement;
			this.yPlacement = yPlacement;
			this.eventTarget = eventTarget;
			addButtonText()
		}
		public function getTheButton():Sprite{
			return button
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function addButtonText():void{
			var textField:TextField = new TextField();
			textField.embedFonts = false;
			textField.autoSize = TextFieldAutoSize.CENTER;
			textField.antiAliasType = AntiAliasType.ADVANCED; 
			textField.styleSheet = LoaderMax.getContent("flashStyleSheet");;
			textField.htmlText = textContent;
			button.buttonText.addChild(textField);
			button.buttonText.filters = [new DropShadowFilter(2, 45, 0x000000, 1, 2, 2, 1, 2, true, true, false)];
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
		}
		public function placementTargetOver(overEvent:Event){
			buttonStates.buttonStatesInterface(button.buttonBG, 'OverState');
			buttonStates.buttonStatesInterface(button.buttonText, 'OverState');
		}
		public function placementTargetOut(outEvent:Event){
			buttonStates.buttonStatesInterface(button.buttonBG, 'OutState');
			buttonStates.buttonStatesInterface(button.buttonText, 'OutState');
		}
		public function placementTargetDown(downEvent:Event){
			buttonStates.buttonStatesInterface(button.buttonBG, 'DownState');
			buttonStates.buttonStatesInterface(button.buttonText, 'DownState');
		}
		public function placementTargetUp(upEvent:Event){
			if(upEvent.eventPhase == EventPhase.AT_TARGET){
				buttonStates.buttonStatesInterface(button.buttonBG, 'UpState');
				buttonStates.buttonStatesInterface(button.buttonText, 'UpState');
			}
		}
	}
}

