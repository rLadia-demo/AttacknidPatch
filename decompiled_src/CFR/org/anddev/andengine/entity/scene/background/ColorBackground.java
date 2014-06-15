/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.scene.background;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.scene.background.BaseBackground;

public class ColorBackground
extends BaseBackground {
    private float mAlpha = 1.0f;
    private float mBlue = 0.0f;
    private boolean mColorEnabled = true;
    private float mGreen = 0.0f;
    private float mRed = 0.0f;

    protected ColorBackground() {
    }

    public ColorBackground(float f, float f2, float f3) {
        this.mRed = f;
        this.mGreen = f2;
        this.mBlue = f3;
    }

    public ColorBackground(float f, float f2, float f3, float f4) {
        this.mRed = f;
        this.mGreen = f2;
        this.mBlue = f3;
        this.mAlpha = f4;
    }

    public boolean isColorEnabled() {
        return this.mColorEnabled;
    }

    @Override
    public void onDraw(GL10 gL10, Camera camera) {
        if (!this.mColorEnabled) return;
        gL10.glClearColor(this.mRed, this.mGreen, this.mBlue, this.mAlpha);
        gL10.glClear(16384);
    }

    @Override
    public void setColor(float f, float f2, float f3) {
        this.mRed = f;
        this.mGreen = f2;
        this.mBlue = f3;
    }

    @Override
    public void setColor(float f, float f2, float f3, float f4) {
        this.setColor(f, f2, f3);
        this.mAlpha = f4;
    }

    public void setColor(int n, int n2, int n3) throws IllegalArgumentException {
        this.setColor((float)n / 255.0f, (float)n2 / 255.0f, (float)n3 / 255.0f);
    }

    public void setColor(int n, int n2, int n3, int n4) throws IllegalArgumentException {
        this.setColor((float)n / 255.0f, (float)n2 / 255.0f, (float)n3 / 255.0f, (float)n4 / 255.0f);
    }

    public void setColorEnabled(boolean bl) {
        this.mColorEnabled = bl;
    }
}

