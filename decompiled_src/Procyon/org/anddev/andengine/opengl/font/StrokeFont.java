package org.anddev.andengine.opengl.font;

import org.anddev.andengine.opengl.texture.*;
import android.graphics.*;

public class StrokeFont extends Font
{
    private final boolean mStrokeOnly;
    private final Paint mStrokePaint;
    
    public StrokeFont(final Texture texture, final Typeface typeface, final float n, final boolean b, final int n2, final float n3, final int n4) {
        this(texture, typeface, n, b, n2, n3, n4, false);
    }
    
    public StrokeFont(final Texture texture, final Typeface typeface, final float textSize, final boolean antiAlias, final int n, final float strokeWidth, final int color, final boolean mStrokeOnly) {
        super(texture, typeface, textSize, antiAlias, n);
        (this.mStrokePaint = new Paint()).setTypeface(typeface);
        this.mStrokePaint.setStyle(Paint$Style.STROKE);
        this.mStrokePaint.setStrokeWidth(strokeWidth);
        this.mStrokePaint.setColor(color);
        this.mStrokePaint.setTextSize(textSize);
        this.mStrokePaint.setAntiAlias(antiAlias);
        this.mStrokeOnly = mStrokeOnly;
    }
    
    @Override
    protected void drawCharacterString(final String s) {
        if (!this.mStrokeOnly) {
            super.drawCharacterString(s);
        }
        this.mCanvas.drawText(s, 0.0f, -this.mFontMetrics.ascent, this.mStrokePaint);
    }
}
