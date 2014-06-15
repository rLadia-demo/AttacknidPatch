/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Bitmap
 *  android.graphics.Bitmap$Config
 *  android.graphics.BitmapFactory
 *  android.graphics.BitmapFactory$Options
 *  android.graphics.Rect
 */
package org.anddev.andengine.opengl.texture.source;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Rect;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.StreamUtils;

public class FileTextureSource
implements ITextureSource {
    private final File mFile;
    private final int mHeight;
    private final int mWidth;

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public FileTextureSource(File var1_1) {
        block8 : {
            super();
            this.mFile = var1_1;
            var2_2 = new BitmapFactory.Options();
            var2_2.inJustDecodeBounds = true;
            var3_3 = null;
            try {
                var4_4 = new FileInputStream(var1_1);
                ** try [egrp 1[TRYBLOCK] [3, 2 : 34->42)] { 
            }
            catch (IOException var5_5) {}
lbl-1000: // 1 sources:
            {
                BitmapFactory.decodeStream((InputStream)var4_4, (Rect)null, (BitmapFactory.Options)var2_2);
            }
            StreamUtils.closeStream(var4_4);
            ** GOTO lbl26
            ** GOTO lbl-1000
lbl14: // 1 sources:
            catch (Throwable var6_6) {
                var3_3 = var4_4;
                throw var6_6;
            }
lbl17: // 1 sources:
            catch (IOException var5_5) {
                var3_3 = var4_4;
            }
lbl-1000: // 2 sources:
            {
                Debug.e("Failed loading Bitmap in FileTextureSource. File: " + var1_1, var5_5);
                break block8;
            }
            finally {
                StreamUtils.closeStream(var3_3);
            }
        }
        this.mWidth = var2_2.outWidth;
        this.mHeight = var2_2.outHeight;
    }

    FileTextureSource(File file, int n, int n2) {
        this.mFile = file;
        this.mWidth = n;
        this.mHeight = n2;
    }

    @Override
    public FileTextureSource clone() {
        return new FileTextureSource(this.mFile, this.mWidth, this.mHeight);
    }

    @Override
    public int getHeight() {
        return this.mHeight;
    }

    @Override
    public int getWidth() {
        return this.mWidth;
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    @Override
    public Bitmap onLoadBitmap() {
        var1_1 = new BitmapFactory.Options();
        var1_1.inPreferredConfig = Bitmap.Config.ARGB_8888;
        var2_2 = null;
        try {
            var3_3 = new FileInputStream(this.mFile);
            ** try [egrp 1[TRYBLOCK] [3, 2 : 29->37)] { 
        }
        catch (IOException var4_5) {}
lbl-1000: // 1 sources:
        {
            var6_4 = BitmapFactory.decodeStream((InputStream)var3_3, (Rect)null, (BitmapFactory.Options)var1_1);
        }
        StreamUtils.closeStream(var3_3);
        return var6_4;
        ** GOTO lbl-1000
lbl12: // 1 sources:
        catch (Throwable var5_6) {
            var2_2 = var3_3;
            throw var5_6;
        }
lbl15: // 1 sources:
        catch (IOException var4_5) {
            var2_2 = var3_3;
        }
lbl-1000: // 2 sources:
        {
            Debug.e("Failed loading Bitmap in FileTextureSource. File: " + this.mFile, var4_5);
            return null;
        }
        finally {
            StreamUtils.closeStream(var2_2);
        }
    }

    public String toString() {
        return String.valueOf(this.getClass().getSimpleName()) + "(" + this.mFile + ")";
    }
}

