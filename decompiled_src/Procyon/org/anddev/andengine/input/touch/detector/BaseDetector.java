package org.anddev.andengine.input.touch.detector;

import org.anddev.andengine.entity.scene.*;
import org.anddev.andengine.input.touch.*;

public abstract class BaseDetector implements IOnSceneTouchListener
{
    private boolean mEnabled;
    
    public BaseDetector() {
        super();
        this.mEnabled = true;
    }
    
    public boolean isEnabled() {
        return this.mEnabled;
    }
    
    protected abstract boolean onManagedTouchEvent(final TouchEvent p0);
    
    @Override
    public boolean onSceneTouchEvent(final Scene scene, final TouchEvent touchEvent) {
        return this.onTouchEvent(touchEvent);
    }
    
    public final boolean onTouchEvent(final TouchEvent touchEvent) {
        return this.mEnabled && this.onManagedTouchEvent(touchEvent);
    }
    
    public void setEnabled(final boolean mEnabled) {
        this.mEnabled = mEnabled;
    }
}
