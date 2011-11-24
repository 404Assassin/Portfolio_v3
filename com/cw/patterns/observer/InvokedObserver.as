package com.cw.patterns.observer{
	/**
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 * Invoked Observer Class that two or more classes, can reference the same 
	 * instance of, to share events through.
	 * language version: ActionScript 3.0
	 * player version: Flash 10.0
	 * author: Christian Worley
	 * created: 01/2011
	 * TODO: create an extendable Observer
	 * ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 */
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	// Class characteristics
	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public class InvokedObserver{
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Private Variables
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		private var observers:Array;
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		// Constructor
		//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		public function InvokedObserver(){
			observers = new Array();
		}
		/**
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 * Adds an observer to the list of observers. The param 'observer' 
		 * being a 'this' ref of the observering class to be added.
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		public function addObserver (observer:IInvokedObserver):void {
			if (observers.indexOf(observer) == -1) {
				observers.push(observer);
			}
		}
		/**
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 * Removes an observer from the list of observers. The param 'observer' 
		 * being a 'this' ref of the observering class to be removed.
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		public function removeObserver (observer:IInvokedObserver):void {
			var arrayPosition = observers.indexOf(observer);
			if (observers.indexOf(observer) != -1) {
				observers.splice(arrayPosition, 1);
			}
		}
		/**
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 * Notify all observers that the subject has changed and pass the 
		 * infoObj param.
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		public function notifyObservers (infoObj:Object):void {
			var observersSnapshot:Array = observers.slice(0);
			for (var i:Number = observersSnapshot.length-1; i >= 0; i--) {
				observersSnapshot[i].update(this, infoObj);
			}
		}
		/**
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 * Clears all observers from the array
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		public function clearObservers ():void {
			observers = new Array();
		}
		/**
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 * Returns the number of observers for this subject.
		 * :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		 */
		public function countObservers ():Number {
			return observers.length;
		}
	}
}