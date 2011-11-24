package com.cw.controls.prompt{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Class discription: Error Pop-Up
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: christian
	 * created: Oct 12, 2011
	 * TODO;  
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.patterns.observer.IInvokedObserver;
	import com.cw.patterns.observer.InvokedObserver;
	import com.cw.visuals.animations.SimpleLine;
	import com.cw.visuals.animations.CSimpleLine;
	import com.cw.visuals.shapeCreators.CreateShape;
	import com.cw.visuals.tweenStates.ButtonStates;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	import com.greensock.loading.LoaderMax;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.geom.Point;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class ErrorPopUp implements IErrorPopUp, IInvokedObserver{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Protected Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		protected var buttonStates:ButtonStates = new ButtonStates();
		protected var placementTarget:MovieClip;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		//private var contentArray:Array = new Array();
		private var contentHolder:Sprite = new Sprite();
		private var textFieldHolder:Sprite = new Sprite();
		private var contentsBackground:Sprite = new Sprite();
		private var contentsForeground:Sprite = new Sprite();
		private var errorState:Boolean;
		private var textHorizontalBuffer:uint = 26;
		private var textVerticalBuffer:uint = 6;
		private var textHorizontalOffset:Number = 4;
		private var textVerticalOffset:Number = 2;
		private var totalButtonWidth:int;
		private var totalButtonHeight:int
		private var textContent:String
		private var xPlacement:int;
		private var yPlacement:int;
		private var dynamicButtonObserver:InvokedObserver
		private var targetX:int;
		private var targetY:int;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function ErrorPopUp(){
			initErrorState();
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		/**
		 * Method interface for InvokedObserver instance reference.
		 */		
		public function observableInstanceRef(dynamicButtonObserver:InvokedObserver):void{
			this.dynamicButtonObserver = dynamicButtonObserver;
			dynamicButtonObserver.addObserver(this)
		}
		/**
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 * Dynamic ErrorPopUp Interface - by both name and type; 
		 * placementTarget:MovieClip, xPlacement:int, yPlacement:int, 
		 * textContent:String
		 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		public function errorPopUpInterface(placementTarget:MovieClip, xPlacement:int, yPlacement:int, textContent:String):void{
			this.placementTarget = placementTarget;
			this.textContent = textContent;
			this.xPlacement = xPlacement;
			this.yPlacement = yPlacement;
			createContentHolder();
		}
		public function lineInterface(targetX:int , targetY:int):void{
			this.targetX = targetX;
			this.targetY = targetY;
			animateLine();
		}
		public function getErrorPopUp():Sprite{
			return contentHolder;
		}
		public function getErrorPopUpHeight():Number{
			return contentHolder.height;
		}
		public function update(theObserver:InvokedObserver, infoObject:Object):void{
			//trace('<<<<<<<<<<<<<<<>>>>>>>>>>>>>>> @ ErrorPopUp ' + theObserver + ' ' + infoObject);
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function initErrorState():void{
			errorState = false;
		}
		private function createContentHolder():void{
			placementTarget.addChild (contentHolder);
			createContentBackground();
			createTextFieldHolder();
			createTarget();
		}
		private function createContentBackground():void{
			var theShapeCreator:CreateShape = new CreateShape();
			theShapeCreator.draw(CreateShape.SQUARE_ROUNDED_FILLED, contentsBackground, 0, 0, 124, 24)
			TweenMax.to (contentsBackground, .75, {alpha:.98, tint:0x5D0000, ease:Sine.easeOut});
			contentHolder.addChild (contentsBackground);
		}
		private function createTextFieldHolder():void{
			contentHolder.addChild (textFieldHolder);
			addButtonText();
		}
		private function addButtonText():void{
			var textField:TextField = new TextField();
			textField.embedFonts = false;
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.antiAliasType = AntiAliasType.ADVANCED; 
			textField.styleSheet = LoaderMax.getContent("flashStyleSheet");
			textField.htmlText = textContent;
			textFieldHolder.addChild(textField);
			//textFieldHolder.filters = [new DropShadowFilter(2, 45, 0xCCCCCC, 1, 2, 2, 1, 2, true, true, false)];
			resizeBackground(textField);
			centerText(textField)
		}
		private function createTarget():void{
			var theShapeCreator:CreateShape = new CreateShape();
			theShapeCreator.draw(CreateShape.SQUARE_ROUNDED_FILLED, contentsForeground, 0, 0, 24, 24)
			contentsForeground.alpha = 0;
			contentHolder.addChild(contentsForeground);
			resizeTarget();
		}
		private function resizeBackground(textField:TextField):void{
			contentsBackground.height = textField.textHeight + textVerticalBuffer;
			contentsBackground.width = textField.textWidth + textHorizontalBuffer;
		}
		private function centerText(textField:TextField):void{
			totalButtonWidth = textField.textWidth + textHorizontalBuffer;
			totalButtonHeight = textField.textHeight + textVerticalBuffer;
			var totalTextWidth:int = textField.textWidth;
			textField.x =- (totalTextWidth+textHorizontalOffset) * .5;
			var totalTextHeight:int = textField.textHeight;
			textField.y = ((totalTextHeight - textField.textHeight) + textVerticalOffset) *.5;
		}
		private function resizeTarget():void{
			contentsForeground.height = totalButtonHeight;
			contentsForeground.width = totalButtonWidth;
			centerContentAssets();
		}
		private function centerContentAssets():void{
			contentsBackground.x =- totalButtonWidth * .5;
			contentsForeground.x =- totalButtonWidth * .5;
			addTheButtonEvents();
		}
		private function addTheButtonEvents():void {
			contentsForeground.addEventListener (MouseEvent.MOUSE_UP, placementTargetUp);
			contentsForeground.addEventListener (MouseEvent.MOUSE_DOWN, placementTargetDown);
			contentsForeground.addEventListener (MouseEvent.MOUSE_OUT, placementTargetOut);
			contentsForeground.addEventListener (MouseEvent.MOUSE_OVER, placementTargetOver);
			theErrorState();
		}
		private function theErrorState():void{
			if (!errorState){
				addToDisplay();
			}
		}
		public function placementTargetOver(overEvent:Event){
			buttonStates.buttonStatesInterface(contentsBackground, 'OverState');
			buttonStates.buttonStatesInterface(textFieldHolder, 'OverState');
		}
		public function placementTargetOut(outEvent:Event){
			buttonStates.buttonStatesInterface(contentsBackground, 'OutState');
			buttonStates.buttonStatesInterface(textFieldHolder, 'OutState');
		}
		public function placementTargetDown(downEvent:Event){
			buttonStates.buttonStatesInterface(contentsBackground, 'DownState');
			buttonStates.buttonStatesInterface(textFieldHolder, 'DownState');
		}
		public function placementTargetUp(upEvent:Event){
			buttonStates.buttonStatesInterface(contentsBackground, 'UpState');
			buttonStates.buttonStatesInterface(textFieldHolder, 'UpState');
			notifyTheObservers();
			removeFromDisplay();
		}
		private function notifyTheObservers():void{
			var errorState = 'ErrorPopUpParm'
			//dynamicButtonObserver.notifyObservers(contactState);
		}
		private function addToDisplay():void{
			contentHolder.x = xPlacement;
			contentHolder.y = yPlacement;
			placementTarget.addChild(contentHolder);
			TweenMax.to (contentHolder, .25, {alpha:1, ease:Sine.easeOut});
			errorState = true;
		}
		private function animateLine():void{
			var theSimpleLine:SimpleLine = new SimpleLine();
			theSimpleLine.simpleLineInterface(contentHolder, -(totalButtonWidth*.5), (totalButtonHeight*.5), targetX, targetY)
		}
		private function removeFromDisplay():void{
			if (placementTarget.contains(contentHolder)){
				trace("@ ErrorPopUp.removeFromDisplay() ");
				placementTarget.removeChild(contentHolder);
				TweenMax.to (contentHolder, .75, {alpha:0, ease:Sine.easeOut});
				errorState = false;
			}
		}
	}
}

