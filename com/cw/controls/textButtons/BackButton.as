package com.cw.controls.textButtons{
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.controls.dynamicButton.AbstractDynamicButton;
	import com.cw.patterns.observer.IInvokedObserver;
	import com.cw.patterns.observer.InvokedObserver;
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.greensock.loading.*;
	
	import flash.events.Event;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class BackButton extends AbstractDynamicButton implements IInvokedObserver{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var contactState:String;
		private var contactObserver:InvokedObserver;
		private var infoObj:Object;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function BackButton(){
			buttonInitState();
		}
		private function buttonInitState(){
			TweenMax.to (button, 0,{alpha:0, rotationY:180, visible:false})
		}
		public function observableInstanceRef(contactObserver:InvokedObserver):void{
			this.contactObserver = contactObserver;
			contactObserver.addObserver(this)
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
			if(infoObj == 'contactOn'){
				contactState = 'contactOff';
			}
			if(infoObj == 'portfolioOn'){
				contactState = 'portfolioOff';
			}
			notifyTheObservers();
		}
		private function notifyTheObservers():void{
			trace('@ back contactState is '+contactState);
			if(contactState == 'contactOff'){
				contactObserver.notifyObservers(contactState);
				contactState = 'contactOn';
			}else if (contactState == 'contactOn'){
				contactObserver.notifyObservers(contactState);
				contactState = 'contactOff'
			}else if (contactState == 'portfolioOn'){
				contactObserver.notifyObservers(contactState);
				contactState = 'portfolioOff'
			}else if (contactState == 'portfolioOff'){
				contactObserver.notifyObservers(contactState);
				contactState = 'portfolioOn'
			}
		}
		public function update(o:InvokedObserver, infoObj:Object):void{
			trace('<<<<<<<<<<<<<<<>>>>>>>>>>>>>>> @ BackButton ' + o + ' ' + infoObj);
			this.infoObj = infoObj;
			if(infoObj == 'contactOff'){
				backOff()
			}else if (infoObj == 'contactOn'){
				backOn()
			}else if (infoObj == 'portfolioOn'){
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