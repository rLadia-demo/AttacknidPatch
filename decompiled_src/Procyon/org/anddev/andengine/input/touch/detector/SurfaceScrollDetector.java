package org.anddev.andengine.input.touch.detector;

import org.anddev.andengine.input.touch.*;

public class SurfaceScrollDetector extends ScrollDetector
{
    public SurfaceScrollDetector(final float n, final IScrollDetectorListener scrollDetectorListener) {
        super(n, scrollDetectorListener);
    }
    
    public SurfaceScrollDetector(final IScrollDetectorListener scrollDetectorListener) {
        super(scrollDetectorListener);
    }
    
    @Override
    protected float getX(final TouchEvent touchEvent) {
        return touchEvent.getMotionEvent().getX();
    }
    
    @Override
    protected float getY(final TouchEvent touchEvent) {
        return touchEvent.getMotionEvent().getY();
    }
}
