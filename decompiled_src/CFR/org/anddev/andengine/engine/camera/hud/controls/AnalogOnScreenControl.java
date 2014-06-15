/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.camera.hud.controls;

import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.camera.hud.controls.BaseOnScreenControl;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.detector.ClickDetector;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.util.constants.TimeConstants;

public class AnalogOnScreenControl
extends BaseOnScreenControl
implements TimeConstants,
ClickDetector.IClickDetectorListener {
    private final ClickDetector mClickDetector;

    public AnalogOnScreenControl(int n, int n2, Camera camera, TextureRegion textureRegion, TextureRegion textureRegion2, float f, long l, IAnalogOnScreenControlListener iAnalogOnScreenControlListener) {
        super(n, n2, camera, textureRegion, textureRegion2, f, iAnalogOnScreenControlListener);
        this.mClickDetector = new ClickDetector(this);
        this.mClickDetector.setTriggerClickMaximumMilliseconds(l);
    }

    public AnalogOnScreenControl(int n, int n2, Camera camera, TextureRegion textureRegion, TextureRegion textureRegion2, float f, IAnalogOnScreenControlListener iAnalogOnScreenControlListener) {
        super(n, n2, camera, textureRegion, textureRegion2, f, iAnalogOnScreenControlListener);
        this.mClickDetector = new ClickDetector(this);
        this.mClickDetector.setEnabled(false);
    }

    @Override
    public IAnalogOnScreenControlListener getOnScreenControlListener() {
        return (IAnalogOnScreenControlListener)super.getOnScreenControlListener();
    }

    @Override
    public void onClick(ClickDetector clickDetector2, TouchEvent clickDetector2) {
        this.getOnScreenControlListener().onControlClick(this);
    }

    @Override
    protected boolean onHandleControlBaseTouched(TouchEvent touchEvent, float f, float f2) {
        this.mClickDetector.onSceneTouchEvent((Scene)null, touchEvent);
        return super.onHandleControlBaseTouched(touchEvent, f, f2);
    }

    public void setOnControlClickEnabled(boolean bl) {
        this.mClickDetector.setEnabled(bl);
    }

    public void setOnControlClickMaximumMilliseconds(long l) {
        this.mClickDetector.setTriggerClickMaximumMilliseconds(l);
    }

    public interface IAnalogOnScreenControlListener
    extends BaseOnScreenControl.IOnScreenControlListener {
        public void onControlClick(AnalogOnScreenControl var1);
    }

}

