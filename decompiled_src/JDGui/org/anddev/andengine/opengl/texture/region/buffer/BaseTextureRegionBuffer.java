package org.anddev.andengine.opengl.texture.region.buffer;

import org.anddev.andengine.opengl.buffer.BufferObject;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.region.BaseTextureRegion;
import org.anddev.andengine.opengl.util.FastFloatBuffer;

public abstract class BaseTextureRegionBuffer
  extends BufferObject
{
  private boolean mFlippedHorizontal;
  private boolean mFlippedVertical;
  protected final BaseTextureRegion mTextureRegion;
  
  public BaseTextureRegionBuffer(BaseTextureRegion paramBaseTextureRegion, int paramInt)
  {
    super(8, paramInt);
    this.mTextureRegion = paramBaseTextureRegion;
  }
  
  public BaseTextureRegion getTextureRegion()
  {
    return this.mTextureRegion;
  }
  
  protected abstract float getX1();
  
  protected abstract float getX2();
  
  protected abstract float getY1();
  
  protected abstract float getY2();
  
  public boolean isFlippedHorizontal()
  {
    return this.mFlippedHorizontal;
  }
  
  public boolean isFlippedVertical()
  {
    return this.mFlippedVertical;
  }
  
  public void setFlippedHorizontal(boolean paramBoolean)
  {
    if (this.mFlippedHorizontal != paramBoolean)
    {
      this.mFlippedHorizontal = paramBoolean;
      update();
    }
  }
  
  public void setFlippedVertical(boolean paramBoolean)
  {
    if (this.mFlippedVertical != paramBoolean)
    {
      this.mFlippedVertical = paramBoolean;
      update();
    }
  }
  
  public void update()
  {
    for (;;)
    {
      int i;
      int j;
      int k;
      int m;
      int[] arrayOfInt;
      try
      {
        Texture localTexture = this.mTextureRegion.getTexture();
        if (localTexture == null) {
          return;
        }
        i = Float.floatToRawIntBits(getX1());
        j = Float.floatToRawIntBits(getY1());
        k = Float.floatToRawIntBits(getX2());
        m = Float.floatToRawIntBits(getY2());
        arrayOfInt = this.mBufferData;
        if (!this.mFlippedVertical) {
          break label208;
        }
        if (this.mFlippedHorizontal)
        {
          arrayOfInt[0] = k;
          arrayOfInt[1] = m;
          arrayOfInt[2] = k;
          arrayOfInt[3] = j;
          arrayOfInt[4] = i;
          arrayOfInt[5] = m;
          arrayOfInt[6] = i;
          arrayOfInt[7] = j;
          FastFloatBuffer localFastFloatBuffer = getFloatBuffer();
          localFastFloatBuffer.position(0);
          localFastFloatBuffer.put(arrayOfInt);
          localFastFloatBuffer.position(0);
          super.setHardwareBufferNeedsUpdate();
          continue;
        }
        arrayOfInt[0] = i;
      }
      finally {}
      arrayOfInt[1] = m;
      arrayOfInt[2] = i;
      arrayOfInt[3] = j;
      arrayOfInt[4] = k;
      arrayOfInt[5] = m;
      arrayOfInt[6] = k;
      arrayOfInt[7] = j;
      continue;
      label208:
      if (this.mFlippedHorizontal)
      {
        arrayOfInt[0] = k;
        arrayOfInt[1] = j;
        arrayOfInt[2] = k;
        arrayOfInt[3] = m;
        arrayOfInt[4] = i;
        arrayOfInt[5] = j;
        arrayOfInt[6] = i;
        arrayOfInt[7] = m;
      }
      else
      {
        arrayOfInt[0] = i;
        arrayOfInt[1] = j;
        arrayOfInt[2] = i;
        arrayOfInt[3] = m;
        arrayOfInt[4] = k;
        arrayOfInt[5] = j;
        arrayOfInt[6] = k;
        arrayOfInt[7] = m;
      }
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.region.buffer.BaseTextureRegionBuffer
 * JD-Core Version:    0.7.0.1
 */