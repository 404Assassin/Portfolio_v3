package com.cw.controls.textButtons{
	/**
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * ContentArea Class
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
	public class SubmitButton extends AbstractDynamicButton implements IInvokedObserver{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var contactState:String;
		private var contactObserver:InvokedObserver;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function SubmitButton(){
			buttonInitState();
		}
		private function buttonInitState(){
			TweenMax.to (button, 0,{alpha:1, rotationY:180})
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
			contactState = 'submitClicked';
			notifyTheObservers();
		}
		private function notifyTheObservers():void{
			if(contactState == 'contactOff'){
				contactObserver.notifyObservers(contactState);
				contactState = 'submitClicked';
			}else if (contactState == 'submitClicked'){
				contactObserver.notifyObservers(contactState);
				contactState = 'contactOff'
			}
		}
		public function update(o:InvokedObserver, infoObj:Object):void{
			trace('<<<<<<<<<<<<<<<>>>>>>>>>>>>>>> @ SubmitButton ' + o + ' ' + infoObj);
/*			if(infoObj == 'contactOff'){
				contactOff()
			}else if (infoObj == 'submitClicked'){*/
				submitClicked()
/*			}*/
		}
		private function submitClicked(){
			TweenMax.to (button, .75, {delay:.75, alpha:0, rotationY:0, ease:Sine.easeInOut});
		}

	}
}