package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class Fixture
{
  protected final long addr;
  private final Body body;
  private final Filter filter = new Filter();
  protected Shape shape;
  private final short[] tmp = new short[3];
  private final World world;
  
  protected Fixture(World paramWorld, Body paramBody, long paramLong)
  {
    this.world = paramWorld;
    this.body = paramBody;
    this.addr = paramLong;
  }
  
  private native float jniGetDensity(long paramLong);
  
  private native void jniGetFilterData(long paramLong, short[] paramArrayOfShort);
  
  private native float jniGetFriction(long paramLong);
  
  private native float jniGetRestitution(long paramLong);
  
  private native long jniGetShape(long paramLong);
  
  private native int jniGetType(long paramLong);
  
  private native boolean jniIsSensor(long paramLong);
  
  private native void jniSetDensity(long paramLong, float paramFloat);
  
  private native void jniSetFilterData(long paramLong, short paramShort1, short paramShort2, short paramShort3);
  
  private native void jniSetFriction(long paramLong, float paramFloat);
  
  private native void jniSetRestitution(long paramLong, float paramFloat);
  
  private native void jniSetSensor(long paramLong, boolean paramBoolean);
  
  private native boolean jniTestPoint(long paramLong, float paramFloat1, float paramFloat2);
  
  public Body getBody()
  {
    return this.body;
  }
  
  public float getDensity()
  {
    return jniGetDensity(this.addr);
  }
  
  public Filter getFilterData()
  {
    jniGetFilterData(this.addr, this.tmp);
    this.filter.categoryBits = this.tmp[0];
    this.filter.maskBits = this.tmp[1];
    this.filter.groupIndex = this.tmp[2];
    return this.filter;
  }
  
  public float getFriction()
  {
    return jniGetFriction(this.addr);
  }
  
  public float getRestitution()
  {
    return jniGetRestitution(this.addr);
  }
  
  public Shape getShape()
  {
    long l;
    if (this.shape == null)
    {
      l = jniGetShape(this.addr);
      if (Shape.jniGetType(l) != 0) {
        break label40;
      }
    }
    label40:
    for (this.shape = new CircleShape(l);; this.shape = new PolygonShape(l)) {
      return this.shape;
    }
  }
  
  public Shape.Type getType()
  {
    if (jniGetType(this.addr) == 0) {
      return Shape.Type.Circle;
    }
    return Shape.Type.Polygon;
  }
  
  public boolean isSensor()
  {
    return jniIsSensor(this.addr);
  }
  
  public void setDensity(float paramFloat)
  {
    jniSetDensity(this.addr, paramFloat);
  }
  
  public void setFilterData(Filter paramFilter)
  {
    jniSetFilterData(this.addr, paramFilter.categoryBits, paramFilter.maskBits, paramFilter.groupIndex);
  }
  
  public void setFriction(float paramFloat)
  {
    jniSetFriction(this.addr, paramFloat);
  }
  
  public void setRestitution(float paramFloat)
  {
    jniSetRestitution(this.addr, paramFloat);
  }
  
  public void setSensor(boolean paramBoolean)
  {
    jniSetSensor(this.addr, paramBoolean);
  }
  
  public boolean testPoint(Vector2 paramVector2)
  {
    return jniTestPoint(this.addr, paramVector2.x, paramVector2.y);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.badlogic.gdx.physics.box2d.Fixture
 * JD-Core Version:    0.7.0.1
 */