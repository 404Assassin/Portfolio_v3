package com.cw.visuals.contentArea.states{
	
	/**
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * ContentArea State Class invokes the appropriate state class for any of 
	 * the sections given states.
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: Christian Worley
	 * created: 09/2011
	 * TODO:
	 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	import com.cw.data.forms.ContactForm;
	import flash.display.MovieClip;
	import flash.display.Stage;
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class ContentAreaState{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Static Constants
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public static const STATE_INIT_BUILD:String = 'contactInitBuild';
		public static const STATE_COLOR_CHANGE:String = 'contactNewColor';
		public static const STATE_CONTACT_ON:String = 'contactOn';
		public static const STATE_CONTACT_OFF:String = 'contactOff';
		public static const STATE_PORTFOLIO_ON:String = 'portfolioOn';
		public static const STATE_PORTFOLIO_OFF:String = 'portfolioOff';
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var state:IContentAreaState;
		private var stageReference:Stage;
		private var stateTarget:MovieClip
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function ContentAreaState(){};
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Public Interfaces
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function contentAreaStateInterface(stageReference:Stage, stateTarget:MovieClip):void{
			this.stageReference = stageReference;
			this.stateTarget = stateTarget;
		}
		public function setState(stateName:String):void{
			switch(stateName){
				case 'contactInitBuild':
					state = new StateInitBuild(stageReference, stateTarget);
					break;
				case 'contactOn':
					state = new StateContactOn(stageReference, stateTarget);
					break;
				case 'contactOff':
					state = new StateContactOff(stageReference, stateTarget);
					break;
				case 'portfolioOn':
					state = new StatePortfolioOn(stageReference, stateTarget);
					break;
				case 'portfolioOff':
					state = new StatePortfolioOff(stageReference, stateTarget);
					break;
				case 'contactNewColor':
					state = new StateColorChange(stageReference, stateTarget);
					break;
			}
		}
	}
}