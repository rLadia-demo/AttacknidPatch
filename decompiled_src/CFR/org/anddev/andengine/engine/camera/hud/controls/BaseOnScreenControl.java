/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.Log
 */
package org.anddev.andengine.engine.camera.hud.controls;

import android.util.Log;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.camera.hud.HUD;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.handler.timer.ITimerCallback;
import org.anddev.andengine.engine.handler.timer.TimerHandler;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.sprite.Sprite;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.util.MathUtils;

public abstract class BaseOnScreenControl
extends HUD
implements Scene.IOnSceneTouchListener {
    private static final int INVALID_POINTER_ID = -1;
    private int mActivePointerID = -1;
    private final Sprite mControlBase;
    private final Sprite mControlKnob;
    private float mControlValueX;
    private float mControlValueY;
    private final IOnScreenControlListener mOnScreenControlListener;

    public BaseOnScreenControl(int n, int n2, Camera camera, TextureRegion textureRegion, TextureRegion textureRegion2, float f, IOnScreenControlListener iOnScreenControlListener) {
        this.setCamera(camera);
        this.mOnScreenControlListener = iOnScreenControlListener;
        this.mControlBase = new Sprite(n, n2, textureRegion){

            @Override
            public boolean onAreaTouched(TouchEvent touchEvent, float f, float f2) {
                return BaseOnScreenControl.this.onHandleControlBaseTouched(touchEvent, f, f2);
            }
        };
        this.mControlKnob = new Sprite(0.0f, 0.0f, textureRegion2);
        this.onHandleControlKnobReleased();
        this.setOnSceneTouchListener((Scene.IOnSceneTouchListener)this);
        this.registerTouchArea((Scene.ITouchArea)this.mControlBase);
        this.registerTouchArea((Scene.ITouchArea)this.mControlKnob);
        this.registerUpdateHandler((IUpdateHandler)new TimerHandler(f, true, new ITimerCallback(){

            @Override
            public void onTimePassed(TimerHandler timerHandler) {
                BaseOnScreenControl.this.mOnScreenControlListener.onControlChange(BaseOnScreenControl.this, BaseOnScreenControl.this.mControlValueX, BaseOnScreenControl.this.mControlValueY);
            }
        }));
        ILayer iLayer = this.getBottomLayer();
        iLayer.addEntity(this.mControlBase);
        iLayer.addEntity(this.mControlKnob);
        this.setTouchAreaBindingEnabled(true);
    }

    private void updateControlKnob(TouchEvent touchEvent, float f, float f2) {
        Sprite sprite = this.mControlBase;
        this.onUpdateControlKnob(MathUtils.bringToBounds(0.0f, sprite.getWidth(), f) / sprite.getWidth() - 0.5f, MathUtils.bringToBounds(0.0f, sprite.getHeight(), f2) / sprite.getHeight() - 0.5f);
    }

    public Sprite getControlBase() {
        return this.mControlBase;
    }

    public Sprite getControlKnob() {
        return this.mControlKnob;
    }

    public IOnScreenControlListener getOnScreenControlListener() {
        return this.mOnScreenControlListener;
    }

    protected void onHandleControlBaseLeft() {
        this.onUpdateControlKnob(0.0f, 0.0f);
    }

    /*
     * Enabled aggressive block sorting
     */
    protected boolean onHandleControlBaseTouched(TouchEvent touchEvent, float f, float f2) {
        int n = touchEvent.getPointerID();
        switch (touchEvent.getAction()) {
            default: {
                if (this.mActivePointerID != n) return true;
                this.updateControlKnob(touchEvent, f, f2);
                return true;
            }
            case 0: {
                if (this.mActivePointerID != -1) return true;
                this.mActivePointerID = n;
                this.updateControlKnob(touchEvent, f, f2);
                this.mOnScreenControlListener.onControlKnobDown(this);
                return true;
            }
            case 1: 
            case 3: 
        }
        if (this.mActivePointerID != n) return true;
        this.mActivePointerID = -1;
        this.onHandleControlKnobReleased();
        this.mOnScreenControlListener.onControlKnobUp(this);
        return true;
    }

    protected void onHandleControlKnobReleased() {
        this.onUpdateControlKnob(0.0f, 0.0f);
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public boolean onSceneTouchEvent(Scene scene, TouchEvent touchEvent) {
        if (touchEvent.getPointerID() != this.mActivePointerID) return false;
        this.onHandleControlBaseLeft();
        switch (touchEvent.getAction()) {
            default: {
                return false;
            }
            case 1: 
            case 3: {
                this.mActivePointerID = -1;
            }
        }
        return false;
    }

    /*
     * Enabled aggressive block sorting
     */
    protected void onUpdateControlKnob(float f, float f2) {
        Sprite sprite = this.mControlBase;
        Sprite sprite2 = this.mControlKnob;
        float f3 = f;
        float f4 = f2;
        double d = Math.sqrt(f3 * f3 + f4 * f4);
        if (d > (double)Math.abs(0.5f)) {
            Log.e((String)"\u6447\u6746\u5f15\u64ce", (String)("=============\u51fa\u754c\u91cd\u7f6e: relatvieS=" + d));
            f3 = 0.0f;
            f4 = 0.0f;
            this.mActivePointerID = -1;
            this.mOnScreenControlListener.onControlKnobUp(this);
        } else if (d >= (double)Math.abs(0.3f) && d <= (double)Math.abs(0.5f)) {
            Log.e((String)"\u6447\u6746\u5f15\u64ce", (String)("=============\u9650\u5236\u8303\u56f4: relatvieS=" + d));
            double d2 = 0.30000001192092896 / d;
            f3 = (float)(d2 * (double)f3);
            f4 = (float)(d2 * (double)f4);
        }
        this.mControlValueX = 2.0f * f3;
        this.mControlValueY = 2.0f * f4;
        float[] arrf = sprite.getSceneCenterCoordinates();
        sprite2.setPosition(arrf[0] - 0.5f * sprite2.getWidth() + f3 * sprite.getWidthScaled(), arrf[1] - 0.5f * sprite2.getHeight() + f4 * sprite.getHeightScaled());
    }

    public void refreshControlKnobPosition() {
        this.onUpdateControlKnob(0.5f * this.mControlValueX, 0.5f * this.mControlValueY);
    }

    public interface IOnScreenControlListener {
        public void onControlChange(BaseOnScreenControl var1, float var2, float var3);

        public void onControlKnobDown(BaseOnScreenControl var1);

        public void onControlKnobUp(BaseOnScreenControl var1);
    }

}

