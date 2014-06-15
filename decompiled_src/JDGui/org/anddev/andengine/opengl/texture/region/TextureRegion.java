package org.anddev.andengine.opengl.texture.region;

import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.region.buffer.BaseTextureRegionBuffer;
import org.anddev.andengine.opengl.texture.region.buffer.TextureRegionBuffer;

public class TextureRegion
  extends BaseTextureRegion
{
  public TextureRegion(Texture paramTexture, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super(paramTexture, paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public TextureRegion clone()
  {
    return new TextureRegion(this.mTexture, this.mTexturePositionX, this.mTexturePositionY, this.mWidth, this.mHeight);
  }
  
  public TextureRegionBuffer getTextureBuffer()
  {
    return (TextureRegionBuffer)this.mTextureRegionBuffer;
  }
  
  protected BaseTextureRegionBuffer onCreateTextureRegionBuffer()
  {
    return new TextureRegionBuffer(this, 35044);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.region.TextureRegion
 * JD-Core Version:    0.7.0.1
 */