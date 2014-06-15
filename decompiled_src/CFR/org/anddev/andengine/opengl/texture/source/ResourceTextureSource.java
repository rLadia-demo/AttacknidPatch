/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.res.Resources
 *  android.graphics.Bitmap
 *  android.graphics.Bitmap$Config
 *  android.graphics.BitmapFactory
 *  android.graphics.BitmapFactory$Options
 */
package org.anddev.andengine.opengl.texture.source;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import org.anddev.andengine.opengl.texture.source.ITextureSource;

public class ResourceTextureSource
implements ITextureSource {
    private final Context mContext;
    private final int mDrawableResourceID;
    private final int mHeight;
    private final int mWidth;

    public ResourceTextureSource(Context context, int n) {
        this.mContext = context;
        this.mDrawableResourceID = n;
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeResource((Resources)context.getResources(), (int)n, (BitmapFactory.Options)options);
        this.mWidth = options.outWidth;
        this.mHeight = options.outHeight;
    }

    protected ResourceTextureSource(Context context, int n, int n2, int n3) {
        this.mContext = context;
        this.mDrawableResourceID = n;
        this.mWidth = n2;
        this.mHeight = n3;
    }

    @Override
    public ResourceTextureSource clone() {
        return new ResourceTextureSource(this.mContext, this.mDrawableResourceID, this.mWidth, this.mHeight);
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
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
        return BitmapFactory.decodeResource((Resources)this.mContext.getResources(), (int)this.mDrawableResourceID, (BitmapFactory.Options)options);
    }

    public String toString() {
        return String.valueOf(this.getClass().getSimpleName()) + "(" + this.mDrawableResourceID + ")";
    }
}

