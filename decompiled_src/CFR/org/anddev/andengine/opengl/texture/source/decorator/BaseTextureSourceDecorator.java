/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Bitmap
 *  android.graphics.Bitmap$Config
 *  android.graphics.Canvas
 *  android.graphics.Paint
 */
package org.anddev.andengine.opengl.texture.source.decorator;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import org.anddev.andengine.opengl.texture.source.ITextureSource;

public abstract class BaseTextureSourceDecorator
implements ITextureSource {
    protected final boolean mAntiAliasing;
    protected final Paint mPaint = new Paint();
    protected final ITextureSource mTextureSource;

    public BaseTextureSourceDecorator(ITextureSource iTextureSource) {
        this(iTextureSource, false);
    }

    public BaseTextureSourceDecorator(ITextureSource iTextureSource, boolean bl) {
        this.mTextureSource = iTextureSource;
        this.mAntiAliasing = bl;
        this.mPaint.setAntiAlias(bl);
    }

    private Bitmap ensureLoadedBitmapIsMutable(Bitmap bitmap) {
        if (bitmap.isMutable()) {
            return bitmap;
        }
        Bitmap bitmap2 = bitmap.copy(bitmap.getConfig(), true);
        bitmap.recycle();
        return bitmap2;
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

    protected abstract void onDecorateBitmap(Canvas var1);

    @Override
    public Bitmap onLoadBitmap() {
        Bitmap bitmap = this.ensureLoadedBitmapIsMutable(this.mTextureSource.onLoadBitmap());
        this.onDecorateBitmap(new Canvas(bitmap));
        return bitmap;
    }
}

