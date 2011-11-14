package com.cw.visuals.contentArea{
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Class discription: public class ItemView
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: christian
	 * contact: christian@worleydev.com
	 * created: Oct 30, 2011
	 * TODO;  
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.controls.dynamicButton.CDynamicButton;
	import com.cw.utilities.preloaders.CFourBarPreloader;
	import com.cw.visuals.flipOpen3D.CFlipOpen3Dv1;
	import com.cw.visuals.flipOpen3D.CFlipOpen3Dv2;
	import com.cw.visuals.flipOpen3D.CFlipOpen3Dv3;
	import com.cw.visuals.flipOpen3D.CFlipOpen3Dv5;
	import com.cw.visuals.shapeCreators.CreateShape;
	import com.greensock.TweenMax;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Sine;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.greensock.loading.data.LoaderMaxVars;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.FullScreenEvent;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class ItemView{
		
		//public var closeButton:Sprite;
		public var closeButtonHolder:Sprite = new Sprite();
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var currentItem:Object;
		private var displayContainer:MovieClip;
		private var stageReference:Stage;
		private var stageWidth:int;
		private var stageHeight:int;
		private var imageName:String = 'ph_';
		private var returnedObject:Sprite = new Sprite();
		private var section:String;
		private var sectionIteration:int;
		private var sectionName:String;
		private var theCFourBarPreloader:CFourBarPreloader;
		private var sampleImage:String;
		private var backgroundWidth:Number;
		private var backgroundHeight:Number;
		private var itemBackgroundBorder:int = 20;
		private var startX:Number;
		private var startY:Number;
		private var theCDynamicButton:CDynamicButton;
		private var theImage:Bitmap
		private var linkButton:Sprite
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function ItemView(){};
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function itemViewInterface(sectionName:String, sectionIteration:int, stageReference:Stage, currentItem:Object):void{
			this.sectionName = sectionName;
			this.sectionIteration = sectionIteration;
			this.imageName = imageName;
			this.stageReference = stageReference;
			this.stageWidth = stageReference.stageWidth;
			this.stageHeight = stageReference.stageHeight;
			this.currentItem = currentItem;
			
			trace("@ ItemView.itemViewInterface(sectionName, sectionIteration, stageReference, currentItem) " + '\n' + currentItem.width + '\n' + currentItem.x + '\n' + currentItem.y + '\n' + sectionIteration);
			
			
			setImageName();
		}
		public function getItemView():Sprite{
			return returnedObject;
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Keep this incase we want to add a DL here
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		/*		private function createName():void {
		section = sectionName + sectionIteration;
		loadExternalAssets();
		}
		private function loadExternalAssets():void{
		addProgressBar()
		LoaderMax.activate([ImageLoader]);
		var sectionQueue:LoaderMax = new LoaderMax({name:section, onProgress:progressHandler, onComplete:completeHandler});
		sectionQueue.append( new XMLLoader("./xml/siteAssets.xml", {name:"xmlSiteAssets"}) );
		sectionQueue.load();
		}
		private function addProgressBar():void {
		theCFourBarPreloader = new CFourBarPreloader();
		theCFourBarPreloader.setTheProgressBars();
		var preloaderHolder:Sprite = theCFourBarPreloader.getTheProgressBars();
		returnedObject.addChild(preloaderHolder);
		var barPlacementX:int = stageWidth * .5;
		var barPlacementY:int = stageHeight * .5;
		TweenMax.to (returnedObject, 0, {alpha:1, x:0, y:0});
		}
		private function progressHandler(loaderEvent:LoaderEvent):void {
		trace("@ ItemView.progressHandler(loaderEvent) "+ loaderEvent.target.progress);
		theCFourBarPreloader.progressHandlerInterface(loaderEvent);
		}
		private	function completeHandler(event:LoaderEvent):void {
		trace("@ ItemView.completeHandler(event) "+ event);
		theCFourBarPreloader.progressCompleteInterface();
		addItemView();
		}*/
		private function setImageName():void {
			sampleImage = imageName + '0'
			theImage = LoaderMax.getContent(sampleImage).rawContent;
			backgroundWidth = (theImage.width * 3) + itemBackgroundBorder;
			backgroundHeight = (theImage.height * 3) + itemBackgroundBorder;
			setStartPosition();
			itemBackground(theImage);
		}
		private function setStartPosition():void{
			var itemWidth:Number = currentItem.width;
			var itemHeight:Number = currentItem.height;
			if(sectionIteration == 0){
				startX = currentItem.x+20;
				startY = currentItem.y-itemHeight-20;
			}else if(sectionIteration == 1){
				startX = currentItem.x+20;
				startY = currentItem.y-itemHeight-20;
			}else if(sectionIteration == 2){
				startX = currentItem.x+20;
				startY = currentItem.y-20;
			}else if(sectionIteration == 3){
				startX = currentItem.x-itemWidth+20;
				startY = currentItem.y-20;
			}else if(sectionIteration == 4){
				startX = currentItem.x+20;
				startY = currentItem.y-20;
			}else if(sectionIteration == 5){
				startX = currentItem.x+20;
				startY = currentItem.y-itemHeight-20;
			}else if(sectionIteration == 6){
				startX = currentItem.x-itemWidth+20;
				startY = currentItem.y-20;
			}else if(sectionIteration == 7){
				startX = currentItem.x+20;
				startY = currentItem.y-20;
			}else if(sectionIteration == 8){
				startX = currentItem.x+20;
				startY = currentItem.y-20;
			}
		}
		private function itemBackground(theImage:Bitmap):void{
			var itemBackgroundHolder:MovieClip = new MovieClip();
			returnedObject.addChild(itemBackgroundHolder);
			var backgroundX:Number = theImage.width + (itemBackgroundBorder* .5);
			var backgroundY:Number = theImage.height + (itemBackgroundBorder* .5);
			var background:CreateShape = new CreateShape();
			background.draw(CreateShape.SQUARE_FILLED, itemBackgroundHolder, 0,0,backgroundWidth,backgroundHeight)
			var startWidth:Number = currentItem.width;
			var startHeight:Number = currentItem.height;
			TweenMax.to (itemBackgroundHolder, 0, {alpha:.1, x:startX, y:startY, width:startWidth, height:startHeight});
			TweenMax.to(itemBackgroundHolder, .5, {alpha:.5, x:-backgroundX, y:-backgroundY, z:-25, width:backgroundWidth, height:backgroundHeight, dropShadowFilter:{color:0x000000, alpha:.5, blurX:15, blurY:15, distance:25}, ease:Sine.easeOut, 
				onComplete:addItemView
			});
		}
		private function addItemView():void{
			var theCFlipOpen3Dv1:CFlipOpen3Dv3 = new CFlipOpen3Dv3();
			theCFlipOpen3Dv1.setCFlip3D('ph_', 100, 100);
			var motionDirectory:Sprite = theCFlipOpen3Dv1.getCFlipOpen3D();
			returnedObject.addChild(motionDirectory);
			TweenMax.to(motionDirectory, 0, {alpha:0, z:-35});
			TweenMax.to(motionDirectory, .25, {alpha:1, z:-30, dropShadowFilter:{color:0x000000, alpha:.5, blurX:5, blurY:5, distance:5}, ease:Sine.easeOut});
			addButtons();
		}
		private function addButtons():void {
			addCloseButton();
			
			stageReference.addEventListener( FullScreenEvent.FULL_SCREEN, fullScreenHandler );
			fullScreenHandler(undefined)
		}
		private function fullScreenHandler(event:FullScreenEvent):void {
			if (stageReference.displayState == StageDisplayState.NORMAL) {
				addLinkButton();
			} else if (stageReference.displayState == StageDisplayState.FULL_SCREEN) { 
				TweenMax.to (linkButton, .5, {alpha:0, z:0, onComplete:removeLinkButton});
			}
		}
		private function addCloseButton():void{
			theCDynamicButton = new CDynamicButton();
			theCDynamicButton.buttonInterface('<bttn>CLOSE</bttn>')
			var closeButton:Sprite = theCDynamicButton.getTheButton();
			//closeButton = theCDynamicButton.getTheButton();
			var closeButtonX = (theImage.width *.5);
			var closeButtonY = (backgroundHeight*.5)+20 ;
			TweenMax.to (closeButton, 0, {alpha:1, x:closeButtonX, y:closeButtonY, z:-30});
			closeButtonHolder.addChild(closeButton);
			returnedObject.addChild(closeButtonHolder);
			closeButton.addEventListener (MouseEvent.MOUSE_UP, closeButtonUp);
		}
		private function closeButtonUp(upEvent:Event){
			TweenMax.to (returnedObject, 1.25, {alpha:0, z:100, visible:false, onComplete:destroy});
		}
		private function destroy():void{
			returnedObject = null
		}
		private function addLinkButton():void{
			theCDynamicButton = new CDynamicButton();
			//var linkButtonHolder:MovieClip = new MovieClip();
			theCDynamicButton.buttonInterface('<bttn>VIEW</bttn>')
			linkButton = theCDynamicButton.getTheButton();
			var linkButtonX = (theImage.width *.5);
			var linkButtonY = -theImage.height-7;
			TweenMax.to (linkButton, 0, {alpha:0, x:linkButtonX, y:linkButtonY, z:-30});
			TweenMax.to (linkButton, .5, {alpha:1});
			returnedObject.addChild(linkButton);
			linkButton.addEventListener (MouseEvent.MOUSE_UP, linkButtonUp);
		}
		private function linkButtonUp(upEvent:Event):void{
			
			
		}
		private function removeLinkButton():void{
			returnedObject.removeChild(linkButton);
			linkButton = null
		}
	}
}

