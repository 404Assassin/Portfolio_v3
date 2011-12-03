package com.cw.visuals.contentArea{
	/**
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Content area base class
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: Christian Worley
	 * created: 01/2011
	 * TODO:
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.controls.textButtons.BackButton;
	import com.cw.controls.textButtons.ContactButton;
	import com.cw.controls.textButtons.PortfolioButton;
	import com.cw.data.forms.ContactForm;
	import com.cw.patterns.observer.IInvokedObserver;
	import com.cw.patterns.observer.InvokedObserver;
	import com.cw.stageAlignments.StageAlignment;
	import com.cw.visuals.animations.NameAnime;
	import com.cw.visuals.contentArea.states.ContentAreaState;
	import com.cw.visuals.flipOpen3D.CFlipOpen3Dv2;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	import com.greensock.loading.LoaderMax;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Point;
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class ContentArea implements IInvokedObserver{
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var contactForm:ContactForm;
		private var portfolioDirectory:PortfolioDirectory;
		private var contactObserver:InvokedObserver = new InvokedObserver();
		private var backgroundObserver:InvokedObserver;
		private var infoObj:Object;
		private var mainMC:main_mc = new main_mc();
		private var stageReference:Stage;
		private var stageWidth:int;
		private var stageHeight:int;
		private var theAverageColor:Object;
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function ContentArea(){};
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function ContentAreaInterface(stageReference:Stage):void {
			this.stageReference = stageReference;
			this.stageWidth = stageReference.stageWidth;
			this.stageHeight = stageReference.stageHeight;
			centerStagePerspective();
			createMainMC();
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		/**
		 * Update 3D transform pespective postion to center stage. 
		 * 
		 */		
		private function centerStagePerspective():void {
			stageReference.transform.perspectiveProjection.projectionCenter = new Point(stageReference.stageWidth * .5, stageReference.stageHeight * .5);
		}
		private function createMainMC():void {
			stageReference.addChild (mainMC);
			addContents()
		}
		private function addContents():void {
			addNameAnime()
			addButtons();
			addStageAlignment();
			addContentStage();
		}
		private function addNameAnime():void {
			var theNameAnime:NameAnime = new NameAnime();
			theNameAnime.nameAnimeInterface(mainMC, 0, -170);
			theNameAnime.observableInstanceRef(contactObserver);
		}
		private function addButtons():void{
			theContactButton();
			thePortfolioButton();
			theBackButton();
			observableContactObserver();
		}
		/**
		 * DynamicButton contactButton, by both name and type; 
		 * placementTarget:MovieClip, xPlacement:int, yPlacement:int, 
		 * textContent:String 
		 */
		private function theContactButton():void{
			var contactButton:ContactButton = new ContactButton();
			contactButton.buttonInterface(mainMC, 280, -33, theButtonText('buttonContact'));
			contactButton.observableInstanceRef(contactObserver);
		}
		private function theBackButton():void{
			var backButton:BackButton = new BackButton();
			backButton.buttonInterface(mainMC, 0, 140, theButtonText('buttonBack'));
			backButton.observableInstanceRef(contactObserver);
			observableContactObserver();
		}
		private function thePortfolioButton():void{
			var portfolioButton:PortfolioButton = new PortfolioButton();
			portfolioButton.buttonInterface(mainMC, -280, -33, theButtonText('buttonPortfolio'));
			portfolioButton.observableInstanceRef(contactObserver);
		}
		/**
		 * Method for returning button text. Pass it a refrence of the nodes 'name'
		 */
		private function theButtonText(nodeName:String):String {
			var buttonContent:LoaderMax = LoaderMax.getLoader(nodeName);
			var buttonText:String = buttonContent.vars.text;
			var buttonTag:String = buttonContent.vars.cssTag;
			var button:String = '<'+buttonTag+'>'+buttonText+'</'+buttonTag+'>';
			return button;
		}
		/**
		 * Method interface for Contact InvokedObserver Object instance reference.
		 */		
		public function observableContactObserver():void{
			contactObserver.addObserver(this)
		}
		/**
		 * Add the Stage Alignment Button Event Listener and pass it the 
		 * a stage reference and container MovieClip reference.
		 */		
		private function addStageAlignment():void {
			var TheStageAlignment:StageAlignment = new StageAlignment();
			TheStageAlignment.addStageAlignmentEventListeners(stageReference, mainMC)
		}
		/**
		 * params for Flipout5.addToDisplay are, by both name and type, 
		 * imageName:String, the the_mcX:Number, the_mcY:Number
		 */
		private function addContentStage():void {
			var animeHolder:MovieClip = new MovieClip();
			mainMC.content_stage.addChild(animeHolder);
			var theCFlipOpen3Dv5:CFlipOpen3Dv2 = new CFlipOpen3Dv2();
			theCFlipOpen3Dv5.setCFlip3D('TheRaven_v2_0', 50, 50);
			var thisCFlipOpen3Dv5:Sprite = theCFlipOpen3Dv5.getCFlipOpen3D();
			animeHolder.addChild(thisCFlipOpen3Dv5);
			var diagonal:Number = -((Math.sqrt(2)*50)*.5);
			TweenMax.to(animeHolder, 0, { z:-25, x:diagonal, y:0, rotation:-45});
			TweenMax.to(animeHolder, 1, {delay:4.5, alpha:1, dropShadowFilter:{color:0x000000, alpha:.5, blurX:5, blurY:5, distance:5, inner:true}, ease:Sine.easeOut, onComplete:animeLoop, onCompleteParams:[animeHolder]});
			updateContentAreaState('contactInitBuild');
		}
		/**
		 * loop for nested 3d transform displayObject bug
		 */
		private function animeLoop(animeHolder:MovieClip):void {
			var timeline:TimelineMax = new TimelineMax({repeat:-1, yoyo:true, repeatDelay:0});
			timeline.append(TweenMax.to(animeHolder, 1, {alpha:1}));
			timeline.append(TweenMax.to(animeHolder, 1, {alpha:.99999}));
		}
		/**
		 * InvokedObserver interface, reference update, and subscription
		 */
		public function observableInstanceRef(backgroundObserver:InvokedObserver):void{
			this.backgroundObserver = backgroundObserver;
			backgroundObserver.addObserver(this)
		}
		/**
		 * InvokedObserver update
		 */
		public function update(o:InvokedObserver, infoObj:Object):void{
			this.infoObj = infoObj;
			updateContentAreaState(infoObj);
		}
		/**
		 * update Content Area State by observer info object as a conditional
		 */
		private function updateContentAreaState(infoObj:Object):void{
			var theContentAreaState:ContentAreaState = new ContentAreaState();
			theContentAreaState.contentAreaStateInterface(stageReference, mainMC);
			if (infoObj == 'contactOn'){
				contactFormOn();
				theContentAreaState.setState(ContentAreaState.STATE_CONTACT_ON);
			}else if (infoObj == 'contactOff'){
				contactFormOff();
				theContentAreaState.setState(ContentAreaState.STATE_CONTACT_OFF);
			}else if (infoObj == 'contactInitBuild'){
				theContentAreaState.setState(ContentAreaState.STATE_INIT_BUILD);
			}else if (infoObj == 'portfolioOn'){
				portfolioOn();
				theContentAreaState.setState(ContentAreaState.STATE_PORTFOLIO_ON);
			}else if (infoObj == 'portfolioOff'){
				portfolioOff();
				theContentAreaState.setState(ContentAreaState.STATE_PORTFOLIO_OFF);
			}else if (infoObj is uint){
				theContentAreaState.setState(ContentAreaState.STATE_COLOR_CHANGE);
				this.theAverageColor = infoObj;
				setContentAreaBGColor(infoObj)
			}
		}
		private function contactFormOn():void{
			contactForm = new ContactForm();
			contactForm.contactFormInterface(stageReference, mainMC);
		}
		/**
		 * Contact form GC 
		 */		
		private function contactFormOff():void{
			contactForm.contactFormOffInterface();
			contactForm = null;
		}
		private function portfolioOn():void{
			portfolioDirectory = new PortfolioDirectory();
			portfolioDirectory.portfolioDirectoryInterface(stageReference, mainMC);
		}
		/**
		 * portfolio section GC
		 * 
		 */
		private function portfolioOff():void{
			portfolioDirectory.portfolioDirectoryOffInterface();
			portfolioDirectory = null;
		}
		/**
		 * target object and pass it the new hex color reference
		 */
		private function setContentAreaBGColor(theAverageColor:Object){
			TweenMax.to (mainMC.content_stage.stageBG, 1, {delay:2.5, tint:theAverageColor});
			TweenMax.to (mainMC.main_mc_BG, 2, {delay:3, tint:theAverageColor});
		}
	}
}