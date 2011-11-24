package com.cw.utilities{
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// Imports
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	import flash.display.Sprite;
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	// to view all the contents of a MC by type pass the MC's ref to targetMC
	//:::::::::::::::::::::::::::::::::::::::::::::::::
	public class MovieClipChildren{
		public function MovieClipChildren(targetMC:Sprite){
			var target_mc:Sprite = targetMC;
			trace ('\t|\t The contents of ' + target_mc.name +' are:');
			for (var i:uint = 0; i < target_mc.numChildren; i++){
				trace ('\t|\t ' +i+'.\t name:' + target_mc.getChildAt(i).name + '\t type:' + typeof (target_mc.getChildAt(i))+ '\t' + target_mc.getChildAt(i));
			}
		}
	}
}