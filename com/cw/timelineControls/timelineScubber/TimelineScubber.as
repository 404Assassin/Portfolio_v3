package com.cw.timelineControls.timelineScubber
{
	
private var animLength : int = ballAnimationMC.totalFrames;
private var leftBound : Number = scrubberMC.scrubBarMC.x;
private var rightBound : Number = scrubberMC.scrubBarMC.x + scrubberMC.scrubBarMC.width;
private var dragBound : Rectangle = new Rectangle(leftBound, scrubberMC.scrubHandleMC.y, scrubberMC.scrubBarMC.width, 0);
private var calcWidth : Number = scrubberMC.scrubBarMC.width / animLength;
private var animPlaying : Boolean = false;

	public class TimelineScubber{
		public function TimelineScubber(){
			
		}
	private function handleMouseEvents(evt:MouseEvent):void{
	switch(String(evt.type)) {
		case MouseEvent.MOUSE_DOWN:
			scrubberMC.scrubHandleMC.startDrag(false, dragBound);
			stage.addEventListener(MouseEvent.MOUSE_UP, handleMouseEvents);
			ballAnimationMC.addEventListener(Event.ENTER_FRAME, scrubMovie);
			
			if (animPlaying) stopAnimation();
			
			break;
		case MouseEvent.MOUSE_UP:
			scrubberMC.scrubHandleMC.stopDrag();
			stage.removeEventListener(MouseEvent.MOUSE_UP, handleMouseEvents);
			ballAnimationMC.removeEventListener(Event.ENTER_FRAME, scrubMovie);
			
			if (animPlaying) playAnimation();
			break;
	}
}

private function scrubMovie(evt:Event):void{
	var scrubPos : int = scrubberMC.scrubHandleMC.x;
	var gotoFrame : int = Math.ceil(scrubPos / calcWidth);
	ballAnimationMC.gotoAndStop(gotoFrame);
	
	frameTxt.text = String(ballAnimationMC.currentFrame);
}

private function togglePlay(evt:MouseEvent):void{
	if (!animPlaying) {
		playAnimation();
		animPlaying = true;
		toggleBtn.label = "Stop Animation";
		
	} else {
		stopAnimation();
		animPlaying = false;
		toggleBtn.label = "Play Animation";
		
	}
}

private function playAnimation():void{
	ballAnimationMC.play();
	scrubberMC.addEventListener(Event.ENTER_FRAME, updateScrubber);
}

private function stopAnimation():void{
	ballAnimationMC.stop();
	scrubberMC.removeEventListener(Event.ENTER_FRAME, updateScrubber);
}

private function updateScrubber(evt:Event):void{
	var percent : Number = ballAnimationMC.currentFrame / animLength;
	scrubberMC.scrubHandleMC.x = percent * scrubberMC.scrubBarMC.width;
	
	frameTxt.text = String(ballAnimationMC.currentFrame);
}
	}
}



