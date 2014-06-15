package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.utils.LongHashMap;

public class Contact
{
  protected long addr;
  private final float[] tmp = new float[6];
  protected World world;
  protected final WorldManifold worldManifold = new WorldManifold();
  
  protected Contact(World paramWorld, long paramLong)
  {
    this.addr = paramLong;
    this.world = paramWorld;
  }
  
  private native long jniGetFixtureA(long paramLong);
  
  private native long jniGetFixtureB(long paramLong);
  
  private native int jniGetWorldManifold(long paramLong, float[] paramArrayOfFloat);
  
  private native boolean jniIsEnabled(long paramLong);
  
  private native boolean jniIsTouching(long paramLong);
  
  private native void jniSetEnabled(long paramLong, boolean paramBoolean);
  
  public WorldManifold GetWorldManifold()
  {
    int i = jniGetWorldManifold(this.addr, this.tmp);
    this.worldManifold.numContactPoints = i;
    this.worldManifold.normal.set(this.tmp[0], this.tmp[1]);
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return this.worldManifold;
      }
      Vector2 localVector2 = this.worldManifold.points[j];
      localVector2.x = this.tmp[(2 + j * 2)];
      localVector2.y = this.tmp[(1 + (2 + j * 2))];
    }
  }
  
  public Fixture getFixtureA()
  {
    return (Fixture)this.world.fixtures.get(jniGetFixtureA(this.addr));
  }
  
  public Fixture getFixtureB()
  {
    return (Fixture)this.world.fixtures.get(jniGetFixtureB(this.addr));
  }
  
  public boolean isEnabled()
  {
    return jniIsEnabled(this.addr);
  }
  
  public boolean isTouching()
  {
    return jniIsTouching(this.addr);
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    jniSetEnabled(this.addr, paramBoolean);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.badlogic.gdx.physics.box2d.Contact
 * JD-Core Version:    0.7.0.1
 */