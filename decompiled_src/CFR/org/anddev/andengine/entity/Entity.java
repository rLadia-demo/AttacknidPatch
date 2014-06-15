/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.IEntity;

public abstract class Entity
implements IEntity {
    private boolean mIgnoreUpdate;
    private boolean mVisible = true;
    private int mZIndex = 0;

    public Entity() {
    }

    public Entity(int n) {
        this.mZIndex = n;
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
    public final void onDraw(GL10 gL10, Camera camera) {
        if (!this.mVisible) return;
        this.onManagedDraw(gL10, camera);
    }

    protected abstract void onManagedDraw(GL10 var1, Camera var2);

    protected abstract void onManagedUpdate(float var1);

    @Override
    public final void onUpdate(float f) {
        if (this.mIgnoreUpdate) return;
        this.onManagedUpdate(f);
    }

    @Override
    public void reset() {
        this.mVisible = true;
        this.mIgnoreUpdate = false;
    }

    public void setIgnoreUpdate(boolean bl) {
        this.mIgnoreUpdate = bl;
    }

    public void setVisible(boolean bl) {
        this.mVisible = bl;
    }

    @Override
    public void setZIndex(int n) {
        this.mZIndex = n;
    }
}

