package com.cw.controls.dynamicButton{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.MovieClip;
	import flash.text.TextFieldAutoSize;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.cw.visuals.tweenStates.ButtonStates;
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	public class DynamicButton implements IDynamicButton{
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Protected Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		protected var button:buttonDynamic = new buttonDynamic();
		protected var buttonStates:ButtonStates = new ButtonStates();
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private var textHorizontalBuffer:uint = 20;
		private var textHorizontalOffset:Number = 4;
		private var textVerticalOffset:Number = 2.5;
		private var placementTarget:MovieClip;
		private var textContent:String
		private var xPlacement:int;
		private var yPlacement:int;
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		public function DynamicButton(){
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// DynamicButton, by both name and type; placementTarget:MovieClip, xPlacement:int, yPlacement:int, textContent:String
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		public function buttonInterface(placementTarget:MovieClip, xPlacement:int, yPlacement:int, textContent:String):void{
			this.placementTarget = placementTarget;
			this.textContent = textContent;
			this.xPlacement = xPlacement;
			this.yPlacement = yPlacement;
			trace('>>>>>>>>>>>what is the textContent '+ textContent);
			addButtonText();
		}
		private function addButtonText():void{
			button.buttonText.field.autoSize = TextFieldAutoSize.LEFT;
			button.buttonText.field.htmlText = textContent;
			resizeButtonMCs();
		}
		private function resizeButtonMCs():void{
			trace('>>>>>>>>>>>what is the field.textHeight '+ button.buttonText.field.textHeight);
			trace('>>>>>>>>>>>what is the field.textWidth '+ button.buttonText.field.textWidth);
			button.buttonBG.width = button.buttonText.field.textWidth + textHorizontalBuffer;
			button.buttonTarget.width = button.buttonText.field.textWidth + textHorizontalBuffer;
			centerTextWithBackground()
		}
		private function centerTextWithBackground():void{
			var totalButtonWidth:int = button.buttonText.field.textWidth + textHorizontalBuffer;
			var totalTextWidth:int = button.buttonText.field.textWidth;
			button.buttonText.field.x = (totalButtonWidth - (totalTextWidth+textHorizontalOffset))*.5;
			var totalButtonHeight:int = button.buttonText.field.textHeight;
			var totalTextHeight:int = button.buttonText.field.textHeight;
			button.buttonText.field.y = (totalButtonHeight - (totalTextHeight+textVerticalOffset))*.5;
			addTheButtonEvents();
		}
		private function addTheButtonEvents():void {
			button.buttonTarget.addEventListener (MouseEvent.MOUSE_UP, placementTargetUp);
			button.buttonTarget.addEventListener (MouseEvent.MOUSE_DOWN, placementTargetDown);
			button.buttonTarget.addEventListener (MouseEvent.MOUSE_OUT, placementTargetOut);
			button.buttonTarget.addEventListener (MouseEvent.MOUSE_OVER, placementTargetOver);
			addToDisplay();
		}
		protected function placementTargetOver(overEvent:Event){
/*			buttonStates.buttonStatesInterface(button.buttonBG, 'OverState');
			buttonStates.buttonStatesInterface(button.buttonText, 'OverState');*/
		}
		protected function placementTargetOut(outEvent:Event){
/*			buttonStates.buttonStatesInterface(button.buttonBG, 'OutState');
			buttonStates.buttonStatesInterface(button.buttonText, 'OutState');*/
		}
		protected function placementTargetDown(downEvent:Event){
/*			buttonStates.buttonStatesInterface(button.buttonBG, 'DownState');
			buttonStates.buttonStatesInterface(button.buttonText, 'DownState');*/
		}
		protected function placementTargetUp(upEvent:Event){
/*			buttonStates.buttonStatesInterface(button.buttonBG, 'UpState');
			buttonStates.buttonStatesInterface(button.buttonText, 'UpState');*/
		}
		private function addToDisplay():void{
			placementTarget.addChild(button);
			button.x = xPlacement;
			button.y = yPlacement;
		}
	}
}