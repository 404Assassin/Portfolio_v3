package com.cw.data.javascript{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Class discription: public class ShadowboxJavaScript
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: christian
	 * contact: christian@worleydev.com
	 * created: Nov 14, 2011
	 * TODO;  get shadowboxJSinit() to work
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.external.ExternalInterface;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class ShadowboxJavaScript{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function ShadowboxJavaScript(){};
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function shadowboxJSinterface():void {
			//jsAlertTest();
			//shadowboxJSinit();
			shadowboxOpen();
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function jsAlertTest():void {
			var jsAlertTest:XML = 
				<![CDATA[
				
					function(myFoo){
						function myFunc (str){ 
							alert(str); 
						}; 
						myFunc(myFoo); 
					}
				
				]]>
			ExternalInterface.call(jsAlertTest , 'foobar');
		}
		private function shadowboxJSinit():void {
			var shadowboxInitJS:XML = 
				<![CDATA[
					<script type="text/javascript" src="./shadowbox/shadowbox.js"></script>
					<script type="text/javascript">
						Shadowbox.init({
							players:['img', 'html', 'swf', 'flv', 'iframe'],
							troubleElements: ['select', 'canvas'],
							overlayOpacity: 0.95,
							resizeDuration: 0.25
						});
					</script>
				]]>
			ExternalInterface.call(shadowboxInitJS);
		}
		private function shadowboxOpen():void {
			var shadowboxOpenJS:XML = 
				<![CDATA[
					function openShadowbox(){
						Shadowbox.open({
							content:    '<div id="welcome-msg">Welcome to my website!</div>',
							player:     "html",
							title:      "Welcome",
							height:     350,
							width:      350
						});
					}
				]]>
			ExternalInterface.call(shadowboxOpenJS);
		}
	}
}

