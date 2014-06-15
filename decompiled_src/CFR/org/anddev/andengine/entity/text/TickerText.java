/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.text;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.text.Text;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.util.HorizontalAlign;

public class TickerText
extends Text {
    private float mCharactersPerSecond;
    private int mCharactersVisible = 0;
    private float mDuration;
    private boolean mReverse = false;
    private float mSecondsElapsed = 0.0f;

    public TickerText(float f, float f2, Font font, String string, HorizontalAlign horizontalAlign, float f3) {
        super(f, f2, font, string, horizontalAlign);
        this.setCharactersPerSecond(f3);
    }

    @Override
    protected void drawVertices(GL10 gL10, Camera camera) {
        gL10.glDrawArrays(4, 0, 6 * this.mCharactersVisible);
    }

    public float getCharactersPerSecond() {
        return this.mCharactersPerSecond;
    }

    public int getCharactersVisible() {
        return this.mCharactersVisible;
    }

    public boolean isReverse() {
        return this.mReverse;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    protected void onManagedUpdate(float f) {
        super.onManagedUpdate(f);
        if (this.mReverse) {
            if (this.mCharactersVisible >= this.mCharactersMaximum) return;
            this.mSecondsElapsed = Math.max(0.0f, this.mSecondsElapsed - f);
            this.mCharactersVisible = (int)(this.mSecondsElapsed * this.mCharactersPerSecond);
            return;
        }
        if (this.mCharactersVisible >= this.mCharactersMaximum) return;
        this.mSecondsElapsed = Math.min(this.mDuration, f + this.mSecondsElapsed);
        this.mCharactersVisible = (int)(this.mSecondsElapsed * this.mCharactersPerSecond);
    }

    @Override
    public void reset() {
        super.reset();
        this.mCharactersVisible = 0;
        this.mSecondsElapsed = 0.0f;
        this.mReverse = false;
    }

    public void setCharactersPerSecond(float f) {
        this.mCharactersPerSecond = f;
        this.mDuration = (float)this.mCharactersMaximum * this.mCharactersPerSecond;
    }

    public void setReverse(boolean bl) {
        this.mReverse = bl;
    }
}

