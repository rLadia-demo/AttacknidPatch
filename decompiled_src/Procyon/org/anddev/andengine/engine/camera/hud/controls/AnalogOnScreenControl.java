package org.anddev.andengine.engine.camera.hud.controls;

import org.anddev.andengine.util.constants.*;
import org.anddev.andengine.input.touch.detector.*;
import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.input.touch.*;
import org.anddev.andengine.entity.scene.*;

public class AnalogOnScreenControl extends BaseOnScreenControl implements TimeConstants, IClickDetectorListener
{
    private final ClickDetector mClickDetector;
    
    public AnalogOnScreenControl(final int n, final int n2, final Camera camera, final TextureRegion textureRegion, final TextureRegion textureRegion2, final float n3, final long triggerClickMaximumMilliseconds, final IAnalogOnScreenControlListener analogOnScreenControlListener) {
        super(n, n2, camera, textureRegion, textureRegion2, n3, (IOnScreenControlListener)analogOnScreenControlListener);
        (this.mClickDetector = new ClickDetector((ClickDetector.IClickDetectorListener)this)).setTriggerClickMaximumMilliseconds(triggerClickMaximumMilliseconds);
    }
    
    public AnalogOnScreenControl(final int n, final int n2, final Camera camera, final TextureRegion textureRegion, final TextureRegion textureRegion2, final float n3, final IAnalogOnScreenControlListener analogOnScreenControlListener) {
        super(n, n2, camera, textureRegion, textureRegion2, n3, (IOnScreenControlListener)analogOnScreenControlListener);
        (this.mClickDetector = new ClickDetector((ClickDetector.IClickDetectorListener)this)).setEnabled(false);
    }
    
    public IAnalogOnScreenControlListener getOnScreenControlListener() {
        return (IAnalogOnScreenControlListener)super.getOnScreenControlListener();
    }
    
    @Override
    public void onClick(final ClickDetector clickDetector, final TouchEvent touchEvent) {
        this.getOnScreenControlListener().onControlClick(this);
    }
    
    @Override
    protected boolean onHandleControlBaseTouched(final TouchEvent touchEvent, final float n, final float n2) {
        this.mClickDetector.onSceneTouchEvent(null, touchEvent);
        return super.onHandleControlBaseTouched(touchEvent, n, n2);
    }
    
    public void setOnControlClickEnabled(final boolean enabled) {
        this.mClickDetector.setEnabled(enabled);
    }
    
    public void setOnControlClickMaximumMilliseconds(final long triggerClickMaximumMilliseconds) {
        this.mClickDetector.setTriggerClickMaximumMilliseconds(triggerClickMaximumMilliseconds);
    }
    
    public interface IAnalogOnScreenControlListener extends IOnScreenControlListener
    {
        void onControlClick(AnalogOnScreenControl p0);
    }
}
