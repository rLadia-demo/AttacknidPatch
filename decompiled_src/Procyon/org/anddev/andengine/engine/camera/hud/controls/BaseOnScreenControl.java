package org.anddev.andengine.engine.camera.hud.controls;

import org.anddev.andengine.engine.camera.hud.*;
import org.anddev.andengine.entity.scene.*;
import org.anddev.andengine.entity.sprite.*;
import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.input.touch.*;
import org.anddev.andengine.engine.handler.timer.*;
import org.anddev.andengine.engine.handler.*;
import org.anddev.andengine.entity.*;
import org.anddev.andengine.entity.layer.*;
import org.anddev.andengine.util.*;
import android.util.*;

public abstract class BaseOnScreenControl extends HUD implements IOnSceneTouchListener
{
    private static final int INVALID_POINTER_ID = -1;
    private int mActivePointerID;
    private final Sprite mControlBase;
    private final Sprite mControlKnob;
    private float mControlValueX;
    private float mControlValueY;
    private final IOnScreenControlListener mOnScreenControlListener;
    
    public BaseOnScreenControl(final int n, final int n2, final Camera camera, final TextureRegion textureRegion, final TextureRegion textureRegion2, final float n3, final IOnScreenControlListener mOnScreenControlListener) {
        super();
        this.mActivePointerID = -1;
        this.setCamera(camera);
        this.mOnScreenControlListener = mOnScreenControlListener;
        this.mControlBase = new Sprite((float)n, (float)n2, textureRegion) {
            @Override
            public boolean onAreaTouched(final TouchEvent touchEvent, final float n, final float n2) {
                return BaseOnScreenControl.this.onHandleControlBaseTouched(touchEvent, n, n2);
            }
        };
        this.mControlKnob = new Sprite(0.0f, 0.0f, textureRegion2);
        this.onHandleControlKnobReleased();
        this.setOnSceneTouchListener((IOnSceneTouchListener)this);
        this.registerTouchArea((ITouchArea)this.mControlBase);
        this.registerTouchArea((ITouchArea)this.mControlKnob);
        this.registerUpdateHandler(new TimerHandler(n3, true, new ITimerCallback() {
            @Override
            public void onTimePassed(final TimerHandler timerHandler) {
                BaseOnScreenControl.this.mOnScreenControlListener.onControlChange(BaseOnScreenControl.this, BaseOnScreenControl.this.mControlValueX, BaseOnScreenControl.this.mControlValueY);
            }
        }));
        final ILayer bottomLayer = this.getBottomLayer();
        bottomLayer.addEntity(this.mControlBase);
        bottomLayer.addEntity(this.mControlKnob);
        this.setTouchAreaBindingEnabled(true);
    }
    
    private void updateControlKnob(final TouchEvent touchEvent, final float n, final float n2) {
        final Sprite mControlBase = this.mControlBase;
        this.onUpdateControlKnob(MathUtils.bringToBounds(0.0f, mControlBase.getWidth(), n) / mControlBase.getWidth() - 0.5f, MathUtils.bringToBounds(0.0f, mControlBase.getHeight(), n2) / mControlBase.getHeight() - 0.5f);
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
    
    protected boolean onHandleControlBaseTouched(final TouchEvent touchEvent, final float n, final float n2) {
        final int pointerID = touchEvent.getPointerID();
        switch (touchEvent.getAction()) {
            default: {
                if (this.mActivePointerID == pointerID) {
                    this.updateControlKnob(touchEvent, n, n2);
                    break;
                }
                break;
            }
            case 0: {
                if (this.mActivePointerID == -1) {
                    this.mActivePointerID = pointerID;
                    this.updateControlKnob(touchEvent, n, n2);
                    this.mOnScreenControlListener.onControlKnobDown(this);
                    return true;
                }
                break;
            }
            case 1:
            case 3: {
                if (this.mActivePointerID == pointerID) {
                    this.mActivePointerID = -1;
                    this.onHandleControlKnobReleased();
                    this.mOnScreenControlListener.onControlKnobUp(this);
                    return true;
                }
                break;
            }
        }
        return true;
    }
    
    protected void onHandleControlKnobReleased() {
        this.onUpdateControlKnob(0.0f, 0.0f);
    }
    
    @Override
    public boolean onSceneTouchEvent(final Scene scene, final TouchEvent touchEvent) {
        if (touchEvent.getPointerID() == this.mActivePointerID) {
            this.onHandleControlBaseLeft();
            switch (touchEvent.getAction()) {
                case 1:
                case 3: {
                    this.mActivePointerID = -1;
                    break;
                }
            }
        }
        return false;
    }
    
    protected void onUpdateControlKnob(final float n, final float n2) {
        final Sprite mControlBase = this.mControlBase;
        final Sprite mControlKnob = this.mControlKnob;
        float n3 = n;
        float n4 = n2;
        final double sqrt = Math.sqrt(n3 * n3 + n4 * n4);
        if (sqrt > Math.abs(0.5f)) {
            Log.e("\u6447\u6746\u5f15\u64ce", "=============\u51fa\u754c\u91cd\u7f6e: relatvieS=" + sqrt);
            n3 = 0.0f;
            n4 = 0.0f;
            this.mActivePointerID = -1;
            this.mOnScreenControlListener.onControlKnobUp(this);
        }
        else if (sqrt >= Math.abs(0.3f) && sqrt <= Math.abs(0.5f)) {
            Log.e("\u6447\u6746\u5f15\u64ce", "=============\u9650\u5236\u8303\u56f4: relatvieS=" + sqrt);
            final double n5 = 0.30000001192092896 / sqrt;
            n3 *= (float)n5;
            n4 *= (float)n5;
        }
        this.mControlValueX = 2.0f * n3;
        this.mControlValueY = 2.0f * n4;
        final float[] sceneCenterCoordinates = mControlBase.getSceneCenterCoordinates();
        mControlKnob.setPosition(sceneCenterCoordinates[0] - 0.5f * mControlKnob.getWidth() + n3 * mControlBase.getWidthScaled(), sceneCenterCoordinates[1] - 0.5f * mControlKnob.getHeight() + n4 * mControlBase.getHeightScaled());
    }
    
    public void refreshControlKnobPosition() {
        this.onUpdateControlKnob(0.5f * this.mControlValueX, 0.5f * this.mControlValueY);
    }
    
    public interface IOnScreenControlListener
    {
        void onControlChange(BaseOnScreenControl p0, float p1, float p2);
        
        void onControlKnobDown(BaseOnScreenControl p0);
        
        void onControlKnobUp(BaseOnScreenControl p0);
    }
}
