package org.anddev.andengine.entity.sprite;

import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;

public class Sprite
  extends BaseSprite
{
  public Sprite(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, TextureRegion paramTextureRegion)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramTextureRegion);
  }
  
  public Sprite(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, TextureRegion paramTextureRegion, RectangleVertexBuffer paramRectangleVertexBuffer)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramTextureRegion, paramRectangleVertexBuffer);
  }
  
  public Sprite(float paramFloat1, float paramFloat2, TextureRegion paramTextureRegion)
  {
    super(paramFloat1, paramFloat2, paramTextureRegion.getWidth(), paramTextureRegion.getHeight(), paramTextureRegion);
  }
  
  public Sprite(float paramFloat1, float paramFloat2, TextureRegion paramTextureRegion, RectangleVertexBuffer paramRectangleVertexBuffer)
  {
    super(paramFloat1, paramFloat2, paramTextureRegion.getWidth(), paramTextureRegion.getHeight(), paramTextureRegion, paramRectangleVertexBuffer);
  }
  
  public TextureRegion getTextureRegion()
  {
    return (TextureRegion)this.mTextureRegion;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.sprite.Sprite
 * JD-Core Version:    0.7.0.1
 */