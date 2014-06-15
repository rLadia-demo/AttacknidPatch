package org.anddev.andengine.opengl.texture.source.decorator;

import org.anddev.andengine.opengl.texture.source.*;
import android.graphics.*;

public abstract class BaseTextureSourceDecorator implements ITextureSource
{
    protected final boolean mAntiAliasing;
    protected final Paint mPaint;
    protected final ITextureSource mTextureSource;
    
    public BaseTextureSourceDecorator(final ITextureSource textureSource) {
        this(textureSource, false);
    }
    
    public BaseTextureSourceDecorator(final ITextureSource mTextureSource, final boolean b) {
        super();
        this.mPaint = new Paint();
        this.mTextureSource = mTextureSource;
        this.mAntiAliasing = b;
        this.mPaint.setAntiAlias(b);
    }
    
    private Bitmap ensureLoadedBitmapIsMutable(final Bitmap bitmap) {
        if (bitmap.isMutable()) {
            return bitmap;
        }
        final Bitmap copy = bitmap.copy(bitmap.getConfig(), true);
        bitmap.recycle();
        return copy;
    }
    
    @Override
    public abstract BaseTextureSourceDecorator clone();
    
    @Override
    public int getHeight() {
        return this.mTextureSource.getHeight();
    }
    
    @Override
    public int getWidth() {
        return this.mTextureSource.getWidth();
    }
    
    protected abstract void onDecorateBitmap(final Canvas p0);
    
    @Override
    public Bitmap onLoadBitmap() {
        final Bitmap ensureLoadedBitmapIsMutable = this.ensureLoadedBitmapIsMutable(this.mTextureSource.onLoadBitmap());
        this.onDecorateBitmap(new Canvas(ensureLoadedBitmapIsMutable));
        return ensureLoadedBitmapIsMutable;
    }
}
