package com.cw.patterns.observer{
	public class Subject implements ISubject{
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		private var currentValue:String;
		private var observers:Array;
		private var duplicate:Boolean;
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		public function Subject(){
			trace('::::Subject::::');
			observers = new Array;
		}
		public function subscribeObserver(obserNow:Observer):void{
			duplicate = false;
			for(var ob = 0; ob < observers.length; ob++){
				if (observers[ob] == obserNow){
					duplicate = true;
					trace(observers[ob].subscribersName + ' already a subscriber. \n');
				}
				if(! duplicate){
					observers.push(obserNow);
				}
			}
		}
		public function unsubscribeObserver(obserNow:Observer):void{
			for (var ob:int = 0; ob < observers.length; ob++){
				if (observers[ob] == obserNow){
					observers.splice(ob, 1);
					break;
				}
			}
		}
		public function notifyObserver(currentValue:String):void{
			for ( var notify in observers){
				observers[notify].update (currentValue);
				trace('Observers ' + notify + ' the current state is ' + currentValue);
			}
		}
		public function setState (currentValue:String):void{
			this.currentValue = currentValue;
			notifyObserver(currentValue);
		}	
	}
}