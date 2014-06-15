/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Canvas
 *  android.graphics.Paint
 *  android.graphics.Paint$Style
 *  android.graphics.Typeface
 */
package org.anddev.andengine.opengl.font;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.opengl.texture.Texture;

public class StrokeFont
extends Font {
    private final boolean mStrokeOnly;
    private final Paint mStrokePaint = new Paint();

    public StrokeFont(Texture texture, Typeface typeface, float f, boolean bl, int n, float f2, int n2) {
        this(texture, typeface, f, bl, n, f2, n2, false);
    }

    public StrokeFont(Texture texture, Typeface typeface, float f, boolean bl, int n, float f2, int n2, boolean bl2) {
        super(texture, typeface, f, bl, n);
        this.mStrokePaint.setTypeface(typeface);
        this.mStrokePaint.setStyle(Paint.Style.STROKE);
        this.mStrokePaint.setStrokeWidth(f2);
        this.mStrokePaint.setColor(n2);
        this.mStrokePaint.setTextSize(f);
        this.mStrokePaint.setAntiAlias(bl);
        this.mStrokeOnly = bl2;
    }

    @Override
    protected void drawCharacterString(String string) {
        if (!this.mStrokeOnly) {
            super.drawCharacterString(string);
        }
        this.mCanvas.drawText(string, 0.0f, - this.mFontMetrics.ascent, this.mStrokePaint);
    }
}

