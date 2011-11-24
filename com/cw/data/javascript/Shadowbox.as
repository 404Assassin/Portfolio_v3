package com.cw.data.javascript{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Class discription: modified version of shiftarray's ShadowBox class:
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * @author Alex Logashov
	 * http://shiftarray.com
	 * Version 1.5 (2011/07/31)
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: christian
	 * contact: christian@worleydev.com
	 * created: Nov 14, 2011
	 * TODO;  
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.external.ExternalInterface;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class Shadowbox{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Static Constant Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		//private static const PLAYER:String = "iframe";
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Static Public Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		static public var animate:Boolean = 			true;
		static public var animateFade:Boolean = 		true; 
		static public var animSequence:String = 		"sync"; 
		static public var autoplayMovies:Boolean = 		true; 
		static public var continuous:Boolean = 			false; 
		static public var counterLimit:Number = 		10; 
		static public var counterType:String = 			"default"; 
		static public var displayCounter:Boolean = 		true; 
		static public var displayNav:Boolean = 			true; 
		static public var enableKeys:Boolean = 			true; 
		static public var fadeDuration:Number = 		0.35; 
		static public var flashParams:Object = 			{bgcolor:'#FFFFFF'};
		static public var flashVars:Object = 			{};
		static public var flashVersion:String = 		"9.0.0";
		static public var handleOversize:String = 		"resize";
		static public var handleUnsupported:String =	 "link";
		static public var initialHeight:Number = 		160;
		static public var initialWidth:Number = 		320;
		static public var modal:Boolean = 				false;
		static public var overlayColor:String = 		"#000";
		static public var overlayOpacity:Number = 		0.80;
		static public var resizeDuration:Number = 		0.35;
		static public var showOverlay:Boolean = 		true;
		static public var showMovieControls:Boolean = 	true;
		static public var skipSetup:Boolean = 			true;
		static public var slideshowDelay:Number = 		0;
		static public var viewportPadding:Number = 		20;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Static Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		static private var _instance:Shadowbox;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function Shadowbox(){
			trace("@ ShadowBox.ShadowBox() _instance "+ _instance);
			if (_instance) return;
			_instance = this;
			init();
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Static Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		static public function get instance():Shadowbox{
			return _instance || (_instance = new Shadowbox);
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function open(content:String, title:String, width:Number, height:Number, player:String):void{
			trace("@ Shadowbox.open(content, title, width, height, player) "+ content + title + width + height +player);
			//ExternalInterface.call("sbox.open", content, title, width, height, PLAYER);
			ExternalInterface.call("sbox.open", content, title, width, height, player);
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function init():void{
			trace("@ Shadowbox.init() ");
			if (ExternalInterface.available){
				ExternalInterface.call(SHADOWBOX_JAVASCRIPT);
				ExternalInterface.call("sbox.init", 
					animate, 
					animateFade, 
					animSequence,
					autoplayMovies, 
					continuous, 
					counterLimit,
					counterType, 
					displayCounter, 
					displayNav,
					enableKeys, 
					fadeDuration, 
					flashParams,
					flashVars, 
					flashVersion, 
					handleOversize,
					handleUnsupported,
					initialHeight,
					initialWidth,
					modal,
					overlayColor,
					overlayOpacity,
					resizeDuration,
					showOverlay,
					showMovieControls,
					skipSetup,
					slideshowDelay,
					viewportPadding );
			}
		}
	}
}
internal const SHADOWBOX_JAVASCRIPT:XML =
	<script>
		<![CDATA[
			function() {
				try { sbox } 
				catch (e) { sbox = new Object(); }
				sbox.init = function(	animate, 
										animateFade, 
										animSequence,
										autoplayMovies, 
										continuous, 
										counterLimit,
										counterType, 
										displayCounter, 
										displayNav,
										enableKeys, 
										fadeDuration, 
										flashParams,
										flashVars, 
										flashVersion, 
										handleOversize,
										handleUnsupported,
										initialHeight,
										initialWidth,
										modal,
										overlayColor,
										overlayOpacity,
										resizeDuration,
										showOverlay,
										showMovieControls,
										skipSetup,
										slideshowDelay,
										viewportPadding ){
					Shadowbox.init( { 	
										animate: 	 		animate, 
										animateFade: 		animateFade, 
										animSequence: 		animSequence,
										autoplayMovies: 	autoplayMovies, 
										continuous: 		continuous, 
										counterLimit: 		counterLimit,
										counterType: 		counterType, 
										displayCounter: 	displayCounter, 
										displayNav: 		displayNav,
										enableKeys: 		enableKeys, 
										fadeDuration: 		fadeDuration, 
										flashParams: 		flashParams,
										flashVars: 			flashVars, 
										flashVersion: 		flashVersion, 
										handleOversize: 	handleOversize,
										handleUnsupported:	handleUnsupported,
										initialHeight: 		initialHeight,
										initialWidth: 		initialWidth,
										modal: modal,
										overlayColor: 		overlayColor,
										overlayOpacity: 	overlayOpacity,
										resizeDuration: 	resizeDuration,
										showOverlay: 		showOverlay,
										showMovieControls: 	showMovieControls,
										skipSetup: 			skipSetup,
										slideshowDelay: 	slideshowDelay,
										viewportPadding: 	viewportPadding 
									} );
				}
				sbox.open = function(content, title, width, height, player) {
					Shadowbox.open({
						content:    content,
						title:      title,
						width:      width,
						height:     height,
						player:		player
					});
				}
			}
		]]>
	</script>
