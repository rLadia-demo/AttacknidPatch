package org.anddev.andengine.opengl.texture;

import java.util.*;
import javax.microedition.khronos.opengles.*;

public class TextureManager
{
    private final ArrayList<Texture> mTexturesLoaded;
    private final HashSet<Texture> mTexturesManaged;
    private final ArrayList<Texture> mTexturesToBeLoaded;
    private final ArrayList<Texture> mTexturesToBeUnloaded;
    
    public TextureManager() {
        super();
        this.mTexturesManaged = new HashSet<Texture>();
        this.mTexturesLoaded = new ArrayList<Texture>();
        this.mTexturesToBeLoaded = new ArrayList<Texture>();
        this.mTexturesToBeUnloaded = new ArrayList<Texture>();
    }
    
    protected void clear() {
        this.mTexturesToBeLoaded.clear();
        this.mTexturesLoaded.clear();
        this.mTexturesManaged.clear();
    }
    
    public boolean loadTexture(final Texture texture) {
        if (this.mTexturesManaged.contains(texture)) {
            this.mTexturesToBeUnloaded.remove(texture);
            return false;
        }
        this.mTexturesManaged.add(texture);
        this.mTexturesToBeLoaded.add(texture);
        return true;
    }
    
    public void loadTextures(final Texture... array) {
        for (int i = -1 + array.length; i >= 0; --i) {
            this.loadTexture(array[i]);
        }
    }
    
    public void reloadTextures() {
        final Iterator<Texture> iterator = this.mTexturesManaged.iterator();
        while (iterator.hasNext()) {
            iterator.next().setLoadedToHardware(false);
        }
        this.mTexturesToBeLoaded.addAll(this.mTexturesLoaded);
        this.mTexturesLoaded.clear();
        this.mTexturesManaged.removeAll(this.mTexturesToBeUnloaded);
        this.mTexturesToBeUnloaded.clear();
    }
    
    public boolean unloadTexture(final Texture texture) {
        if (this.mTexturesManaged.contains(texture)) {
            if (this.mTexturesLoaded.contains(texture)) {
                this.mTexturesToBeUnloaded.add(texture);
            }
            else if (this.mTexturesToBeLoaded.remove(texture)) {
                this.mTexturesManaged.remove(texture);
            }
            return true;
        }
        return false;
    }
    
    public void unloadTextures(final Texture... array) {
        for (int i = -1 + array.length; i >= 0; --i) {
            this.unloadTexture(array[i]);
        }
    }
    
    public void updateTextures(final GL10 gl10) {
        final HashSet<Texture> mTexturesManaged = this.mTexturesManaged;
        final ArrayList<Texture> mTexturesLoaded = this.mTexturesLoaded;
        final ArrayList<Texture> mTexturesToBeLoaded = this.mTexturesToBeLoaded;
        final ArrayList<Texture> mTexturesToBeUnloaded = this.mTexturesToBeUnloaded;
        final int size = mTexturesLoaded.size();
        if (size > 0) {
            for (int i = size - 1; i >= 0; --i) {
                final Texture texture = mTexturesLoaded.get(i);
                if (texture.isUpdateOnHardwareNeeded()) {
                    texture.unloadFromHardware(gl10);
                    texture.loadToHardware(gl10);
                }
            }
        }
        final int size2 = mTexturesToBeLoaded.size();
        if (size2 > 0) {
            for (int j = size2 - 1; j >= 0; --j) {
                final Texture texture2 = mTexturesToBeLoaded.remove(j);
                if (!texture2.isLoadedToHardware()) {
                    texture2.loadToHardware(gl10);
                }
                mTexturesLoaded.add(texture2);
            }
        }
        final int size3 = mTexturesToBeUnloaded.size();
        if (size3 > 0) {
            for (int k = size3 - 1; k >= 0; --k) {
                final Texture texture3 = mTexturesToBeUnloaded.remove(k);
                if (texture3.isLoadedToHardware()) {
                    texture3.unloadFromHardware(gl10);
                }
                mTexturesLoaded.remove(texture3);
                mTexturesManaged.remove(texture3);
            }
        }
        if (size2 > 0 || size3 > 0) {
            System.gc();
        }
    }
}
