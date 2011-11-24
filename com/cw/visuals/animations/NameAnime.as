package com.cw.visuals.animations{
	/**
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * NameAnime class - animes for site name
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: Christian Worley
	 * created: 09/2011
	 * TODO:
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.patterns.observer.IInvokedObserver;
	import com.cw.patterns.observer.InvokedObserver;
	import com.cw.utilities.Observable;
	import com.cw.utilities.Observer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class NameAnime implements INameAnime, IInvokedObserver{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var contactObserver:InvokedObserver;
		private var placementTarget:MovieClip
		private var xLocation:int;
		private var yLocation:int;
		private var nameAnimeMC:nameAnime = new nameAnime();
		private var rotationAmount:int = 180;
		private var zOverAmount:int = 10;
		private var zOffAmount:int = 0;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function NameAnime(){};
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function nameAnimeInterface(placementTarget:MovieClip, xLocation:int, yLocation:int):void{
			this.placementTarget = placementTarget;
			this.xLocation = xLocation;
			this.yLocation = yLocation;
			placeNameAnimeMC();
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Method interface for InvokedObserver instance reference.
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function observableInstanceRef(contactObserver:InvokedObserver):void{
			this.contactObserver = contactObserver;
			contactObserver.addObserver(this)
		}
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Method for InvokedObserver referenced instance updates.
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function update(o:InvokedObserver, infoObj:Object):void{
			var contactState = infoObj;
			theContactState(contactState);
		}
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Methods
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private function theContactState(contactState:String):void{
			if(contactState == 'contactOff'){
				contactState = 'contactOn';
				contactOn()
			}else if (contactState == 'contactOn'){
				contactState = 'contactOff'
				contactOff()
			}else if (contactState == 'portfolioOn'){
				buttonOff()
			}else if (contactState == 'portfolioOff'){
				buttonOn()
			}
		}
		private function contactOn():void{
			TweenMax.to (nameAnimeMC, 1.75, {delay:.25, y:-175, rotationY:0, ease:Sine.easeInOut});
		}
		private function contactOff():void{
			nameAnimeMCOverOpen(null)
			TweenMax.to (nameAnimeMC, 1.75, {delay:1.25, y:-215});
			TweenMax.to (nameAnimeMC, 1, {delay:.25, rotationY:-180, ease:Sine.easeInOut, onComplete:nameAnimeMCOverClose, onCompleteParams:[null]});
			//nameAnimeMCOverClose(null)
		}
		private function buttonOn():void{
			TweenMax.to (nameAnimeMC, 1.75, {delay:.25, y:-175, rotationY:0, ease:Sine.easeInOut});
		}
		private function buttonOff():void{
			nameAnimeMCOverOpen(null)
			TweenMax.to (nameAnimeMC, 1.75, {delay:1.25, y:-215});
			TweenMax.to (nameAnimeMC, 1, {delay:.25, rotationY:180, ease:Sine.easeInOut, onComplete:nameAnimeMCOverClose, onCompleteParams:[null]});
		}
		private function placeNameAnimeMC():void{
			placementTarget.addChild(nameAnimeMC);
			TweenMax.to (nameAnimeMC.nameContentMC, 0, {color:0x333333, dropShadowFilter:{color:0x000000, alpha:1, blurX:5, blurY:5, distance:2, inner:true}, ease:Sine.easeOut});
			nameAnimeMC.x = xLocation
			nameAnimeMC.y = yLocation
			TweenMax.to (nameAnimeMC, 0, {delay:7, onComplete:nameAnimeMCOverAutoClose});
		}
		private function nameAnimeMCOverAutoClose(){
			nameAnimeMC.nameContentMC.eventMC.buttonMode = true;
			nameAnimeMC.nameContentMC.eventMC.addEventListener (MouseEvent.MOUSE_OVER, nameAnimeMCOverOpen);
			nameAnimeMC.nameContentMC.eventMC.addEventListener (MouseEvent.MOUSE_OUT, nameAnimeMCOverClose);
			var myEventPH
			nameAnimeMCOverClose(myEventPH);
		}
		private function nameAnimeMCOverOpen(nameAnimeMCOverOpenEvent:Event){
/*			TweenMax.to (nameAnimeMC.nameContentMC, .25, {color:0x333333, dropShadowFilter:{color:0x000000, alpha:0, blurX:4, blurY:4, distance:0, inner:true}, ease:Sine.easeOut});*/
			TweenMax.to (nameAnimeMC, .75, {delay:.25, alpha:.75, z:zOverAmount, dropShadowFilter:{color:0x000000, alpha:1, blurX:zOverAmount, blurY:zOverAmount, distance:zOverAmount}, ease:Sine.easeInOut});
			TweenMax.to (nameAnimeMC.nameContentMC.eventMC, .75, {width:540, ease:Sine.easeInOut});
			TweenMax.to (nameAnimeMC.nameContentMC.Christian, .75, {x:-268, ease:Sine.easeInOut});
			TweenMax.to (nameAnimeMC.nameContentMC.Worley, .75, {x:-140, ease:Sine.easeInOut});
			TweenMax.to (nameAnimeMC.nameContentMC.maskDevelopment, .75, {x:-41, ease:Sine.easeInOut});
			TweenMax.to (nameAnimeMC.nameContentMC.Development, .75, {x:-39, ease:Sine.easeInOut});
			TweenMax.to (nameAnimeMC.nameContentMC.andSymbol, .75, {x:147, ease:Sine.easeInOut});
			TweenMax.to (nameAnimeMC.nameContentMC.maskDesign, .75, {x:181, ease:Sine.easeInOut});
			TweenMax.to (nameAnimeMC.nameContentMC.Design, .75, {x:177, ease:Sine.easeInOut});
		}
		private function nameAnimeMCOverClose(nameAnimeMCOverCloseEvent:Event){
/*			TweenMax.to (nameAnimeMC.nameContentMC, .25, {delay:1.25, color:0x333333, dropShadowFilter:{color:0x000000, alpha:1, blurX:4, blurY:4, distance:4, inner:true}, ease:Sine.easeOut});*/
			TweenMax.to (nameAnimeMC, 1.25, {alpha:.75, z:zOffAmount, dropShadowFilter:{color:0x000000, alpha:zOffAmount, blurX:zOffAmount, blurY:zOffAmount, distance:zOffAmount}, ease:Sine.easeOut});
			TweenMax.to (nameAnimeMC.nameContentMC.eventMC, 1.5, {width:140, ease:Sine.easeOut});
			TweenMax.to (nameAnimeMC.nameContentMC.Christian, 1.5, {x:-57, ease:Sine.easeOut});
			TweenMax.to (nameAnimeMC.nameContentMC.Worley, 1.5, {x:-39, ease:Sine.easeOut});
			TweenMax.to (nameAnimeMC.nameContentMC.maskDevelopment, 1.5, {x:-297, ease:Sine.easeOut});
			TweenMax.to (nameAnimeMC.nameContentMC.Development, 1.5, {x:-5, ease:Sine.easeOut});
			TweenMax.to (nameAnimeMC.nameContentMC.andSymbol, 1.5, {x:13, ease:Sine.easeOut});
			TweenMax.to (nameAnimeMC.nameContentMC.maskDesign, 1.5, {x:-130, ease:Sine.easeOut});
			TweenMax.to (nameAnimeMC.nameContentMC.Design, 1.5, {x:35, ease:Sine.easeOut});
		}
	}
}