package com.cw.visuals.filters{
	
		import flash.display.Sprite;
		import flash.events.Event;
		import flash.events.MouseEvent;
		import flash.filters.BitmapFilter;
		import flash.filters.BitmapFilterQuality;
		import flash.filters.DropShadowFilter;
		
		public class DropShadowFilterExample extends Sprite {
			private var bgColor:uint = 0xFFCC00;
			private var size:uint    = 80;
			private var offset:uint  = 50;
			
			public function DropShadowFilterExample() {
				draw();
				var filter:BitmapFilter = getBitmapFilter();
				var myFilters:Array = new Array();
				myFilters.push(filter);
				filters = myFilters;
			}
			
			public function getBitmapFilter():BitmapFilter {
				var color:Number = 0x000000;
				var angle:Number = 45;
				var alpha:Number = 0.8;
				var blurX:Number = 8;
				var blurY:Number = 8;
				var distance:Number = 15;
				var strength:Number = 0.65;
				var inner:Boolean = false;
				var knockout:Boolean = false;
				var quality:Number = BitmapFilterQuality.HIGH;
				return new DropShadowFilter(distance,
					angle,
					color,
					alpha,
					blurX,
					blurY,
					strength,
					quality,
					inner,
					knockout);
			}
			
			private function draw():void {
				graphics.beginFill(bgColor);
				graphics.drawRect(offset, offset, size, size);
				graphics.endFill();
			}
		}
	}