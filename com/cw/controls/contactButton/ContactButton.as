package com.cw.controls.contactButton{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.controls.dynamicButton.DynamicButton;
	import flash.events.Event;
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	public class ContactButton extends DynamicButton {
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		public function ContactButton(){
			trace('!!!!!!!!!!!!!!!!!!!!!hey');
		}
		override protected function placementTargetOver(overEvent:Event){
			buttonStates.buttonStatesInterface(button.buttonBG, 'OverState');
			buttonStates.buttonStatesInterface(button.buttonText, 'OverState');
			trace('!!!!!!!!!!!!!!!!!!!!!hey');
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
		}
	}
}