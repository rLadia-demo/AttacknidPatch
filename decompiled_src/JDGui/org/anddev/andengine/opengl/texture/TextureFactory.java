package org.anddev.andengine.opengl.texture;

import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.util.MathUtils;

public class TextureFactory
{
  public static Texture createForTextureRegionSize(TextureRegion paramTextureRegion, TextureOptions paramTextureOptions)
  {
    int i = paramTextureRegion.getWidth();
    int j = paramTextureRegion.getHeight();
    return new Texture(MathUtils.nextPowerOfTwo(i), MathUtils.nextPowerOfTwo(j), paramTextureOptions);
  }
  
  public static Texture createForTextureSourceSize(TextureRegion paramTextureRegion)
  {
    return createForTextureRegionSize(paramTextureRegion, TextureOptions.DEFAULT);
  }
  
  public static Texture createForTextureSourceSize(ITextureSource paramITextureSource)
  {
    return createForTextureSourceSize(paramITextureSource, TextureOptions.DEFAULT);
  }
  
  public static Texture createForTextureSourceSize(ITextureSource paramITextureSource, TextureOptions paramTextureOptions)
  {
    int i = paramITextureSource.getWidth();
    int j = paramITextureSource.getHeight();
    return new Texture(MathUtils.nextPowerOfTwo(i), MathUtils.nextPowerOfTwo(j), paramTextureOptions);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.TextureFactory
 * JD-Core Version:    0.7.0.1
 */