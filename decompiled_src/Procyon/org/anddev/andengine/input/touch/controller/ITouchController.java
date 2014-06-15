package org.anddev.andengine.input.touch.controller;

import org.anddev.andengine.engine.handler.*;
import org.anddev.andengine.engine.options.*;
import android.view.*;
import org.anddev.andengine.input.touch.*;

public interface ITouchController extends IUpdateHandler
{
    void applyTouchOptions(TouchOptions p0);
    
    boolean onHandleMotionEvent(MotionEvent p0);
    
    void setTouchEventCallback(ITouchEventCallback p0);
    
    public interface ITouchEventCallback
    {
        boolean onTouchEvent(TouchEvent p0);
    }
}
