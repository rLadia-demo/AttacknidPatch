/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.view.MotionEvent
 */
package org.anddev.andengine.input.touch.controller;

import android.view.MotionEvent;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.options.TouchOptions;
import org.anddev.andengine.input.touch.TouchEvent;

public interface ITouchController
extends IUpdateHandler {
    public void applyTouchOptions(TouchOptions var1);

    public boolean onHandleMotionEvent(MotionEvent var1);

    public void setTouchEventCallback(ITouchEventCallback var1);

    public interface ITouchEventCallback {
        public boolean onTouchEvent(TouchEvent var1);
    }

}

