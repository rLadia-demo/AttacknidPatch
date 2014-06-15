package org.anddev.andengine.entity.sprite;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.entity.primitive.BaseRectangle;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.region.BaseTextureRegion;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;

public abstract class BaseSprite
  extends BaseRectangle
{
  protected final BaseTextureRegion mTextureRegion;
  
  public BaseSprite(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, BaseTextureRegion paramBaseTextureRegion)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    this.mTextureRegion = paramBaseTextureRegion;
    initBlendFunction();
  }
  
  public BaseSprite(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, BaseTextureRegion paramBaseTextureRegion, RectangleVertexBuffer paramRectangleVertexBuffer)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramRectangleVertexBuffer);
    this.mTextureRegion = paramBaseTextureRegion;
    initBlendFunction();
  }
  
  private void initBlendFunction()
  {
    if (this.mTextureRegion.getTexture().getTextureOptions().mPreMultipyAlpha) {
      setBlendFunction(1, 771);
    }
  }
  
  public BaseTextureRegion getTextureRegion()
  {
    return this.mTextureRegion;
  }
  
  protected void onApplyTransformations(GL10 paramGL10)
  {
    super.onApplyTransformations(paramGL10);
    this.mTextureRegion.onApply(paramGL10);
  }
  
  protected void onInitDraw(GL10 paramGL10)
  {
    super.onInitDraw(paramGL10);
    GLHelper.enableTextures(paramGL10);
    GLHelper.enableTexCoordArray(paramGL10);
  }
  
  public void reset()
  {
    super.reset();
    initBlendFunction();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.sprite.BaseSprite
 * JD-Core Version:    0.7.0.1
 */