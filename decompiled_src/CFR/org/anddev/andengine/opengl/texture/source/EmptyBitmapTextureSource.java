/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Bitmap
 *  android.graphics.Bitmap$Config
 */
package org.anddev.andengine.opengl.texture.source;

import android.graphics.Bitmap;
import org.anddev.andengine.opengl.texture.source.ITextureSource;

public class EmptyBitmapTextureSource
implements ITextureSource {
    private final int mHeight;
    private final int mWidth;

    public EmptyBitmapTextureSource(int n, int n2) {
        this.mWidth = n;
        this.mHeight = n2;
    }

    @Override
    public EmptyBitmapTextureSource clone() {
        return new EmptyBitmapTextureSource(this.mWidth, this.mHeight);
    }

    @Override
    public int getHeight() {
        return this.mHeight;
    }

    @Override
    public int getWidth() {
        return this.mWidth;
    }

    @Override
    public Bitmap onLoadBitmap() {
        return Bitmap.createBitmap((int)this.mWidth, (int)this.mHeight, (Bitmap.Config)Bitmap.Config.ARGB_8888);
    }

    public String toString() {
        return String.valueOf(this.getClass().getSimpleName()) + "(" + this.mWidth + " x " + this.mHeight + ")";
    }
}

