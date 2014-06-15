package org.anddev.andengine.entity.text;

import org.anddev.andengine.opengl.font.*;
import org.anddev.andengine.util.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;

public class TickerText extends Text
{
    private float mCharactersPerSecond;
    private int mCharactersVisible;
    private float mDuration;
    private boolean mReverse;
    private float mSecondsElapsed;
    
    public TickerText(final float n, final float n2, final Font font, final String s, final HorizontalAlign horizontalAlign, final float charactersPerSecond) {
        super(n, n2, font, s, horizontalAlign);
        this.mCharactersVisible = 0;
        this.mSecondsElapsed = 0.0f;
        this.mReverse = false;
        this.setCharactersPerSecond(charactersPerSecond);
    }
    
    @Override
    protected void drawVertices(final GL10 gl10, final Camera camera) {
        gl10.glDrawArrays(4, 0, 6 * this.mCharactersVisible);
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
    
    @Override
    protected void onManagedUpdate(final float n) {
        super.onManagedUpdate(n);
        if (this.mReverse) {
            if (this.mCharactersVisible < this.mCharactersMaximum) {
                this.mSecondsElapsed = Math.max(0.0f, this.mSecondsElapsed - n);
                this.mCharactersVisible = (int)(this.mSecondsElapsed * this.mCharactersPerSecond);
            }
        }
        else if (this.mCharactersVisible < this.mCharactersMaximum) {
            this.mSecondsElapsed = Math.min(this.mDuration, n + this.mSecondsElapsed);
            this.mCharactersVisible = (int)(this.mSecondsElapsed * this.mCharactersPerSecond);
        }
    }
    
    @Override
    public void reset() {
        super.reset();
        this.mCharactersVisible = 0;
        this.mSecondsElapsed = 0.0f;
        this.mReverse = false;
    }
    
    public void setCharactersPerSecond(final float mCharactersPerSecond) {
        this.mCharactersPerSecond = mCharactersPerSecond;
        this.mDuration = this.mCharactersMaximum * this.mCharactersPerSecond;
    }
    
    public void setReverse(final boolean mReverse) {
        this.mReverse = mReverse;
    }
}
