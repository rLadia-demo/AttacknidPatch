package com.badlogic.gdx.physics.box2d;

public abstract class Shape
{
  protected long addr;
  
  private native void jniDispose(long paramLong);
  
  private native float jniGetRadius(long paramLong);
  
  protected static native int jniGetType(long paramLong);
  
  private native void jniSetRadius(long paramLong, float paramFloat);
  
  public void dispose()
  {
    jniDispose(this.addr);
  }
  
  public float getRadius()
  {
    return jniGetRadius(this.addr);
  }
  
  public abstract Type getType();
  
  public void setRadius(float paramFloat)
  {
    jniSetRadius(this.addr, paramFloat);
  }
  
  public static enum Type
  {
    Polygon,  Circle;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.badlogic.gdx.physics.box2d.Shape
 * JD-Core Version:    0.7.0.1
 */