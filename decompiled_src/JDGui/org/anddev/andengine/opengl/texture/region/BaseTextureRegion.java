package org.anddev.andengine.opengl.texture.region;

import javax.microedition.khronos.opengles.GL10;
import javax.microedition.khronos.opengles.GL11;
import org.anddev.andengine.opengl.buffer.BufferObjectManager;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.region.buffer.BaseTextureRegionBuffer;
import org.anddev.andengine.opengl.util.GLHelper;

public abstract class BaseTextureRegion
{
  protected int mHeight;
  protected final Texture mTexture;
  protected int mTexturePositionX;
  protected int mTexturePositionY;
  protected final BaseTextureRegionBuffer mTextureRegionBuffer;
  protected int mWidth;
  
  public BaseTextureRegion(Texture paramTexture, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.mTexture = paramTexture;
    this.mTexturePositionX = paramInt1;
    this.mTexturePositionY = paramInt2;
    this.mWidth = paramInt3;
    this.mHeight = paramInt4;
    this.mTextureRegionBuffer = onCreateTextureRegionBuffer();
    BufferObjectManager.getActiveInstance().loadBufferObject(this.mTextureRegionBuffer);
    initTextureBuffer();
  }
  
  public int getHeight()
  {
    return this.mHeight;
  }
  
  public Texture getTexture()
  {
    return this.mTexture;
  }
  
  public BaseTextureRegionBuffer getTextureBuffer()
  {
    return this.mTextureRegionBuffer;
  }
  
  public int getTexturePositionX()
  {
    return this.mTexturePositionX;
  }
  
  public int getTexturePositionY()
  {
    return this.mTexturePositionY;
  }
  
  public int getWidth()
  {
    return this.mWidth;
  }
  
  protected void initTextureBuffer()
  {
    updateTextureRegionBuffer();
  }
  
  public boolean isFlippedHorizontal()
  {
    return this.mTextureRegionBuffer.isFlippedHorizontal();
  }
  
  public boolean isFlippedVertical()
  {
    return this.mTextureRegionBuffer.isFlippedVertical();
  }
  
  public void onApply(GL10 paramGL10)
  {
    if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS)
    {
      GL11 localGL11 = (GL11)paramGL10;
      this.mTextureRegionBuffer.selectOnHardware(localGL11);
      GLHelper.bindTexture(paramGL10, this.mTexture.getHardwareTextureID());
      GLHelper.texCoordZeroPointer(localGL11);
      return;
    }
    GLHelper.bindTexture(paramGL10, this.mTexture.getHardwareTextureID());
    GLHelper.texCoordPointer(paramGL10, this.mTextureRegionBuffer.getFloatBuffer());
  }
  
  protected abstract BaseTextureRegionBuffer onCreateTextureRegionBuffer();
  
  public void setFlippedHorizontal(boolean paramBoolean)
  {
    this.mTextureRegionBuffer.setFlippedHorizontal(paramBoolean);
  }
  
  public void setFlippedVertical(boolean paramBoolean)
  {
    this.mTextureRegionBuffer.setFlippedVertical(paramBoolean);
  }
  
  public void setHeight(int paramInt)
  {
    this.mHeight = paramInt;
    updateTextureRegionBuffer();
  }
  
  public void setTexturePosition(int paramInt1, int paramInt2)
  {
    this.mTexturePositionX = paramInt1;
    this.mTexturePositionY = paramInt2;
    updateTextureRegionBuffer();
  }
  
  public void setWidth(int paramInt)
  {
    this.mWidth = paramInt;
    updateTextureRegionBuffer();
  }
  
  protected void updateTextureRegionBuffer()
  {
    this.mTextureRegionBuffer.update();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.region.BaseTextureRegion
 * JD-Core Version:    0.7.0.1
 */