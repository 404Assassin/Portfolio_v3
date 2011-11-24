package com.cw.data.forms{
	/**
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * ContactFormData Class passes sever side php script the contact forms 
	 * information.
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: Christian Worley
	 * created: 10/2011
	 * TODO:
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.controls.dynamicButton.DynamicButton;
	import com.cw.data.regularExpressions.EmailCheck;
	import com.cw.data.serverSideCommunication.ContactFormData;
	import com.cw.patterns.observer.IInvokedObserver;
	import com.cw.patterns.observer.InvokedObserver;
	import com.cw.visuals.shapeCreators.CreateShape;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.text.AntiAliasType;
	import flash.text.GridFitType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class CreateInputTextField{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var theInputTextField:TextField;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function CreateInputTextField(){}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Custom input textfield interface
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function createInputTextFieldInterface(x:Number, y:Number, width:Number, height:Number):void {
			createCustomTextField(x, y, width, height);
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Create custom input textfield
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function createCustomTextField(x:Number, y:Number, width:Number, height:Number):void {
			theInputTextField = new TextField();
			theInputTextField.x = x;
			theInputTextField.y = y;
			theInputTextField.width = width;
			theInputTextField.height = height;
			theInputTextField.background = true;
			theInputTextField.border = false;
			theInputTextField.selectable = true;
			theInputTextField.type = TextFieldType.INPUT;
			theInputTextField.defaultTextFormat = formFormat();
			theInputTextField.gridFitType = GridFitType.SUBPIXEL;
			theInputTextField.antiAliasType=AntiAliasType.ADVANCED;
			theInputTextField.sharpness=400;
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Create the custom format
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function formFormat():TextFormat {
			var theFormat:TextFormat = new TextFormat();
			theFormat.align = TextFormatAlign.LEFT;
			theFormat.font = "Trebuchet MS";
			theFormat.color = 0x000000;
			theFormat.size = 14;
			return theFormat;
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Custom input textfield interface
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function getInputTextField():TextField {
			return theInputTextField;
		}
	}
}