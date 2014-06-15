/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.texture;

import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.util.MathUtils;

public class TextureFactory {
    public static Texture createForTextureRegionSize(TextureRegion textureRegion, TextureOptions textureOptions) {
        int n = textureRegion.getWidth();
        int n2 = textureRegion.getHeight();
        return new Texture(MathUtils.nextPowerOfTwo(n), MathUtils.nextPowerOfTwo(n2), textureOptions);
    }

    public static Texture createForTextureSourceSize(TextureRegion textureRegion) {
        return TextureFactory.createForTextureRegionSize(textureRegion, TextureOptions.DEFAULT);
    }

    public static Texture createForTextureSourceSize(ITextureSource iTextureSource) {
        return TextureFactory.createForTextureSourceSize(iTextureSource, TextureOptions.DEFAULT);
    }

    public static Texture createForTextureSourceSize(ITextureSource iTextureSource, TextureOptions textureOptions) {
        int n = iTextureSource.getWidth();
        int n2 = iTextureSource.getHeight();
        return new Texture(MathUtils.nextPowerOfTwo(n), MathUtils.nextPowerOfTwo(n2), textureOptions);
    }
}

