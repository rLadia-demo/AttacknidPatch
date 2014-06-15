package org.anddev.andengine.opengl.texture.source;

import android.graphics.*;

public class EmptyBitmapTextureSource implements ITextureSource
{
    private final int mHeight;
    private final int mWidth;
    
    public EmptyBitmapTextureSource(final int mWidth, final int mHeight) {
        super();
        this.mWidth = mWidth;
        this.mHeight = mHeight;
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
        return Bitmap.createBitmap(this.mWidth, this.mHeight, Bitmap$Config.ARGB_8888);
    }
    
    @Override
    public String toString() {
        return String.valueOf(this.getClass().getSimpleName()) + "(" + this.mWidth + " x " + this.mHeight + ")";
    }
}
