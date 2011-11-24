package com.cw.controls.textButtons{
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.controls.dynamicButton.AbstractDynamicButton;
	import com.cw.patterns.observer.IInvokedObserver;
	import com.cw.patterns.observer.InvokedObserver;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	//import com.greensock.loading.*;
	import flash.events.Event;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class PortfolioBackButton extends AbstractDynamicButton implements IInvokedObserver{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var contactState:String;
		private var portfolioObserver:InvokedObserver;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function PortfolioBackButton(){
			buttonInitState();
		}
		private function buttonInitState(){
			TweenMax.to (button, 0,{alpha:0, rotationY:180, visible:false})
		}
		public function observableInstanceRef(portfolioObserver:InvokedObserver):void{
			this.portfolioObserver = portfolioObserver;
			portfolioObserver.addObserver(this)
		}
		override protected function placementTargetOver(overEvent:Event){
			buttonStates.buttonStatesInterface(button.buttonBG, 'OverState');
			buttonStates.buttonStatesInterface(button.buttonText, 'OverState');
		}
		override protected function placementTargetOut(outEvent:Event){
			buttonStates.buttonStatesInterface(button.buttonBG, 'OutState');
			buttonStates.buttonStatesInterface(button.buttonText, 'OutState');
		}
		override protected function placementTargetDown(downEvent:Event){
			buttonStates.buttonStatesInterface(button.buttonBG, 'DownState');
			buttonStates.buttonStatesInterface(button.buttonText, 'DownState');
		}
		override protected function placementTargetUp(upEvent:Event){
			buttonStates.buttonStatesInterface(button.buttonBG, 'UpState');
			buttonStates.buttonStatesInterface(button.buttonText, 'UpState');
			contactState = 'portfolioOff';
			notifyTheObservers();
		}
		private function notifyTheObservers():void{
			trace('@ back contactState is '+contactState);
			if(contactState == 'portfolioOff'){
				portfolioObserver.notifyObservers(contactState);
				contactState = 'portfolioOn';
			}else if (contactState == 'portfolioOn'){
				portfolioObserver.notifyObservers(contactState);
				contactState = 'portfolioOff'
			}	
		}
		public function update(o:InvokedObserver, infoObj:Object):void{
			trace('<<<<<<<<<<<<<<<>>>>>>>>>>>>>>> @ portfoliBoackButton ' + o + ' ' + infoObj);
			if (infoObj == 'portfolioOn'){
				backOn()
			}else if (infoObj == 'portfolioOff'){
				backOff()
			}
		}
		private function backOn(){
			TweenMax.to (button, 0, {rotationY:180, visible:true, onComplete:backAlpha});
		}
		private function backAlpha(){
			TweenMax.to (button, .75, {delay:.75, alpha:1, ease:Sine.easeInOut});
		}
		private function backOff(){
			TweenMax.to (button, .75, {delay:.75, alpha:0, rotationY:180, visible:false, ease:Sine.easeInOut})
		}
	}
}