/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.SparseArray
 */
package org.anddev.andengine.opengl.texture.region;

import android.util.SparseArray;
import org.anddev.andengine.opengl.texture.region.BaseTextureRegion;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.texture.region.TiledTextureRegion;
import org.anddev.andengine.util.Library;

public class TextureRegionLibrary
extends Library<BaseTextureRegion> {
    public TextureRegionLibrary() {
    }

    public TextureRegionLibrary(int n) {
        super(n);
    }

    @Override
    public TextureRegion get(int n) {
        return (TextureRegion)super.get(n);
    }

    public TiledTextureRegion getTiled(int n) {
        return (TiledTextureRegion)this.mItems.get(n);
    }
}

