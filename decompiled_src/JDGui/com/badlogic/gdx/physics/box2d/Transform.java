package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class Transform
{
  public static final int COL1_X = 2;
  public static final int COL1_Y = 3;
  public static final int COL2_X = 4;
  public static final int COL2_Y = 5;
  public static final int POS_X = 0;
  public static final int POS_Y = 1;
  private Vector2 position = new Vector2();
  public float[] vals = new float[6];
  
  public Transform() {}
  
  public Transform(Vector2 paramVector2, float paramFloat)
  {
    setPosition(paramVector2);
    setRotation(paramFloat);
  }
  
  public Vector2 getPosition()
  {
    return this.position.set(this.vals[0], this.vals[1]);
  }
  
  public Vector2 mul(Vector2 paramVector2)
  {
    float f1 = this.vals[0] + this.vals[2] * paramVector2.x + this.vals[4] * paramVector2.y;
    float f2 = this.vals[1] + this.vals[3] * paramVector2.x + this.vals[5] * paramVector2.y;
    paramVector2.x = f1;
    paramVector2.y = f2;
    return paramVector2;
  }
  
  public void setPosition(Vector2 paramVector2)
  {
    this.vals[0] = paramVector2.x;
    this.vals[1] = paramVector2.y;
  }
  
  public void setRotation(float paramFloat)
  {
    float f1 = (float)Math.cos(paramFloat);
    float f2 = (float)Math.sin(paramFloat);
    this.vals[2] = f1;
    this.vals[4] = (-f2);
    this.vals[3] = f2;
    this.vals[5] = f1;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.badlogic.gdx.physics.box2d.Transform
 * JD-Core Version:    0.7.0.1
 */