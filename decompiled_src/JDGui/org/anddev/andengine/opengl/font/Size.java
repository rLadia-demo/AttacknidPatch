package org.anddev.andengine.opengl.font;

class Size
{
  private float mHeight;
  private float mWidth;
  
  public Size()
  {
    this(0.0F, 0.0F);
  }
  
  public Size(float paramFloat1, float paramFloat2)
  {
    setWidth(paramFloat1);
    setHeight(paramFloat2);
  }
  
  public float getHeight()
  {
    return this.mHeight;
  }
  
  public float getWidth()
  {
    return this.mWidth;
  }
  
  public void set(int paramInt1, int paramInt2)
  {
    setWidth(paramInt1);
    setHeight(paramInt2);
  }
  
  public void setHeight(float paramFloat)
  {
    this.mHeight = paramFloat;
  }
  
  public void setWidth(float paramFloat)
  {
    this.mWidth = paramFloat;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.font.Size
 * JD-Core Version:    0.7.0.1
 */