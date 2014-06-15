package org.anddev.andengine.opengl.texture;

import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.util.*;
import org.anddev.andengine.opengl.texture.source.*;

public class TextureFactory
{
    public static Texture createForTextureRegionSize(final TextureRegion textureRegion, final TextureOptions textureOptions) {
        return new Texture(MathUtils.nextPowerOfTwo(textureRegion.getWidth()), MathUtils.nextPowerOfTwo(textureRegion.getHeight()), textureOptions);
    }
    
    public static Texture createForTextureSourceSize(final TextureRegion textureRegion) {
        return createForTextureRegionSize(textureRegion, TextureOptions.DEFAULT);
    }
    
    public static Texture createForTextureSourceSize(final ITextureSource textureSource) {
        return createForTextureSourceSize(textureSource, TextureOptions.DEFAULT);
    }
    
    public static Texture createForTextureSourceSize(final ITextureSource textureSource, final TextureOptions textureOptions) {
        return new Texture(MathUtils.nextPowerOfTwo(textureSource.getWidth()), MathUtils.nextPowerOfTwo(textureSource.getHeight()), textureOptions);
    }
}
