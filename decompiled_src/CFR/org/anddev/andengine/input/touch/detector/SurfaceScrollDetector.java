/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.view.MotionEvent
 */
package org.anddev.andengine.input.touch.detector;

import android.view.MotionEvent;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.detector.ScrollDetector;

public class SurfaceScrollDetector
extends ScrollDetector {
    public SurfaceScrollDetector(float f, ScrollDetector.IScrollDetectorListener iScrollDetectorListener) {
        super(f, iScrollDetectorListener);
    }

    public SurfaceScrollDetector(ScrollDetector.IScrollDetectorListener iScrollDetectorListener) {
        super(iScrollDetectorListener);
    }

    @Override
    protected float getX(TouchEvent touchEvent) {
        return touchEvent.getMotionEvent().getX();
    }

    @Override
    protected float getY(TouchEvent touchEvent) {
        return touchEvent.getMotionEvent().getY();
    }
}

