package com.cw.visuals.color{
	import flash.display.Sprite;
	public interface IApplyColorChange{
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		// params for ApplyColorChange are; the colorChangeTarget:Sprite, and the colorHexValue:uint to be applied to colorChangeTarget
		//:::::::::::::::::::::::::::::::::::::::::::::::::
		function ApplyColorTransform(colorChangeTarget:Sprite, colorHexValue:uint);
	}
}