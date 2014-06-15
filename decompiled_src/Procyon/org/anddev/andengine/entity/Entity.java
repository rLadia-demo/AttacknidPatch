package org.anddev.andengine.entity;

import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;

public abstract class Entity implements IEntity
{
    private boolean mIgnoreUpdate;
    private boolean mVisible;
    private int mZIndex;
    
    public Entity() {
        super();
        this.mVisible = true;
        this.mZIndex = 0;
    }
    
    public Entity(final int mzIndex) {
        super();
        this.mVisible = true;
        this.mZIndex = 0;
        this.mZIndex = mzIndex;
    }
    
    @Override
    public int getZIndex() {
        return this.mZIndex;
    }
    
    public boolean isIgnoreUpdate() {
        return this.mIgnoreUpdate;
    }
    
    public boolean isVisible() {
        return this.mVisible;
    }
    
    @Override
    public final void onDraw(final GL10 gl10, final Camera camera) {
        if (this.mVisible) {
            this.onManagedDraw(gl10, camera);
        }
    }
    
    protected abstract void onManagedDraw(final GL10 p0, final Camera p1);
    
    protected abstract void onManagedUpdate(final float p0);
    
    @Override
    public final void onUpdate(final float n) {
        if (!this.mIgnoreUpdate) {
            this.onManagedUpdate(n);
        }
    }
    
    @Override
    public void reset() {
        this.mVisible = true;
        this.mIgnoreUpdate = false;
    }
    
    public void setIgnoreUpdate(final boolean mIgnoreUpdate) {
        this.mIgnoreUpdate = mIgnoreUpdate;
    }
    
    public void setVisible(final boolean mVisible) {
        this.mVisible = mVisible;
    }
    
    @Override
    public void setZIndex(final int mzIndex) {
        this.mZIndex = mzIndex;
    }
}
