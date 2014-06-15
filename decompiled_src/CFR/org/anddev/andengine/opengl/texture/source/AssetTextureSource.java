/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.res.AssetManager
 *  android.graphics.Bitmap
 *  android.graphics.Bitmap$Config
 *  android.graphics.BitmapFactory
 *  android.graphics.BitmapFactory$Options
 *  android.graphics.Rect
 */
package org.anddev.andengine.opengl.texture.source;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Rect;
import java.io.IOException;
import java.io.InputStream;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.StreamUtils;

public class AssetTextureSource
implements ITextureSource {
    private final String mAssetPath;
    private final Context mContext;
    private final int mHeight;
    private final int mWidth;

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public AssetTextureSource(Context context, String string) {
        this.mContext = context;
        this.mAssetPath = string;
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        InputStream inputStream = null;
        try {
            inputStream = context.getAssets().open(string);
            BitmapFactory.decodeStream((InputStream)inputStream, (Rect)null, (BitmapFactory.Options)options);
        }
        catch (IOException var6_5) {
            Debug.e("Failed loading Bitmap in AssetTextureSource. AssetPath: " + string, var6_5);
        }
        finally {
            StreamUtils.closeStream(inputStream);
        }
        this.mWidth = options.outWidth;
        this.mHeight = options.outHeight;
    }

    AssetTextureSource(Context context, String string, int n, int n2) {
        this.mContext = context;
        this.mAssetPath = string;
        this.mWidth = n;
        this.mHeight = n2;
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
        InputStream inputStream = null;
        try {
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inPreferredConfig = Bitmap.Config.ARGB_8888;
            inputStream = this.mContext.getAssets().open(this.mAssetPath);
            Bitmap bitmap = BitmapFactory.decodeStream((InputStream)inputStream, (Rect)null, (BitmapFactory.Options)options);
            return bitmap;
        }
        catch (IOException var4_4) {
            Debug.e("Failed loading Bitmap in AssetTextureSource. AssetPath: " + this.mAssetPath, var4_4);
            return null;
        }
        finally {
            StreamUtils.closeStream(inputStream);
        }
    }

    public String toString() {
        return String.valueOf(this.getClass().getSimpleName()) + "(" + this.mAssetPath + ")";
    }
}

