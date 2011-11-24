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
	public class ContactButton extends AbstractDynamicButton implements IInvokedObserver{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var contactState:String;
		private var contactObserver:InvokedObserver;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function ContactButton(){
			buttonInitState();
		}
		private function buttonInitState(){
			TweenMax.to (button, 0,{alpha:1, rotationY:0})
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
			contactState = 'contactOn';
			notifyTheObservers();
		}
		private function notifyTheObservers():void{
			if(contactState == 'contactOff'){
				contactObserver.notifyObservers(contactState);
				contactState = 'contactOn';
			}else if (contactState == 'contactOn'){
				contactObserver.notifyObservers(contactState);
				contactState = 'contactOff'
			}
		}
		public function update(o:InvokedObserver, infoObj:Object):void{
			trace('<<<<<<<<<<<<<<<>>>>>>>>>>>>>>> @ ContactButton ' + o + ' ' + infoObj);
			if(infoObj == 'contactOff'){
				buttonOn()
			}else if (infoObj == 'contactOn'){
				buttonOff()
			}else if (infoObj == 'portfolioOn'){
				buttonOff()
			}else if (infoObj == 'portfolioOff'){
				buttonOn()
			}
		}
/*		private function contactOn(){
			TweenMax.to (button, .75, {delay:.75, alpha:1, rotationY:0, ease:Sine.easeInOut});
		}*/
		private function buttonOn(){
			TweenMax.to (button, 0, {rotationY:0, visible:true, onComplete:buttonAlpha});
		}
		private function buttonAlpha(){
			TweenMax.to (button, .75, {delay:.75, alpha:1, ease:Sine.easeInOut});
		}
		private function buttonOff(){
			TweenMax.to (button, .75, {delay:.75, alpha:0, visible:false, rotationY:0, ease:Sine.easeInOut})
		}
	}
}