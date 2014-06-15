package com.badlogic.gdx.math;

public final class Vector2
{
  private static final Vector2 tmp = new Vector2();
  public float x;
  public float y;
  
  public Vector2() {}
  
  public Vector2(float paramFloat1, float paramFloat2)
  {
    this.x = paramFloat1;
    this.y = paramFloat2;
  }
  
  public Vector2(Vector2 paramVector2)
  {
    set(paramVector2);
  }
  
  public Vector2 add(float paramFloat1, float paramFloat2)
  {
    this.x = (paramFloat1 + this.x);
    this.y = (paramFloat2 + this.y);
    return this;
  }
  
  public Vector2 add(Vector2 paramVector2)
  {
    this.x += paramVector2.x;
    this.y += paramVector2.y;
    return this;
  }
  
  public Vector2 cpy()
  {
    return new Vector2(this);
  }
  
  public float cross(Vector2 paramVector2)
  {
    return this.x * paramVector2.y - paramVector2.x * this.y;
  }
  
  public float dot(Vector2 paramVector2)
  {
    return this.x * paramVector2.x + this.y * paramVector2.y;
  }
  
  public float dst(float paramFloat1, float paramFloat2)
  {
    float f1 = paramFloat1 - this.x;
    float f2 = paramFloat2 - this.y;
    return (float)Math.sqrt(f1 * f1 + f2 * f2);
  }
  
  public float dst(Vector2 paramVector2)
  {
    float f1 = paramVector2.x - this.x;
    float f2 = paramVector2.y - this.y;
    return (float)Math.sqrt(f1 * f1 + f2 * f2);
  }
  
  public float dst2(Vector2 paramVector2)
  {
    float f1 = paramVector2.x - this.x;
    float f2 = paramVector2.y - this.y;
    return f1 * f1 + f2 * f2;
  }
  
  public float len()
  {
    return (float)Math.sqrt(this.x * this.x + this.y * this.y);
  }
  
  public float len2()
  {
    return this.x * this.x + this.y * this.y;
  }
  
  public float lenManhattan()
  {
    return Math.abs(this.x) + Math.abs(this.y);
  }
  
  public Vector2 mul(float paramFloat)
  {
    this.x = (paramFloat * this.x);
    this.y = (paramFloat * this.y);
    return this;
  }
  
  public Vector2 nor()
  {
    float f = len();
    if (f != 0.0F)
    {
      this.x /= f;
      this.y /= f;
    }
    return this;
  }
  
  public Vector2 set(float paramFloat1, float paramFloat2)
  {
    this.x = paramFloat1;
    this.y = paramFloat2;
    return this;
  }
  
  public Vector2 set(Vector2 paramVector2)
  {
    this.x = paramVector2.x;
    this.y = paramVector2.y;
    return this;
  }
  
  public Vector2 sub(float paramFloat1, float paramFloat2)
  {
    this.x -= paramFloat1;
    this.y -= paramFloat2;
    return this;
  }
  
  public Vector2 sub(Vector2 paramVector2)
  {
    this.x -= paramVector2.x;
    this.y -= paramVector2.y;
    return this;
  }
  
  public Vector2 tmp()
  {
    return tmp.set(this);
  }
  
  public String toString()
  {
    return "[" + this.x + ":" + this.y + "]";
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.badlogic.gdx.math.Vector2
 * JD-Core Version:    0.7.0.1
 */