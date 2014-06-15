/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.view.MotionEvent
 */
package org.anddev.andengine.input.touch.controller;

import android.view.MotionEvent;
import org.anddev.andengine.input.touch.controller.BaseTouchController;

public class SingleTouchControler
extends BaseTouchController {
    @Override
    public boolean onHandleMotionEvent(MotionEvent motionEvent) {
        return this.fireTouchEvent(motionEvent.getX(), motionEvent.getY(), motionEvent.getAction(), 0, motionEvent);
    }
}

