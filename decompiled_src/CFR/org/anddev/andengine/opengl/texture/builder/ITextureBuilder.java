/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.texture.builder;

import java.util.ArrayList;
import org.anddev.andengine.opengl.texture.BuildableTexture;

public interface ITextureBuilder {
    public void pack(BuildableTexture var1, ArrayList<BuildableTexture.TextureSourceWithWithLocationCallback> var2) throws TextureSourcePackingException;

    public static class TextureSourcePackingException
    extends Exception {
        private static final long serialVersionUID = 4700734424214372671L;
    }

}

