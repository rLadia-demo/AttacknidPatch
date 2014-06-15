package org.anddev.andengine.entity.scene.background;

import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;

public class ColorBackground extends BaseBackground
{
    private float mAlpha;
    private float mBlue;
    private boolean mColorEnabled;
    private float mGreen;
    private float mRed;
    
    protected ColorBackground() {
        super();
        this.mRed = 0.0f;
        this.mGreen = 0.0f;
        this.mBlue = 0.0f;
        this.mAlpha = 1.0f;
        this.mColorEnabled = true;
    }
    
    public ColorBackground(final float mRed, final float mGreen, final float mBlue) {
        super();
        this.mRed = 0.0f;
        this.mGreen = 0.0f;
        this.mBlue = 0.0f;
        this.mAlpha = 1.0f;
        this.mColorEnabled = true;
        this.mRed = mRed;
        this.mGreen = mGreen;
        this.mBlue = mBlue;
    }
    
    public ColorBackground(final float mRed, final float mGreen, final float mBlue, final float mAlpha) {
        super();
        this.mRed = 0.0f;
        this.mGreen = 0.0f;
        this.mBlue = 0.0f;
        this.mAlpha = 1.0f;
        this.mColorEnabled = true;
        this.mRed = mRed;
        this.mGreen = mGreen;
        this.mBlue = mBlue;
        this.mAlpha = mAlpha;
    }
    
    public boolean isColorEnabled() {
        return this.mColorEnabled;
    }
    
    @Override
    public void onDraw(final GL10 gl10, final Camera camera) {
        if (this.mColorEnabled) {
            gl10.glClearColor(this.mRed, this.mGreen, this.mBlue, this.mAlpha);
            gl10.glClear(16384);
        }
    }
    
    @Override
    public void setColor(final float mRed, final float mGreen, final float mBlue) {
        this.mRed = mRed;
        this.mGreen = mGreen;
        this.mBlue = mBlue;
    }
    
    @Override
    public void setColor(final float n, final float n2, final float n3, final float mAlpha) {
        this.setColor(n, n2, n3);
        this.mAlpha = mAlpha;
    }
    
    public void setColor(final int n, final int n2, final int n3) throws IllegalArgumentException {
        this.setColor(n / 255.0f, n2 / 255.0f, n3 / 255.0f);
    }
    
    public void setColor(final int n, final int n2, final int n3, final int n4) throws IllegalArgumentException {
        this.setColor(n / 255.0f, n2 / 255.0f, n3 / 255.0f, n4 / 255.0f);
    }
    
    public void setColorEnabled(final boolean mColorEnabled) {
        this.mColorEnabled = mColorEnabled;
    }
}
