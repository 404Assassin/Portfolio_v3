package com.cw.data.serverSideCommunication{
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
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.IEventDispatcher
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class ContactFormData{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var url:String;
		private var senderName:String
		private var senderEmail:String
		private var senderMessage:String
		private var request:URLRequest;
		private var upLoader:URLLoader;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function ContactFormData(){}
		public function contactFormDataInterface(url:String, senderName:String, senderEmail:String, senderMessage:String):void{
			this.url = url;
			this.senderName = senderName;
			this.senderEmail = senderEmail;
			this.senderMessage = senderMessage;
			theURLVariables();
		}
		private function theURLVariables() {
			var variables:URLVariables = new URLVariables();
			variables.senderName = senderName;
			variables.senderEmail = senderEmail;
			variables.senderMessage = senderMessage;
			theURLRequest(variables)
		}
		private function theURLRequest(variables:URLVariables) {
			request = new URLRequest(url);
			request.method = URLRequestMethod.POST;
			request.data = variables;
			theURLLoader(request)
		}
		private function theURLLoader(request:URLRequest) {
			upLoader = new URLLoader();
			configureListeners(upLoader);
			upLoader.dataFormat = URLLoaderDataFormat.VARIABLES;
			upLoader.addEventListener(Event.COMPLETE, dataUpLoadComplete);
			upLoader.load(request);
		}
		private function dataUpLoadComplete(event:Event):void{
			var upLoader:URLLoader = URLLoader(event.target);
			trace('@ContactFormData @UpLoadComplete '+ event);
			trace('senderName: '+ upLoader.data.senderName + '\n' + 'senderMessage: ' + upLoader.data.senderMessage);
			trace('senderName: '+ request.data.senderName + '\n' + 'senderEmail: ' + request.data.senderEmail + '\n' + 'senderMessage: ' + request.data.senderMessage);
		}
		private function configureListeners(dispatcher:IEventDispatcher):void {
			dispatcher.addEventListener(Event.COMPLETE, completeHandler);
			dispatcher.addEventListener(Event.OPEN, openHandler);
			dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
		}
		private function completeHandler(event:Event):void {
			var loader:URLLoader = URLLoader(event.target);
			trace("completeHandler: " + loader.data);
			trace("completeHandler: " + loader.data.senderName);
		}
		private function openHandler(event:Event):void {
			trace("openHandler: " + event);
		}
		private function progressHandler(event:ProgressEvent):void {
			trace("progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
		}
		private function securityErrorHandler(event:SecurityErrorEvent):void {
			trace("securityErrorHandler: " + event);
		}
		private function httpStatusHandler(event:HTTPStatusEvent):void {
			trace("httpStatusHandler: " + event);
		}
		private function ioErrorHandler(event:IOErrorEvent):void {
			trace("ioErrorHandler: " + event);
		}
	}
}
