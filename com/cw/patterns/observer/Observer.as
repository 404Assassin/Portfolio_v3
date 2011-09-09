package com.cw.patterns.observer{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	public class Observer implements IObserver{
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private var currentValue:String;
		private var subscribersName:String;
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Internal Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		//internal var subscribersName:String;
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		public function observer(subscribersName:String):void{
			trace('::::Observer::::');
			trace(subscribersName + ' has subscribed');
			this.subscribersName = subscribersName;
			//subscribersName.subscribeObserver(this);
		}
		public function passOn():String{
			return currentValue
		}
		public function update(currentValue:String):void{
			this.currentValue = currentValue;
			passOn();
		}
	}
}