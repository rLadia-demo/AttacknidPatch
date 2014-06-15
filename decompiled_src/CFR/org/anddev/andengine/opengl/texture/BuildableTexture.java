/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Bitmap
 */
package org.anddev.andengine.opengl.texture;

import android.graphics.Bitmap;
import java.util.ArrayList;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.builder.ITextureBuilder;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.util.Callback;

public class BuildableTexture
extends Texture {
    private final ArrayList<TextureSourceWithWithLocationCallback> mTextureSourcesToPlace = new ArrayList<TextureSourceWithWithLocationCallback>();

    public BuildableTexture(int n, int n2) {
        super(n, n2, TextureOptions.DEFAULT, null);
    }

    public BuildableTexture(int n, int n2, Texture.ITextureStateListener iTextureStateListener) {
        super(n, n2, TextureOptions.DEFAULT, iTextureStateListener);
    }

    public BuildableTexture(int n, int n2, TextureOptions textureOptions) throws IllegalArgumentException {
        super(n, n2, textureOptions, null);
    }

    public BuildableTexture(int n, int n2, TextureOptions textureOptions, Texture.ITextureStateListener iTextureStateListener) throws IllegalArgumentException {
        super(n, n2, textureOptions, iTextureStateListener);
    }

    @Deprecated
    @Override
    public Texture.TextureSourceWithLocation addTextureSource(ITextureSource iTextureSource, int n, int n2) {
        return super.addTextureSource(iTextureSource, n, n2);
    }

    public void addTextureSource(ITextureSource iTextureSource, Callback<Texture.TextureSourceWithLocation> callback) {
        this.mTextureSourcesToPlace.add(new TextureSourceWithWithLocationCallback(iTextureSource, callback));
    }

    public void build(ITextureBuilder iTextureBuilder) throws ITextureBuilder.TextureSourcePackingException {
        iTextureBuilder.pack(this, this.mTextureSourcesToPlace);
        this.mTextureSourcesToPlace.clear();
        this.mUpdateOnHardwareNeeded = true;
    }

    @Override
    public void clearTextureSources() {
        super.clearTextureSources();
        this.mTextureSourcesToPlace.clear();
    }

    public void removeTextureSource(ITextureSource iTextureSource) {
        ArrayList<TextureSourceWithWithLocationCallback> arrayList = this.mTextureSourcesToPlace;
        int n = -1 + arrayList.size();
        while (n >= 0) {
            if (arrayList.get(n).mTextureSource == iTextureSource) {
                arrayList.remove(n);
                this.mUpdateOnHardwareNeeded = true;
                return;
            }
            --n;
        }
        return;
    }

    public static class TextureSourceWithWithLocationCallback
    implements ITextureSource {
        private final Callback<Texture.TextureSourceWithLocation> mCallback;
        private final ITextureSource mTextureSource;

        public TextureSourceWithWithLocationCallback(ITextureSource iTextureSource, Callback<Texture.TextureSourceWithLocation> callback) {
            this.mTextureSource = iTextureSource;
            this.mCallback = callback;
        }

        @Override
        public TextureSourceWithWithLocationCallback clone() {
            return null;
        }

        public Callback<Texture.TextureSourceWithLocation> getCallback() {
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

        public String toString() {
            return this.mTextureSource.toString();
        }
    }

}

