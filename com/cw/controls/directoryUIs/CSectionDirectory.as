package com.cw.controls.directoryUIs{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Class discription: public class CSectionDirectory implements ICFlip3D
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: christian
	 * contact: christian@worleydev.com
	 * created: Nov 23, 2011
	 * TODO;  
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.data.bitmaps.BitmapLoader;
	import com.cw.visuals.contentArea.ItemView;
	import com.cw.visuals.flipOpen3D.ICFlip3D;
	import com.cw.visuals.shapeCreators.CreateShape;
	import com.cw.visuals.text.CDynamicTextField;
	import com.cw.visuals.text.ICDynamicTextField;
	import com.cw.visuals.tweenStates.DirectoryButtonStates;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.display.ContentDisplay;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventPhase;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class CSectionDirectory implements ICFlip3D, ICSectionDirectory{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var theItemView:ItemView
		private var buttonStates:DirectoryButtonStates = new DirectoryButtonStates();
		private var itemViewHolder:Sprite;
		private var returnedObject:MovieClip;
		private var placement_BGAlpha:Number = .5;
		private var the_mcX:Number = 0;
		private var the_mcY:Number = 0;
		private var backgroundCenterWidth:Number = 10;
		private var backgroundCenterHeight:Number = 10;
		private var backgroundWidth:Number;
		private var backgroundHeight:Number;
		private var imageName:String
		private var finalPlacementAlpha:Number = 1;
		private var the_mcWidth:Number;
		private var the_mcHeight:Number;
		private var placementArray:Array = new Array();
		private var contentsArray:Array = new Array();
		private var stageReference:Stage;
		private var sectionName:String;
		private var buttonsBounds:Rectangle;
		private var aboutButtonX:int;
		private var aboutButtonRotation:int;
		private var aboutTextFieldFinalX:int;
		private var sectionHeaderTextHolder:Sprite;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function CSectionDirectory(){};
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function setCFlip3D(imageName:String, backgroundWidth:Number, backgroundHeight:Number):void{
			this.imageName = imageName;
			this.backgroundWidth = backgroundWidth;
			this.backgroundHeight = backgroundHeight;
			iterativeBuild();
		}
		public function stageAccess(stageReference:Stage, sectionName:String):void{
			this.stageReference = stageReference;
			this.sectionName = sectionName;
			addSectionHeader();
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Setters
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function setAboutButtonPositions(aboutButtonRotation:int, aboutButtonX:int):void {
			this.aboutButtonRotation = aboutButtonRotation;
			this.aboutButtonX = aboutButtonX;
		}
		public function setAboutTextFieldFinalX(aboutTextFieldFinalX:int):void {
			this.aboutTextFieldFinalX = aboutTextFieldFinalX;
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Getters
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function getCFlipOpen3D():Sprite{
			return returnedObject;
		}
		public function getButtonsBounds():Rectangle{
			return buttonsBounds;
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function addSectionHeader():void{
			sectionHeaderTextHolder = new Sprite();
			var nodeName:String = sectionName + 'Header';
			var headerContent:LoaderMax = LoaderMax.getLoader(nodeName);
			var headerText:String = headerContent.vars.text;
			var headerTag:String = headerContent.vars.cssTag;
			var header:String = '<'+headerTag+'>'+headerText+'</'+headerTag+'>';
			var theCDynamicTextField:CDynamicTextField = new CDynamicTextField();
			theCDynamicTextField.textFieldInterface(header, 185, 40, false, 0x000000, false, false);
			var xPlacement:int = -62
			var yPlacement:int = -105
			var sectionHeaderText:Sprite = theCDynamicTextField.getTheTextField();
			sectionHeaderTextHolder.addChild(sectionHeaderText);
			TweenMax.to (sectionHeaderTextHolder, 0,{alpha:0, x:xPlacement, y:-35, z:0});
			TweenMax.to (sectionHeaderTextHolder, 1,{delay:1.5, alpha:1, x:xPlacement, y:yPlacement, ease:Sine.easeInOut});
			returnedObject.addChild(sectionHeaderTextHolder);
		}
		private function iterativeBuild():void {
			returnedObject = new MovieClip();
			for(var i:uint = 0; i < 9; i++){
				var imagesRefIteration:String = imageName + i;
				var theImage:Bitmap = LoaderMax.getContent(imagesRefIteration).rawContent;
				var imageWidth:Number = theImage.width;
				var imageHeight:Number = theImage.height;
				var placementSprite:Sprite = new Sprite();
				var placementContents:Sprite = new Sprite();
				placementSprite.addChild(placementContents);
				var placementBackground:Sprite = new Sprite();
				placementContents.addChild(placementBackground);
				var placementGraphics:Sprite = new Sprite();
				placementContents.addChild(placementGraphics);
				contentsArray.push(placementContents);
				placementSprite.alpha = 0;
				placementBackground.alpha = placement_BGAlpha;
				var background:CreateShape = new CreateShape();
				background.draw(CreateShape.SQUARE_FILLED, placementBackground, 0,0,backgroundWidth,backgroundHeight)
				var smallSquare:CreateShape = new CreateShape();
				var backgroundCenterX:Number = (backgroundWidth - backgroundCenterWidth) / 2;
				var backgroundCenterY:Number = (backgroundHeight - backgroundCenterHeight) / 2;
				smallSquare.draw(CreateShape.SQUARE_FILLED, placementBackground, backgroundCenterX,backgroundCenterY,backgroundCenterWidth,backgroundCenterHeight)
				TweenMax.to (placementBackground, 0, {tint:000000});
				placementGraphics.addChild(theImage);
				var theImageX:Number = (backgroundWidth - imageWidth) / 2;
				var theImageY:Number = (backgroundHeight - imageHeight) / 2;
				TweenMax.to (theImage, 0, {x:theImageX, y:theImageY});
				returnedObject.addChild (placementSprite);
				placementArray.push(placementSprite);
				addTheButtonEvents(i);
			};
			the_mcWidth = placementArray[4].width;
			the_mcHeight = placementArray[4].height;
			initStagePlacement(the_mcX, the_mcY);
		}
		/**
		 * iterative event addition
		 */		
		private function addTheButtonEvents(i:uint):void {
			placementArray[i].doubleClickEnabled = true;
			//placementArray[i].addEventListener (MouseEvent.MOUSE_UP, placementTargetUp);
			placementArray[i].addEventListener (MouseEvent.CLICK, placementTargetUp);
			placementArray[i].addEventListener (MouseEvent.MOUSE_DOWN, placementTargetDown);
			placementArray[i].addEventListener (MouseEvent.MOUSE_OUT, placementTargetOut);
			placementArray[i].addEventListener (MouseEvent.MOUSE_OVER, placementTargetOver);
		}
		/**
		 * set init placement of the display objects
		 */
		private function initStagePlacement(the_mcX, the_mcY){
			TweenMax.to (contentsArray[0], 0, { y:-the_mcHeight});
			TweenMax.to (placementArray[0], 0, {alpha:.0, x:the_mcX-the_mcWidth, y:the_mcY, rotationX:179});
			TweenMax.to (contentsArray[1], 0, {y:-the_mcHeight});
			TweenMax.to (placementArray[1], 0,{alpha:.0, x:the_mcX, y:the_mcY, rotationX:179});
			TweenMax.to (placementArray[2], 0, {alpha:.0, x:the_mcX+the_mcWidth, y:the_mcY-the_mcHeight, rotationY:179});
			TweenMax.to (contentsArray[3], 0, {x:-the_mcWidth});
			TweenMax.to (placementArray[3], 0, {alpha:.0, x:the_mcX, y:the_mcY, rotationY:179});
			TweenMax.to (placementArray[4], 0, {alpha:.0, x:the_mcX+40, y:the_mcY, z:100, rotationY:0, ease:Sine.easeOut});
			TweenMax.to (contentsArray[5], 0, {y:-the_mcHeight});
			TweenMax.to (placementArray[5], 0, {alpha:.0, x:the_mcX+the_mcWidth, y:the_mcY+the_mcHeight, rotationY:179});
			TweenMax.to (contentsArray[6], 0, {x:-the_mcWidth});
			TweenMax.to (placementArray[6], 0, {alpha:.0, x:the_mcX, y:the_mcY+the_mcHeight, rotationY:179});
			TweenMax.to (placementArray[7], 0, {alpha:.0, x:the_mcX, y:the_mcY+the_mcHeight, rotationX:179});
			TweenMax.to (placementArray[8], 0,{alpha:.0, y:the_mcY+the_mcHeight, x:the_mcX+the_mcWidth, rotationX:179});
			TweenMax.to (placementArray[4], 2, {alpha:finalPlacementAlpha,x:the_mcX, y:the_mcY, z:0, rotationY:0, ease:Sine.easeInOut, onComplete:initOpenAnime});
		}
		/**
		 * init the open animations
		 */		
		private function initOpenAnime(){
			for(var i:uint = 1; i <= 4; i++){
				var addOpenItemIteration='addOpenItem'+String(i);
				this[addOpenItemIteration]();
			}
		}
		private function addOpenItem1(){
			TweenMax.to (placementArray[1], .5, {alpha:finalPlacementAlpha, rotationX:0, ease:Sine.easeInOut, onComplete:addOpenItem1_2});
		}
		private function addOpenItem2(){
			TweenMax.to (placementArray[5], .7, {alpha:finalPlacementAlpha, rotationY:0, ease:Sine.easeInOut, onComplete:addOpenItem2_2});
		}
		private function addOpenItem3(){
			TweenMax.to (placementArray[7], .9, {alpha:finalPlacementAlpha, rotationX:0, ease:Sine.easeInOut, onComplete:addOpenItem2_3});
		}
		private function addOpenItem4(){
			TweenMax.to (placementArray[3], 1.1, {alpha:finalPlacementAlpha, rotationY:0, ease:Sine.easeInOut, onComplete:addOpenItem2_4}); 
		}
		/**
		 * part two animations
		 */		
		private function addOpenItem1_2(){
			TweenMax.to (placementArray[2], 1, {alpha:finalPlacementAlpha, rotationY:0, ease:Sine.easeOut});
		}
		private function addOpenItem2_2(){
			TweenMax.to (placementArray[8], 1.1, {alpha:finalPlacementAlpha, rotationX:0, ease:Sine.easeOut});
		}
		private function addOpenItem2_3(){
			TweenMax.to (placementArray[6], 1.2, {alpha:finalPlacementAlpha, rotationY:0, ease:Sine.easeOut});
		}
		private function addOpenItem2_4(){
			TweenMax.to (placementArray[0], 1.4, {alpha:finalPlacementAlpha, rotationX:0, ease:Sine.easeOut});
		}
		/**
		 * event actions
		 */		
		private function placementTargetOver(overEvent:Event){
			overEvent.currentTarget.parent.setChildIndex(overEvent.currentTarget, overEvent.currentTarget.parent.numChildren - 1);
			buttonStates.buttonStatesInterface(overEvent.currentTarget as Sprite, 'OverState');
		}
		private function placementTargetOut(outEvent:Event){
			buttonStates.buttonStatesInterface(outEvent.currentTarget as Sprite, 'OutState');
		}
		private function placementTargetDown(downEvent:Event){
			buttonStates.buttonStatesInterface(downEvent.currentTarget as Sprite, 'DownState');
		}
		private function placementTargetUp(upEvent:Event){
			buttonStates.buttonStatesInterface(upEvent.currentTarget as Sprite, 'UpState');
			getClickedItem(upEvent);
		}
		/**
		 * add clicked item
		 */		
		private function getClickedItem(upEvent:Event):void {
			TweenMax.to (sectionHeaderTextHolder, .5, {alpha:.7, y:-152, z:-25, ease:Sine.easeInOut});
			for(var i:uint = 0; i < placementArray.length; i++){
				if(upEvent.currentTarget.name == placementArray[i].name){
					var currentItem:Object = upEvent.currentTarget;
					theItemView = new ItemView();
					theItemView.itemViewInterface(sectionName, i, stageReference, currentItem);
					theItemView.setAboutTextFieldFinalX(aboutTextFieldFinalX)
					theItemView.setAboutButtonPositions(aboutButtonRotation, aboutButtonX);
					itemViewHolder = theItemView.getItemView();
					addItemView();
				}
			}
		}
		private function addItemView():void {
			var xPlacement:int = -20
			var yPlacement:int = 20
			TweenMax.to (itemViewHolder, 0,{x:xPlacement, y:yPlacement});
			returnedObject.addChild(itemViewHolder);
			theItemView.closeButtonHolder.addEventListener ( MouseEvent.MOUSE_UP, closeButtonUp, false);
		}
		private function closeButtonUp(upEvent:Event){
			if(upEvent.currentTarget == theItemView.closeButtonHolder) {
				TweenMax.to (sectionHeaderTextHolder, .5, {alpha:1, y:-105, z:0, ease:Sine.easeOut});
			}
		}
	}
}