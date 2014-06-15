package org.anddev.andengine.opengl.texture.region.buffer;

import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.region.TextureRegion;

public class TextureRegionBuffer
  extends BaseTextureRegionBuffer
{
  public TextureRegionBuffer(TextureRegion paramTextureRegion, int paramInt)
  {
    super(paramTextureRegion, paramInt);
  }
  
  public TextureRegion getTextureRegion()
  {
    return (TextureRegion)super.getTextureRegion();
  }
  
  protected float getX1()
  {
    TextureRegion localTextureRegion = getTextureRegion();
    return localTextureRegion.getTexturePositionX() / localTextureRegion.getTexture().getWidth();
  }
  
  protected float getX2()
  {
    TextureRegion localTextureRegion = getTextureRegion();
    return (localTextureRegion.getTexturePositionX() + localTextureRegion.getWidth()) / localTextureRegion.getTexture().getWidth();
  }
  
  protected float getY1()
  {
    TextureRegion localTextureRegion = getTextureRegion();
    return localTextureRegion.getTexturePositionY() / localTextureRegion.getTexture().getHeight();
  }
  
  protected float getY2()
  {
    TextureRegion localTextureRegion = getTextureRegion();
    return (localTextureRegion.getTexturePositionY() + localTextureRegion.getHeight()) / localTextureRegion.getTexture().getHeight();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.region.buffer.TextureRegionBuffer
 * JD-Core Version:    0.7.0.1
 */