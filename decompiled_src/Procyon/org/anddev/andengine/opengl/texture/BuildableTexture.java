package org.anddev.andengine.opengl.texture;

import java.util.*;
import org.anddev.andengine.opengl.texture.source.*;
import org.anddev.andengine.util.*;
import org.anddev.andengine.opengl.texture.builder.*;
import android.graphics.*;

public class BuildableTexture extends Texture
{
    private final ArrayList<TextureSourceWithWithLocationCallback> mTextureSourcesToPlace;
    
    public BuildableTexture(final int n, final int n2) {
        super(n, n2, TextureOptions.DEFAULT, null);
        this.mTextureSourcesToPlace = new ArrayList<TextureSourceWithWithLocationCallback>();
    }
    
    public BuildableTexture(final int n, final int n2, final ITextureStateListener textureStateListener) {
        super(n, n2, TextureOptions.DEFAULT, textureStateListener);
        this.mTextureSourcesToPlace = new ArrayList<TextureSourceWithWithLocationCallback>();
    }
    
    public BuildableTexture(final int n, final int n2, final TextureOptions textureOptions) throws IllegalArgumentException {
        super(n, n2, textureOptions, null);
        this.mTextureSourcesToPlace = new ArrayList<TextureSourceWithWithLocationCallback>();
    }
    
    public BuildableTexture(final int n, final int n2, final TextureOptions textureOptions, final ITextureStateListener textureStateListener) throws IllegalArgumentException {
        super(n, n2, textureOptions, textureStateListener);
        this.mTextureSourcesToPlace = new ArrayList<TextureSourceWithWithLocationCallback>();
    }
    
    @Deprecated
    @Override
    public TextureSourceWithLocation addTextureSource(final ITextureSource textureSource, final int n, final int n2) {
        return super.addTextureSource(textureSource, n, n2);
    }
    
    public void addTextureSource(final ITextureSource textureSource, final Callback<TextureSourceWithLocation> callback) {
        this.mTextureSourcesToPlace.add(new TextureSourceWithWithLocationCallback(textureSource, callback));
    }
    
    public void build(final ITextureBuilder textureBuilder) throws ITextureBuilder.TextureSourcePackingException {
        textureBuilder.pack(this, this.mTextureSourcesToPlace);
        this.mTextureSourcesToPlace.clear();
        this.mUpdateOnHardwareNeeded = true;
    }
    
    @Override
    public void clearTextureSources() {
        super.clearTextureSources();
        this.mTextureSourcesToPlace.clear();
    }
    
    public void removeTextureSource(final ITextureSource textureSource) {
        final ArrayList<TextureSourceWithWithLocationCallback> mTextureSourcesToPlace = this.mTextureSourcesToPlace;
        for (int i = -1 + mTextureSourcesToPlace.size(); i >= 0; --i) {
            if (mTextureSourcesToPlace.get(i).mTextureSource == textureSource) {
                mTextureSourcesToPlace.remove(i);
                this.mUpdateOnHardwareNeeded = true;
                return;
            }
        }
    }
    
    public static class TextureSourceWithWithLocationCallback implements ITextureSource
    {
        private final Callback<TextureSourceWithLocation> mCallback;
        private final ITextureSource mTextureSource;
        
        public TextureSourceWithWithLocationCallback(final ITextureSource mTextureSource, final Callback<TextureSourceWithLocation> mCallback) {
            super();
            this.mTextureSource = mTextureSource;
            this.mCallback = mCallback;
        }
        
        @Override
        public TextureSourceWithWithLocationCallback clone() {
            return null;
        }
        
        public Callback<TextureSourceWithLocation> getCallback() {
            return this.mCallback;
        }
        
        @Override
        public int getHeight() {
            return this.mTextureSource.getHeight();
        }
        
        public ITextureSource getTextureSource() {
            return this.mTextureSource;
        }
        
        @Override
        public int getWidth() {
            return this.mTextureSource.getWidth();
        }
        
        @Override
        public Bitmap onLoadBitmap() {
            return this.mTextureSource.onLoadBitmap();
        }
        
        @Override
        public String toString() {
            return this.mTextureSource.toString();
        }
    }
}
