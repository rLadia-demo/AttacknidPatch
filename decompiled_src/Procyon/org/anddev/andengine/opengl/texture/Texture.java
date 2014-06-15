package org.anddev.andengine.opengl.texture;

import java.util.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.opengl.util.*;
import org.anddev.andengine.opengl.texture.source.*;
import android.graphics.*;
import android.opengl.*;
import org.anddev.andengine.util.*;

public class Texture
{
    private static final int[] HARDWARETEXTUREID_FETCHER;
    private int mHardwareTextureID;
    private final int mHeight;
    private boolean mLoadedToHardware;
    private final TextureOptions mTextureOptions;
    private final ArrayList<TextureSourceWithLocation> mTextureSources;
    private final ITextureStateListener mTextureStateListener;
    protected boolean mUpdateOnHardwareNeeded;
    private final int mWidth;
    
    static {
        HARDWARETEXTUREID_FETCHER = new int[1];
    }
    
    public Texture(final int n, final int n2) {
        this(n, n2, TextureOptions.DEFAULT, null);
    }
    
    public Texture(final int n, final int n2, final ITextureStateListener textureStateListener) {
        this(n, n2, TextureOptions.DEFAULT, textureStateListener);
    }
    
    public Texture(final int n, final int n2, final TextureOptions textureOptions) throws IllegalArgumentException {
        this(n, n2, textureOptions, null);
    }
    
    public Texture(final int mWidth, final int mHeight, final TextureOptions mTextureOptions, final ITextureStateListener mTextureStateListener) throws IllegalArgumentException {
        super();
        this.mHardwareTextureID = -1;
        this.mTextureSources = new ArrayList<TextureSourceWithLocation>();
        this.mUpdateOnHardwareNeeded = false;
        if (!MathUtils.isPowerOfTwo(mWidth) || !MathUtils.isPowerOfTwo(mHeight)) {
            throw new IllegalArgumentException("Width and Height of a Texture must be a power of 2!");
        }
        this.mWidth = mWidth;
        this.mHeight = mHeight;
        this.mTextureOptions = mTextureOptions;
        this.mTextureStateListener = mTextureStateListener;
    }
    
    private void allocateAndBindTextureOnHardware(final GL10 gl10) {
        GLHelper.bindTexture(gl10, this.mHardwareTextureID);
        sendPlaceholderBitmapToHardware(this.mWidth, this.mHeight);
    }
    
    private void applyTextureOptions(final GL10 gl10) {
        final TextureOptions mTextureOptions = this.mTextureOptions;
        gl10.glTexParameterf(3553, 10241, (float)mTextureOptions.mMinFilter);
        gl10.glTexParameterf(3553, 10240, (float)mTextureOptions.mMagFilter);
        gl10.glTexParameterf(3553, 10242, mTextureOptions.mWrapS);
        gl10.glTexParameterf(3553, 10243, mTextureOptions.mWrapT);
        gl10.glTexEnvf(8960, 8704, (float)mTextureOptions.mTextureEnvironment);
    }
    
    private void checkTextureSourcePosition(final ITextureSource textureSource, final int n, final int n2) throws IllegalArgumentException {
        if (n < 0) {
            throw new IllegalArgumentException("Illegal negative pTexturePositionX supplied: '" + n + "'");
        }
        if (n2 < 0) {
            throw new IllegalArgumentException("Illegal negative pTexturePositionY supplied: '" + n2 + "'");
        }
        if (n + textureSource.getWidth() > this.mWidth || n2 + textureSource.getHeight() > this.mHeight) {
            throw new IllegalArgumentException("Supplied TextureSource must not exceed bounds of Texture.");
        }
    }
    
    private void deleteTextureOnHardware(final GL10 gl10) {
        GLHelper.deleteTexture(gl10, this.mHardwareTextureID);
    }
    
    private static int generateHardwareTextureID(final GL10 gl10) {
        gl10.glGenTextures(1, Texture.HARDWARETEXTUREID_FETCHER, 0);
        return Texture.HARDWARETEXTUREID_FETCHER[0];
    }
    
    private static void sendPlaceholderBitmapToHardware(final int n, final int n2) {
        final Bitmap bitmap = Bitmap.createBitmap(n, n2, Bitmap$Config.ARGB_8888);
        GLUtils.texImage2D(3553, 0, bitmap, 0);
        bitmap.recycle();
    }
    
    private void writeTextureToHardware(final GL10 gl10) {
        final boolean mPreMultipyAlpha = this.mTextureOptions.mPreMultipyAlpha;
        final ArrayList<TextureSourceWithLocation> mTextureSources = this.mTextureSources;
        for (int size = mTextureSources.size(), i = 0; i < size; ++i) {
            final TextureSourceWithLocation textureSourceWithLocation = mTextureSources.get(i);
            if (textureSourceWithLocation != null) {
                final Bitmap onLoadBitmap = textureSourceWithLocation.onLoadBitmap();
                if (onLoadBitmap == null) {
                    try {
                        throw new IllegalArgumentException("TextureSource: " + textureSourceWithLocation.toString() + " returned a null Bitmap.");
                    }
                    catch (IllegalArgumentException ex) {
                        Debug.e("Error loading: " + textureSourceWithLocation.toString(), ex);
                        if (this.mTextureStateListener == null) {
                            throw ex;
                        }
                        this.mTextureStateListener.onTextureSourceLoadExeption(this, textureSourceWithLocation.mTextureSource, ex);
                    }
                    continue;
                }
                if (mPreMultipyAlpha) {
                    GLUtils.texSubImage2D(3553, 0, textureSourceWithLocation.getTexturePositionX(), textureSourceWithLocation.getTexturePositionY(), onLoadBitmap, 6408, 5121);
                }
                else {
                    GLHelper.glTexSubImage2D(gl10, 3553, 0, textureSourceWithLocation.getTexturePositionX(), textureSourceWithLocation.getTexturePositionY(), onLoadBitmap, 6408, 5121);
                }
                onLoadBitmap.recycle();
            }
        }
    }
    
    public TextureSourceWithLocation addTextureSource(final ITextureSource textureSource, final int n, final int n2) throws IllegalArgumentException {
        this.checkTextureSourcePosition(textureSource, n, n2);
        final TextureSourceWithLocation textureSourceWithLocation = new TextureSourceWithLocation(textureSource, n, n2);
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
    
    public void loadToHardware(final GL10 gl10) {
        GLHelper.enableTextures(gl10);
        this.mHardwareTextureID = generateHardwareTextureID(gl10);
        this.allocateAndBindTextureOnHardware(gl10);
        this.applyTextureOptions(gl10);
        this.writeTextureToHardware(gl10);
        this.mUpdateOnHardwareNeeded = false;
        this.mLoadedToHardware = true;
        if (this.mTextureStateListener != null) {
            this.mTextureStateListener.onLoadedToHardware(this);
        }
    }
    
    public void removeTextureSource(final ITextureSource textureSource, final int n, final int n2) {
        final ArrayList<TextureSourceWithLocation> mTextureSources = this.mTextureSources;
        for (int i = -1 + mTextureSources.size(); i >= 0; --i) {
            final TextureSourceWithLocation textureSourceWithLocation = mTextureSources.get(i);
            if (textureSourceWithLocation.mTextureSource == textureSource && textureSourceWithLocation.mTexturePositionX == n && textureSourceWithLocation.mTexturePositionY == n2) {
                mTextureSources.remove(i);
                this.mUpdateOnHardwareNeeded = true;
                return;
            }
        }
    }
    
    void setLoadedToHardware(final boolean mLoadedToHardware) {
        this.mLoadedToHardware = mLoadedToHardware;
    }
    
    public void unloadFromHardware(final GL10 gl10) {
        GLHelper.enableTextures(gl10);
        this.deleteTextureOnHardware(gl10);
        this.mHardwareTextureID = -1;
        this.mLoadedToHardware = false;
        if (this.mTextureStateListener != null) {
            this.mTextureStateListener.onUnloadedFromHardware(this);
        }
    }
    
    public interface ITextureStateListener
    {
        void onLoadedToHardware(Texture p0);
        
        void onTextureSourceLoadExeption(Texture p0, ITextureSource p1, Throwable p2);
        
        void onUnloadedFromHardware(Texture p0);
        
        public static class DebugTextureStateListener implements ITextureStateListener
        {
            @Override
            public void onLoadedToHardware(Texture texture) {
                Debug.d("Texture loaded: " + texture.toString());
            }
            
            @Override
            public void onTextureSourceLoadExeption(Texture texture, ITextureSource textureSource, Throwable t) {
                Debug.e("Exception loading TextureSource. Texture: " + texture.toString() + " TextureSource: " + textureSource.toString(), t);
            }
            
            @Override
            public void onUnloadedFromHardware(Texture texture) {
                Debug.d("Texture unloaded: " + texture.toString());
            }
        }
        
        public static class TextureStateAdapter implements ITextureStateListener
        {
            @Override
            public void onLoadedToHardware(Texture texture) {
            }
            
            @Override
            public void onTextureSourceLoadExeption(Texture texture, ITextureSource textureSource, Throwable t) {
            }
            
            @Override
            public void onUnloadedFromHardware(Texture texture) {
            }
        }
    }
    
    public static class TextureSourceWithLocation
    {
        private final int mTexturePositionX;
        private final int mTexturePositionY;
        private final ITextureSource mTextureSource;
        
        public TextureSourceWithLocation(final ITextureSource mTextureSource, final int mTexturePositionX, final int mTexturePositionY) {
            super();
            this.mTextureSource = mTextureSource;
            this.mTexturePositionX = mTexturePositionX;
            this.mTexturePositionY = mTexturePositionY;
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
        
        @Override
        public String toString() {
            return this.mTextureSource.toString();
        }
    }
}
