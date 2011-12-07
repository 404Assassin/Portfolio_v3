﻿package {	/**	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	 * Class discription: main class for worleyev.com	 * language version: ActionScript 3.0	 * player version: Flash 10.0	 * author: christian	 * contact: christian@worleydev.com	 * created: 01/2011	 * TODO; 	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	 */	//:::::::::::::::::::::::::::::::::::::::::::::::::	// Imports	//:::::::::::::::::::::::::::::::::::::::::::::::::	import com.cw.patterns.observer.IInvokedObserver;	import com.cw.patterns.observer.InvokedObserver;	import com.cw.utilities.loaders.FontSWFLoader;	import com.cw.utilities.preloaders.FourBarPreloader;	import com.cw.visuals.BackgroundHandler;	import com.cw.visuals.contentArea.ContentArea;	import com.cw.visuals.navigationBar.NavigationBar;	import com.greensock.TweenMax;	import com.greensock.easing.Sine;	import com.greensock.events.LoaderEvent;	import com.greensock.loading.CSSLoader;	import com.greensock.loading.ImageLoader;	import com.greensock.loading.LoaderMax;	import com.greensock.loading.SelfLoader;	import com.greensock.loading.XMLLoader;	import flash.display.Loader;	import flash.display.MovieClip;	import flash.display.Stage;	import flash.display.StageAlign;	import flash.display.StageScaleMode;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	// Class characteristics	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	public class PortfolioMain extends MovieClip implements IInvokedObserver{		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::		// Public Static Constants		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::		//////		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::		// Public Variables		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::		//////		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::		// Private Variables		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::		private var backgroundObserver:InvokedObserver = new InvokedObserver();		private var fontLoadObserver:InvokedObserver = new InvokedObserver();		private var swfStage:Stage;		private var theFourBarPreloader:FourBarPreloader;		private var empty_mc:Loader=new Loader();		private var loadSWFFonts:FontSWFLoader = new FontSWFLoader();		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::		// Constructor		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::		public function PortfolioMain () {			init();		}		/**		 * create and add stage.		 * 		 */				private function init () {			stage.addChild (empty_mc);			swfStage = empty_mc.stage;			swfStage.scaleMode = StageScaleMode.NO_SCALE;			swfStage.align = StageAlign.TOP_LEFT;			loadFont();		}		/**		 * Load external fonts. Must match font used in CSS doc.		 * 		 */			private function loadFont(){			loadSWFFonts.fontSWFLoaderInterface('./fonts/fontENTrebuchetMS.swf');			loadSWFFonts.observableInstanceRef(fontLoadObserver);			observableInstanceRef(fontLoadObserver);		}		/**		 * Observer reference for font load events.		 * 		 */		public function observableInstanceRef(fontLoadObserver:InvokedObserver):void{			this.fontLoadObserver = fontLoadObserver;			fontLoadObserver.addObserver(this)		}		/**		 * Observer update for font load events.		 * 		 */		public function update(theObserver:InvokedObserver, infoObject:Object):void {			loadExternalAssets();		}		/**		 * Loadermax references and setup for CSS doc and all images and text via siteAssets.xml. 		 * Poader asets queue setup.		 * 		 */				private function loadExternalAssets():void{			progressBarCreation();			LoaderMax.activate([ImageLoader, CSSLoader]);			LoaderMax.defaultAuditSize = false;			var queue:LoaderMax = new LoaderMax({name:"mainQueue", onProgress:progressHandler, onComplete:completeHandler, onError:errorHandler/*, auditSize:true*/});			queue.append( new SelfLoader(this, {/*estimatedBytes:121000*/}) );			queue.append( new CSSLoader("./css/flashSiteStyles.css", {name:"flashStyleSheet", alternateURL:"http://worleydev.com/css/flashSiteStyles.css", requireWithRoot:this.root}) );			queue.append( new XMLLoader("./xml/siteAssets.xml", {name:"xmlDoc", alternateURL:"http://worleydev.com/xml/siteAssets.xml"}) );			queue.load();		}		/**		 * Assets preloader addition and placment. 		 * 		 */				private function progressBarCreation():void {			var stageWidth = swfStage.stageWidth;			var stageHeight = swfStage.stageHeight;			var barPlacementX:int = stageWidth * .5;			var barPlacementY:int = stageHeight * .5;			var assetsPreloader:MovieClip = new MovieClip();			swfStage.addChild(assetsPreloader);			theFourBarPreloader = new FourBarPreloader();			theFourBarPreloader.preloaderInterface(swfStage, assetsPreloader)		}		/** 		 * Progress updates for preloader visuals.		 * 		 */				private function progressHandler(loaderEvent:LoaderEvent):void {			theFourBarPreloader.progressHandlerInterface(loaderEvent);		}		/** 		 * load complete calls.		 * 		 */				private	function completeHandler(event:LoaderEvent):void {			theFourBarPreloader.progressCompleteInterface();			addBG_mc();			addNavigationBar()			addMainMC();		}		private	function errorHandler(event:LoaderEvent):void {			trace("error occured with " + event.target + ": " + event.text);		}		/**		 * add content area. 		 * 		 */				private function addMainMC():void {			var mainContentArea:ContentArea = new ContentArea();			mainContentArea.ContentAreaInterface(swfStage);			mainContentArea.observableInstanceRef(backgroundObserver);		}		/**		 *	add background instance holder, observer refrence and init the load. 		 * 		 */				private function addBG_mc():void {			var theBackgroundHandler:BackgroundHandler = new BackgroundHandler();			theBackgroundHandler.BackgroundHandlerInterface(swfStage);			theBackgroundHandler.observableInstanceRef(backgroundObserver);		}		/**		 * invoke addNavigationBar and pass the Class interface a stage reference.		 */		private function addNavigationBar():void {			var TheNavigationBar:NavigationBar = new NavigationBar();			TheNavigationBar.updateStageReference(swfStage)		}		/**		 * to view all the contents of a MC by type pass the MC's ref to targetMc.		 */		private function whatAreTheMCContents () {			//new MovieClipChildren(mainMC.nameMC.nameContentMC);		}	}}