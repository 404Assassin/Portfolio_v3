package com.cw.visuals.animations{
	/*
	-=] NameAnime class - animes for site name [=-
	-=] language version ActionScript 3.0 [=-
	-=] player version Flash 10.0 [=-
	-=] author Christian Worley [=-
	-=] created 09/2011 [=-
	-=] TODO;  [=-
	*/
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*;
	import com.greensock.easing.*;
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	public class NameAnime implements INameAnime{
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private var placementTarget:MovieClip
		private var xLocation:int;
		private var yLocation:int;
		private var nameAnimeMC:nameAnime = new nameAnime();
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		public function NameAnime(){
		}
		public function nameAnimeInterface(placementTarget:MovieClip, xLocation:int, yLocation:int):void{
			this.placementTarget = placementTarget;
			this.xLocation = xLocation;
			this.yLocation = yLocation;
			placeNameAnimeMC();
		}
		private function placeNameAnimeMC():void{
			placementTarget.addChild(nameAnimeMC);
			nameAnimeMC.x = xLocation
			nameAnimeMC.y = yLocation
			TweenMax.to (nameAnimeMC, 0, {delay:7, onComplete:nameAnimeMCOverAutoClose});
		}
		private function nameAnimeMCOverAutoClose(){
			trace('::::>'+nameAnimeMC);
			nameAnimeMC.nameContentMC.eventMC.addEventListener (MouseEvent.MOUSE_OVER, nameAnimeMCOverOpen);
			nameAnimeMC.nameContentMC.eventMC.addEventListener (MouseEvent.MOUSE_OUT, nameAnimeMCOverClose);
			var myEventPH
			nameAnimeMCOverClose(myEventPH);
		}
		private function nameAnimeMCOverOpen(nameAnimeMCOverOpenEvent:Event){
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