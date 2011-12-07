package com.cw.data.forms{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * contact form
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: Christian Worley
	 * created: 08/2011
	 * TODO; tab fields, auto scroll on message, auto complete?
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	
	import com.cw.controls.dynamicButton.DynamicButton;
	import com.cw.controls.prompt.ErrorPopUp;
	import com.cw.data.regularExpressions.EmailCheck;
	import com.cw.data.serverSideCommunication.ContactFormData;
	import com.cw.patterns.observer.IInvokedObserver;
	import com.cw.patterns.observer.InvokedObserver;
	import com.cw.visuals.shapeCreators.CreateShape;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	import com.greensock.loading.LoaderMax;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class ContactForm implements IInvokedObserver{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var contactFormHolder:MovieClip;
		private var stageReference:Stage;
		private var placementTarget:MovieClip;
		private var rotationAmount:int = 180;
		private var theDynamicButton:DynamicButton;
		private var theSubmitButton:Sprite;
		private var dynamicButtonObserver:InvokedObserver = new InvokedObserver();
		private var nameErrorPopUp:ErrorPopUp = new ErrorPopUp();
		private var emailErrorPopUp:ErrorPopUp = new ErrorPopUp();
		private var messageErrorPopUp:ErrorPopUp = new ErrorPopUp();
		private var infoObj:Object;
		private var nameData:String;
		private var emailData:String;
		private var messageData:String;
		private var nameInput:TextField;
		private var emailInput:TextField;
		private var messageInput:TextField;
		private var nameInputBoolean:Boolean;
		private var emailInputBoolean:Boolean;
		private var messageInputBoolean:Boolean;
		private var nameValidationBoolean:Boolean;
		private var emailValidationBoolean:Boolean;
		private var messageValidationBoolean:Boolean;
		private var nameTextFieldX:int = 339;
		private var nameTextFieldY:int = 20;
		private var errorFieldBufferX:int = 10;
		private var errorFieldBufferY:int = 10;
		private var nameErrorX:int = 225;
		private var nameErrorY:int = 5;
		private var nameErrorPopUpHeight:Number
		private var emailErrorPopUpHeight:Number
		private var defaultNameText:String;
		private var defaultEmailText:String;
		private var defaultMessageText:String;
		private var sendButtonText:String;
		private var sendingText:String;
		private var errorNameText:String;
		private var errorEmailText:String;
		private var errorMessageText:String;
		private var errorServerText:String;
		private var confirmationText:String;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function ContactForm():void{};
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function contactFormInterface(stageReference:Stage, placementTarget:MovieClip):void{
			this.stageReference = stageReference;
			this.placementTarget = placementTarget;
			initBuild();
		}
		public function contactFormOffInterface():void{
			TweenMax.to (contactFormHolder, 1, {delay:.5, alpha:0, visible:false, ease:Sine.easeOut});
			contactFormHolder = null;
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Method interface for InvokedObserver instance reference.
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function observableInstanceRef(dynamicButtonObserver:InvokedObserver):void{
			dynamicButtonObserver.addObserver(this)
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function initBuild():void {
			contentAssignment();
			addFormHolder();
			observableInstanceRef(dynamicButtonObserver);
		}
		private function addFormHolder():void {
			contactFormHolder = new MovieClip();
			TweenMax.to (contactFormHolder, 0, {alpha:0, x:465, y:-190, rotationY:rotationAmount});
			placementTarget.content_stage.addChild(contactFormHolder);
			addFormHolderBackground();
		}
		private function addFormHolderBackground():void{
			var contactFormBackgroundHolder:MovieClip = new MovieClip();
			var theShapeCreator:CreateShape = new CreateShape();
			theShapeCreator.draw(CreateShape.SQUARE_FILLED, contactFormBackgroundHolder, 0, 0, 360, 380)
			TweenMax.to (contactFormBackgroundHolder, 0, {alpha:.5, tint:0x000000});
			contactFormHolder.addChild(contactFormBackgroundHolder);
			nameInputField();
			emailInputField();
			messageInputField();
			submitButton();
			initBooleanStates();
		}
		private function initBooleanStates():void {
			nameInputBoolean = false;
			emailInputBoolean = false;
			messageInputBoolean = false;
			nameValidationBoolean = false;
			emailValidationBoolean = false;
			messageValidationBoolean = false;
		}
		private function nameInputField():void{
			var nameInputField:CreateInputTextField = new CreateInputTextField();
			nameInputField.createInputTextFieldInterface(10, 10, nameTextFieldX, nameTextFieldY);
			nameInput = nameInputField.getInputTextField();
			nameInput.multiline = false;
			nameInput.wordWrap = false;
			nameInput.text = defaultNameText;
			contactFormHolder.addChild(nameInput);
			nameInput.addEventListener(FocusEvent.FOCUS_IN,nameInputHandler);
			nameInput.addEventListener(FocusEvent.FOCUS_OUT,nameInputHandler);
			nameInput.addEventListener(KeyboardEvent.KEY_DOWN, enterKeyHandler);
		}
		private function emailInputField():void{
			var emailInputField:CreateInputTextField = new CreateInputTextField();
			emailInputField.createInputTextFieldInterface(10, 35, nameTextFieldX, 20);
			emailInput = emailInputField.getInputTextField();
			emailInput.multiline = false;
			emailInput.wordWrap = false;
			emailInput.text = defaultEmailText;
			contactFormHolder.addChild(emailInput);
			emailInput.addEventListener(FocusEvent.FOCUS_IN,emailInputHandler);
			emailInput.addEventListener(FocusEvent.FOCUS_OUT,emailInputHandler);
			emailInput.addEventListener(KeyboardEvent.KEY_DOWN, enterKeyHandler);
		}
		private function messageInputField():void{
			var messageInputField:CreateInputTextField = new CreateInputTextField();
			messageInputField.createInputTextFieldInterface(10, 60, nameTextFieldX, 275);
			messageInput = messageInputField.getInputTextField();
			messageInput.multiline = true;
			messageInput.wordWrap = true;
			messageInput.text = defaultMessageText;
			contactFormHolder.addChild(messageInput);
			messageInput.addEventListener(FocusEvent.FOCUS_IN,messageInputHandler);
			messageInput.addEventListener(FocusEvent.FOCUS_OUT,messageInputHandler);
			messageInput.addEventListener(KeyboardEvent.KEY_DOWN, enterKeyHandler);
		}
		private function submitButton():void{
			theDynamicButton = new DynamicButton();
			theDynamicButton.observableInstanceRef(dynamicButtonObserver);
			theDynamicButton.buttonInterface(contactFormHolder, 0, 0, theCSSTextContent('buttonSend'))
			theSubmitButton = theDynamicButton.getTheButton();
			TweenMax.to (theSubmitButton, 0, {alpha:0, x:300, y:345});
			formBuild();
		}
		private function formBuild():void{
			TweenMax.to (contactFormHolder, .75, {delay:1, alpha:1, x:465, y:-165, ease:Sine.easeOut});
			TweenMax.to (theSubmitButton, .75, {delay:.75, alpha:1, x:300, y:345, ease:Sine.easeOut});
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Form validation logic
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function nameInputHandler(event:FocusEvent):void{
			if (nameValidationBoolean == true){
				nameErrorPopUp.placementTargetUp(null);
				nameErrorPopUp.placementTargetOut(null);
			}
			if(nameInput.text == defaultNameText){
				nameInput.text = '';
				nameInputBoolean = false;
				return;
			} else if (nameInput.text.length == 0){
				nameInput.text = defaultNameText;
				nameInputBoolean = false;
			} else if (nameInput.text.length != 0){
				nameData = nameInput.text;
				nameInputBoolean = true;
			}
		}
		private function emailInputHandler(event:FocusEvent):void{
			if (nameValidationBoolean == true){
				emailErrorPopUp.placementTargetUp(null);
				emailErrorPopUp.placementTargetOut(null);
			}
			if(emailInput.text == defaultEmailText){
				emailInput.text = '';
				emailInputBoolean = false;
				return;
			} else if (emailInput.text.length == 0){
				emailInput.text = defaultEmailText;
				emailInputBoolean = false;
			} else if (emailInput.text.length != 0){
				emailData = emailInput.text;
				emailInputBoolean = true;
			}
		}
		private function messageInputHandler(event:FocusEvent):void{
			if (nameValidationBoolean == true){
				messageErrorPopUp.placementTargetUp(null);
				messageErrorPopUp.placementTargetOut(null);
			}
			if(messageInput.text == defaultMessageText){
				messageInput.text = '';
				messageInputBoolean = false;
				return;
			} else if (messageInput.text.length == 0){
				messageInput.text = defaultMessageText;
				messageInputBoolean = false;
			} else if (messageInput.text.length != 0){
				messageData = messageInput.text;
				messageInputBoolean = true;
			}
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Check form validity on send, if invalid display errors
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function emailSubmit(emailData:String):void{
			var theEmailCheck:EmailCheck = new EmailCheck();
			theEmailCheck.checkEmail(emailData);
			if (!nameInputBoolean){
				nameValidationError();
				nameValidationBoolean = true;
			} 
			if (!theEmailCheck.checkEmail(emailData)){
				emailValidationError();
			} 
			if (!messageInputBoolean){
				messageValidationError();
			}
			if ((theEmailCheck.checkEmail(emailData) == true) && (nameInputBoolean == true) && (messageInputBoolean == true)){
				sendDataHandler();
				dataSentFormContents();
				dataReset();
			}
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Form data logic
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function update(theObserver:InvokedObserver, infoObject:Object):void{
			emailSubmit(emailData);
			if(infoObject == 'theSubmitButton'){
				emailSubmit(emailData);
			}
		}
		private function enterKeyHandler(event:KeyboardEvent):void{
			if (event.charCode == 13){
				emailSubmit(emailData);
			} 
		}
		private function sendDataHandler():void{
			var theContactFormData:ContactFormData = new ContactFormData();
			theContactFormData.contactFormDataInterface("http://worleydev.com/mail.php", nameData, emailData, messageData)
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Form data error handles
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function nameValidationError():void {
			nameErrorPopUp.errorPopUpInterface(contactFormHolder, nameErrorX, nameErrorY, errorNameText);
			nameErrorPopUp.lineInterface(-215, 6);
		}
		private function emailValidationError():void {
			nameErrorPopUpHeight = nameErrorPopUp.getErrorPopUpHeight()
			var emailErrorY:int = nameErrorY + nameErrorPopUpHeight + errorFieldBufferY
			emailErrorPopUp.errorPopUpInterface(contactFormHolder, nameErrorX, emailErrorY, errorEmailText);
			emailErrorPopUp.lineInterface(-215, -23);
		}
		private function messageValidationError():void {
			emailErrorPopUpHeight = 44
			var messageErrorY:int = nameErrorY + nameErrorPopUpHeight + errorFieldBufferY + emailErrorPopUpHeight + errorFieldBufferY
			messageErrorPopUp.errorPopUpInterface(contactFormHolder, nameErrorX, messageErrorY, errorMessageText);
			messageErrorPopUp.lineInterface(-215, -52);
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Support functions
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		/**
		 * Method for returning button text with css tags from XML. 
		 * Pass it a refrence of the nodes 'name' to link content.
		 */
		private function theCSSTextContent(nodeName:String):String {
			var nodeNameVar:LoaderMax = LoaderMax.getLoader(nodeName);
			var nodeText:String = nodeNameVar.vars.text;
			var nodeCSSTag:String = nodeNameVar.vars.cssTag;
			var cssTextContent:String = '<'+nodeCSSTag+'>'+nodeText+'</'+nodeCSSTag+'>';
			return cssTextContent;
		}
		/**
		 * Method for returning button text from XML.
		 * Pass it a refrence of the nodes 'name' to link content.
		 */
		private function theTextContent(nodeName:String):String {
			var nodeNameVar:LoaderMax = LoaderMax.getLoader(nodeName);
			var nodeText:String = nodeNameVar.vars.text;
			return nodeText;
		}
		private function contentAssignment():void {
			defaultNameText = theTextContent('promptName');
			defaultEmailText = theTextContent('promptEmail');
			defaultMessageText = theTextContent('promptMessage');
			sendingText = theTextContent('statusSending');
			errorNameText = theCSSTextContent('errorName') + '\n' + theCSSTextContent('promptClose');
			errorEmailText = theCSSTextContent('errorEmail') + '\n' + theCSSTextContent('promptClose');
			errorMessageText = theCSSTextContent('errorMessage') + '\n' + theCSSTextContent('promptClose');
			errorServerText = theTextContent('statusServerError');
			confirmationText = theTextContent('statusSent') + nameData;
		}
		private function dataReset():void{
			nameData = null;
			emailData = null;
			messageData = null;
		}
		private function dataSentFormContents():void{
			nameInput.text = defaultNameText;
			emailInput.text = defaultEmailText;
			messageInput.text = defaultMessageText;
		}
	}
}