package org.anddev.andengine.opengl.texture.source;

import android.content.*;
import android.graphics.*;

public class ResourceTextureSource implements ITextureSource
{
    private final Context mContext;
    private final int mDrawableResourceID;
    private final int mHeight;
    private final int mWidth;
    
    public ResourceTextureSource(final Context mContext, final int mDrawableResourceID) {
        super();
        this.mContext = mContext;
        this.mDrawableResourceID = mDrawableResourceID;
        final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
        bitmapFactory$Options.inJustDecodeBounds = true;
        BitmapFactory.decodeResource(mContext.getResources(), mDrawableResourceID, bitmapFactory$Options);
        this.mWidth = bitmapFactory$Options.outWidth;
        this.mHeight = bitmapFactory$Options.outHeight;
    }
    
    protected ResourceTextureSource(final Context mContext, final int mDrawableResourceID, final int mWidth, final int mHeight) {
        super();
        this.mContext = mContext;
        this.mDrawableResourceID = mDrawableResourceID;
        this.mWidth = mWidth;
        this.mHeight = mHeight;
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
        final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
        bitmapFactory$Options.inPreferredConfig = Bitmap$Config.ARGB_8888;
        return BitmapFactory.decodeResource(this.mContext.getResources(), this.mDrawableResourceID, bitmapFactory$Options);
    }
    
    @Override
    public String toString() {
        return String.valueOf(this.getClass().getSimpleName()) + "(" + this.mDrawableResourceID + ")";
    }
}
