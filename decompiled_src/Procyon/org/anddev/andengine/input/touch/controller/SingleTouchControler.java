package org.anddev.andengine.input.touch.controller;

import android.view.*;

public class SingleTouchControler extends BaseTouchController
{
    @Override
    public boolean onHandleMotionEvent(final MotionEvent motionEvent) {
        return this.fireTouchEvent(motionEvent.getX(), motionEvent.getY(), motionEvent.getAction(), 0, motionEvent);
    }
}
