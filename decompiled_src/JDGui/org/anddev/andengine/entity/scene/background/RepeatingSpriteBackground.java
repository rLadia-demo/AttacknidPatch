package org.anddev.andengine.entity.scene.background;

import org.anddev.andengine.entity.sprite.Sprite;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.texture.region.TextureRegionFactory;
import org.anddev.andengine.opengl.texture.source.ITextureSource;

public class RepeatingSpriteBackground
  extends SpriteBackground
{
  private Texture mTexture;
  
  public RepeatingSpriteBackground(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, TextureManager paramTextureManager, ITextureSource paramITextureSource)
    throws IllegalArgumentException
  {
    super(paramFloat1, paramFloat2, paramFloat3, null);
    this.mEntity = loadSprite(paramFloat4, paramFloat5, paramTextureManager, paramITextureSource);
  }
  
  public RepeatingSpriteBackground(float paramFloat1, float paramFloat2, TextureManager paramTextureManager, ITextureSource paramITextureSource)
    throws IllegalArgumentException
  {
    super(null);
    this.mEntity = loadSprite(paramFloat1, paramFloat2, paramTextureManager, paramITextureSource);
  }
  
  private Sprite loadSprite(float paramFloat1, float paramFloat2, TextureManager paramTextureManager, ITextureSource paramITextureSource)
    throws IllegalArgumentException
  {
    this.mTexture = new Texture(paramITextureSource.getWidth(), paramITextureSource.getHeight(), TextureOptions.REPEATING_PREMULTIPLYALPHA);
    TextureRegion localTextureRegion = TextureRegionFactory.createFromSource(this.mTexture, paramITextureSource, 0, 0);
    int i = Math.round(paramFloat1);
    int j = Math.round(paramFloat2);
    localTextureRegion.setWidth(i);
    localTextureRegion.setHeight(j);
    paramTextureManager.loadTexture(this.mTexture);
    return new Sprite(0.0F, 0.0F, i, j, localTextureRegion);
  }
  
  public Texture getTexture()
  {
    return this.mTexture;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.background.RepeatingSpriteBackground
 * JD-Core Version:    0.7.0.1
 */