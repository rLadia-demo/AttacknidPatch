package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class PolygonShape
  extends Shape
{
  private static float[] verts = new float[2];
  
  public PolygonShape()
  {
    this.addr = newPolygonShape();
  }
  
  protected PolygonShape(long paramLong)
  {
    this.addr = paramLong;
  }
  
  private native void jniGetVertex(long paramLong, int paramInt, float[] paramArrayOfFloat);
  
  private native int jniGetVertexCount(long paramLong);
  
  private native void jniSet(long paramLong, float[] paramArrayOfFloat);
  
  private native void jniSetAsBox(long paramLong, float paramFloat1, float paramFloat2);
  
  private native void jniSetAsBox(long paramLong, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5);
  
  private native void jniSetAsEdge(long paramLong, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  private native long newPolygonShape();
  
  public Shape.Type getType()
  {
    return Shape.Type.Polygon;
  }
  
  public void getVertex(int paramInt, Vector2 paramVector2)
  {
    jniGetVertex(this.addr, paramInt, verts);
    paramVector2.x = verts[0];
    paramVector2.y = verts[1];
  }
  
  public int getVertexCount()
  {
    return jniGetVertexCount(this.addr);
  }
  
  public void set(Vector2[] paramArrayOfVector2)
  {
    float[] arrayOfFloat = new float[2 * paramArrayOfVector2.length];
    int i = 0;
    for (int j = 0;; j++)
    {
      if (i >= 2 * paramArrayOfVector2.length)
      {
        jniSet(this.addr, arrayOfFloat);
        return;
      }
      arrayOfFloat[i] = paramArrayOfVector2[j].x;
      arrayOfFloat[(i + 1)] = paramArrayOfVector2[j].y;
      i += 2;
    }
  }
  
  public void setAsBox(float paramFloat1, float paramFloat2)
  {
    jniSetAsBox(this.addr, paramFloat1, paramFloat2);
  }
  
  public void setAsBox(float paramFloat1, float paramFloat2, Vector2 paramVector2, float paramFloat3)
  {
    jniSetAsBox(this.addr, paramFloat1, paramFloat2, paramVector2.x, paramVector2.y, paramFloat3);
  }
  
  public void setAsEdge(Vector2 paramVector21, Vector2 paramVector22)
  {
    jniSetAsEdge(this.addr, paramVector21.x, paramVector21.y, paramVector22.x, paramVector22.y);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.badlogic.gdx.physics.box2d.PolygonShape
 * JD-Core Version:    0.7.0.1
 */