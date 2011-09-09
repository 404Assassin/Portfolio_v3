package com.cw.patterns.observer{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Subject Interface
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	public interface ISubject{
		function subscribeObserver(o:Observer):void;
		function unsubscribeObserver(o:Observer):void;
		function notifyObserver(currentValue:String):void;
	}
}