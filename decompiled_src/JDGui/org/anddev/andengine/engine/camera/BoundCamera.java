package org.anddev.andengine.engine.camera;

public class BoundCamera
  extends Camera
{
  private float mBoundsCenterX;
  private float mBoundsCenterY;
  protected boolean mBoundsEnabled;
  private float mBoundsHeight;
  private float mBoundsMaxX;
  private float mBoundsMaxY;
  private float mBoundsMinX;
  private float mBoundsMinY;
  private float mBoundsWidth;
  
  public BoundCamera(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public BoundCamera(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    setBounds(paramFloat5, paramFloat6, paramFloat7, paramFloat8);
    this.mBoundsEnabled = true;
  }
  
  private float determineBoundedX()
  {
    float f1;
    if (this.mBoundsWidth < getWidth()) {
      f1 = this.mBoundsCenterX;
    }
    float f3;
    int j;
    label84:
    do
    {
      return f1;
      f1 = getCenterX();
      float f2 = this.mBoundsMinX - getMinX();
      int i;
      if (f2 > 0.0F)
      {
        i = 1;
        f3 = getMaxX() - this.mBoundsMaxX;
        if (f3 <= 0.0F) {
          break label84;
        }
        j = 1;
      }
      for (;;)
      {
        if (i != 0)
        {
          if (j != 0)
          {
            return f2 + (f1 - f3);
            i = 0;
            break;
            j = 0;
            continue;
          }
          return f1 + f2;
        }
      }
    } while (j == 0);
    return f1 - f3;
  }
  
  private float determineBoundedY()
  {
    float f1;
    if (this.mBoundsHeight < getHeight()) {
      f1 = this.mBoundsCenterY;
    }
    float f3;
    int j;
    label84:
    do
    {
      return f1;
      f1 = getCenterY();
      float f2 = this.mBoundsMinY - getMinY();
      int i;
      if (f2 > 0.0F)
      {
        i = 1;
        f3 = getMaxY() - this.mBoundsMaxY;
        if (f3 <= 0.0F) {
          break label84;
        }
        j = 1;
      }
      for (;;)
      {
        if (i != 0)
        {
          if (j != 0)
          {
            return f2 + (f1 - f3);
            i = 0;
            break;
            j = 0;
            continue;
          }
          return f1 + f2;
        }
      }
    } while (j == 0);
    return f1 - f3;
  }
  
  protected void ensureInBounds()
  {
    super.setCenter(determineBoundedX(), determineBoundedY());
  }
  
  public boolean isBoundsEnabled()
  {
    return this.mBoundsEnabled;
  }
  
  public void setBounds(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this.mBoundsMinX = paramFloat1;
    this.mBoundsMaxX = paramFloat2;
    this.mBoundsMinY = paramFloat3;
    this.mBoundsMaxY = paramFloat4;
    this.mBoundsWidth = (this.mBoundsMaxX - this.mBoundsMinX);
    this.mBoundsHeight = (this.mBoundsMaxY - this.mBoundsMinY);
    this.mBoundsCenterX = (this.mBoundsMinX + 0.5F * this.mBoundsWidth);
    this.mBoundsCenterY = (this.mBoundsMinY + 0.5F * this.mBoundsHeight);
  }
  
  public void setBoundsEnabled(boolean paramBoolean)
  {
    this.mBoundsEnabled = paramBoolean;
  }
  
  public void setCenter(float paramFloat1, float paramFloat2)
  {
    super.setCenter(paramFloat1, paramFloat2);
    if (this.mBoundsEnabled) {
      ensureInBounds();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.camera.BoundCamera
 * JD-Core Version:    0.7.0.1
 */