/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Bitmap
 *  android.graphics.Bitmap$Config
 *  android.opengl.GLUtils
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.opengl.texture;

import android.graphics.Bitmap;
import android.opengl.GLUtils;
import java.util.ArrayList;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.MathUtils;

public class Texture {
    private static final int[] HARDWARETEXTUREID_FETCHER = new int[1];
    private int mHardwareTextureID = -1;
    private final int mHeight;
    private boolean mLoadedToHardware;
    private final TextureOptions mTextureOptions;
    private final ArrayList<TextureSourceWithLocation> mTextureSources = new ArrayList<TextureSourceWithLocation>();
    private final ITextureStateListener mTextureStateListener;
    protected boolean mUpdateOnHardwareNeeded = false;
    private final int mWidth;

    public Texture(int n, int n2) {
        this(n, n2, TextureOptions.DEFAULT, null);
    }

    public Texture(int n, int n2, ITextureStateListener iTextureStateListener) {
        this(n, n2, TextureOptions.DEFAULT, iTextureStateListener);
    }

    public Texture(int n, int n2, TextureOptions textureOptions) throws IllegalArgumentException {
        this(n, n2, textureOptions, null);
    }

    public Texture(int n, int n2, TextureOptions textureOptions, ITextureStateListener iTextureStateListener) throws IllegalArgumentException {
        if (!(MathUtils.isPowerOfTwo(n) && MathUtils.isPowerOfTwo(n2))) {
            throw new IllegalArgumentException("Width and Height of a Texture must be a power of 2!");
        }
        this.mWidth = n;
        this.mHeight = n2;
        this.mTextureOptions = textureOptions;
        this.mTextureStateListener = iTextureStateListener;
    }

    private void allocateAndBindTextureOnHardware(GL10 gL10) {
        GLHelper.bindTexture(gL10, this.mHardwareTextureID);
        Texture.sendPlaceholderBitmapToHardware(this.mWidth, this.mHeight);
    }

    private void applyTextureOptions(GL10 gL10) {
        TextureOptions textureOptions = this.mTextureOptions;
        gL10.glTexParameterf(3553, 10241, (float)textureOptions.mMinFilter);
        gL10.glTexParameterf(3553, 10240, (float)textureOptions.mMagFilter);
        gL10.glTexParameterf(3553, 10242, textureOptions.mWrapS);
        gL10.glTexParameterf(3553, 10243, textureOptions.mWrapT);
        gL10.glTexEnvf(8960, 8704, (float)textureOptions.mTextureEnvironment);
    }

    private void checkTextureSourcePosition(ITextureSource iTextureSource, int n, int n2) throws IllegalArgumentException {
        if (n < 0) {
            throw new IllegalArgumentException("Illegal negative pTexturePositionX supplied: '" + n + "'");
        }
        if (n2 < 0) {
            throw new IllegalArgumentException("Illegal negative pTexturePositionY supplied: '" + n2 + "'");
        }
        if (n + iTextureSource.getWidth() <= this.mWidth && n2 + iTextureSource.getHeight() <= this.mHeight) return;
        throw new IllegalArgumentException("Supplied TextureSource must not exceed bounds of Texture.");
    }

    private void deleteTextureOnHardware(GL10 gL10) {
        GLHelper.deleteTexture(gL10, this.mHardwareTextureID);
    }

    private static int generateHardwareTextureID(GL10 gL10) {
        gL10.glGenTextures(1, Texture.HARDWARETEXTUREID_FETCHER, 0);
        return Texture.HARDWARETEXTUREID_FETCHER[0];
    }

    private static void sendPlaceholderBitmapToHardware(int n, int n2) {
        Bitmap bitmap = Bitmap.createBitmap((int)n, (int)n2, (Bitmap.Config)Bitmap.Config.ARGB_8888);
        GLUtils.texImage2D((int)3553, (int)0, (Bitmap)bitmap, (int)0);
        bitmap.recycle();
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    private void writeTextureToHardware(GL10 var1_1) {
        var2_2 = this.mTextureOptions.mPreMultipyAlpha;
        var3_3 = this.mTextureSources;
        var4_4 = var3_3.size();
        for (var5_5 = 0; var5_5 < var4_4; ++var5_5) {
            block6 : {
                var6_6 = var3_3.get(var5_5);
                if (var6_6 == null) continue;
                if ((var7_7 = var6_6.onLoadBitmap()) == null) {
                    throw new IllegalArgumentException("TextureSource: " + var6_6.toString() + " returned a null Bitmap.");
                }
                if (var2_2) {
                    GLUtils.texSubImage2D((int)3553, (int)0, (int)var6_6.getTexturePositionX(), (int)var6_6.getTexturePositionY(), (Bitmap)var7_7, (int)6408, (int)5121);
                    break block6;
                }
                ** GOTO lbl20
                catch (IllegalArgumentException var8_8) {
                    Debug.e("Error loading: " + var6_6.toString(), var8_8);
                    if (this.mTextureStateListener == null) throw var8_8;
                    this.mTextureStateListener.onTextureSourceLoadExeption(this, TextureSourceWithLocation.access$0(var6_6), var8_8);
                    continue;
                }
lbl20: // 1 sources:
                GLHelper.glTexSubImage2D(var1_1, 3553, 0, var6_6.getTexturePositionX(), var6_6.getTexturePositionY(), var7_7, 6408, 5121);
            }
            var7_7.recycle();
        }
    }

    public TextureSourceWithLocation addTextureSource(ITextureSource iTextureSource, int n, int n2) throws IllegalArgumentException {
        this.checkTextureSourcePosition(iTextureSource, n, n2);
        TextureSourceWithLocation textureSourceWithLocation = new TextureSourceWithLocation(iTextureSource, n, n2);
        this.mTextureSources.add(textureSourceWithLocation);
        this.mUpdateOnHardwareNeeded = true;
        return textureSourceWithLocation;
    }

    public void clearTextureSources() {
        this.mTextureSources.clear();
        this.mUpdateOnHardwareNeeded = true;
    }

    public int getHardwareTextureID() {
        return this.mHardwareTextureID;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public TextureOptions getTextureOptions() {
        return this.mTextureOptions;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public boolean isLoadedToHardware() {
        return this.mLoadedToHardware;
    }

    public boolean isUpdateOnHardwareNeeded() {
        return this.mUpdateOnHardwareNeeded;
    }

    public void loadToHardware(GL10 gL10) {
        GLHelper.enableTextures(gL10);
        this.mHardwareTextureID = Texture.generateHardwareTextureID(gL10);
        this.allocateAndBindTextureOnHardware(gL10);
        this.applyTextureOptions(gL10);
        this.writeTextureToHardware(gL10);
        this.mUpdateOnHardwareNeeded = false;
        this.mLoadedToHardware = true;
        if (this.mTextureStateListener == null) return;
        this.mTextureStateListener.onLoadedToHardware(this);
    }

    public void removeTextureSource(ITextureSource iTextureSource, int n, int n2) {
        ArrayList<TextureSourceWithLocation> arrayList = this.mTextureSources;
        int n3 = -1 + arrayList.size();
        while (n3 >= 0) {
            TextureSourceWithLocation textureSourceWithLocation;
            if ((textureSourceWithLocation = arrayList.get(n3)).mTextureSource == iTextureSource && textureSourceWithLocation.mTexturePositionX == n && textureSourceWithLocation.mTexturePositionY == n2) {
                arrayList.remove(n3);
                this.mUpdateOnHardwareNeeded = true;
                return;
            }
            --n3;
        }
        return;
    }

    void setLoadedToHardware(boolean bl) {
        this.mLoadedToHardware = bl;
    }

    public void unloadFromHardware(GL10 gL10) {
        GLHelper.enableTextures(gL10);
        this.deleteTextureOnHardware(gL10);
        this.mHardwareTextureID = -1;
        this.mLoadedToHardware = false;
        if (this.mTextureStateListener == null) return;
        this.mTextureStateListener.onUnloadedFromHardware(this);
    }

    public interface ITextureStateListener {
        public void onLoadedToHardware(Texture var1);

        public void onTextureSourceLoadExeption(Texture var1, ITextureSource var2, Throwable var3);

        public void onUnloadedFromHardware(Texture var1);

        public static class DebugTextureStateListener
        implements ITextureStateListener {
            @Override
            public void onLoadedToHardware(Texture texture) {
                Debug.d("Texture loaded: " + texture.toString());
            }

            @Override
            public void onTextureSourceLoadExeption(Texture texture, ITextureSource iTextureSource, Throwable throwable) {
                Debug.e("Exception loading TextureSource. Texture: " + texture.toString() + " TextureSource: " + iTextureSource.toString(), throwable);
            }

            @Override
            public void onUnloadedFromHardware(Texture texture) {
                Debug.d("Texture unloaded: " + texture.toString());
            }
        }

        public static class TextureStateAdapter
        implements ITextureStateListener {
            @Override
            public void onLoadedToHardware(Texture texture) {
            }

            @Override
            public void onTextureSourceLoadExeption(Texture texture22, ITextureSource texture22, Throwable texture22) {
            }

            @Override
            public void onUnloadedFromHardware(Texture texture) {
            }
        }

    }

    public static class TextureSourceWithLocation {
        private final int mTexturePositionX;
        private final int mTexturePositionY;
        private final ITextureSource mTextureSource;

        public TextureSourceWithLocation(ITextureSource iTextureSource, int n, int n2) {
            this.mTextureSource = iTextureSource;
            this.mTexturePositionX = n;
            this.mTexturePositionY = n2;
        }

        public int getHeight() {
            return this.mTextureSource.getHeight();
        }

        public int getTexturePositionX() {
            return this.mTexturePositionX;
        }

        public int getTexturePositionY() {
            return this.mTexturePositionY;
        }

        public int getWidth() {
            return this.mTextureSource.getWidth();
        }

        public Bitmap onLoadBitmap() {
            return this.mTextureSource.onLoadBitmap();
        }

        public String toString() {
            return this.mTextureSource.toString();
        }
    }

}

