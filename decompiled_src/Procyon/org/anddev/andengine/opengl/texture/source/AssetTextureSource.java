package org.anddev.andengine.opengl.texture.source;

import android.content.*;
import org.anddev.andengine.util.*;
import java.io.*;
import android.graphics.*;

public class AssetTextureSource implements ITextureSource
{
    private final String mAssetPath;
    private final Context mContext;
    private final int mHeight;
    private final int mWidth;
    
    public AssetTextureSource(final Context mContext, final String mAssetPath) {
        super();
        this.mContext = mContext;
        this.mAssetPath = mAssetPath;
        final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
        bitmapFactory$Options.inJustDecodeBounds = true;
        InputStream open = null;
        while (true) {
            try {
                open = mContext.getAssets().open(mAssetPath);
                BitmapFactory.decodeStream(open, (Rect)null, bitmapFactory$Options);
                StreamUtils.closeStream(open);
                this.mWidth = bitmapFactory$Options.outWidth;
                this.mHeight = bitmapFactory$Options.outHeight;
            }
            catch (IOException ex) {
                Debug.e("Failed loading Bitmap in AssetTextureSource. AssetPath: " + mAssetPath, ex);
                StreamUtils.closeStream(open);
                continue;
            }
            finally {
                StreamUtils.closeStream(open);
            }
            break;
        }
    }
    
    AssetTextureSource(final Context mContext, final String mAssetPath, final int mWidth, final int mHeight) {
        super();
        this.mContext = mContext;
        this.mAssetPath = mAssetPath;
        this.mWidth = mWidth;
        this.mHeight = mHeight;
    }
    
    @Override
    public AssetTextureSource clone() {
        return new AssetTextureSource(this.mContext, this.mAssetPath, this.mWidth, this.mHeight);
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
        InputStream open = null;
        try {
            final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
            bitmapFactory$Options.inPreferredConfig = Bitmap$Config.ARGB_8888;
            open = this.mContext.getAssets().open(this.mAssetPath);
            return BitmapFactory.decodeStream(open, (Rect)null, bitmapFactory$Options);
        }
        catch (IOException ex) {
            Debug.e("Failed loading Bitmap in AssetTextureSource. AssetPath: " + this.mAssetPath, ex);
            return null;
        }
        finally {
            StreamUtils.closeStream(open);
        }
    }
    
    @Override
    public String toString() {
        return String.valueOf(this.getClass().getSimpleName()) + "(" + this.mAssetPath + ")";
    }
}
