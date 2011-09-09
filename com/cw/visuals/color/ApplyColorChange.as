package com.cw.visuals.color{
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	
	public class ApplyColorChange implements IApplyColorChange{
		public function ApplyColorChange(){
		}
		
		public function ApplyColorTransform(colorChangeTarget:Sprite, colorHexValue:uint){
			var newColorTransform:ColorTransform = colorChangeTarget.transform.colorTransform;
			newColorTransform.color = colorHexValue
			colorChangeTarget.transform.colorTransform = newColorTransform;
		}
	}
}