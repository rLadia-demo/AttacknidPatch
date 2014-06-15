package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.Vector2;

class Vector2Util
{
  public static float area2(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23)
  {
    return (paramVector22.x - paramVector21.x) * (paramVector23.y - paramVector21.y) - (paramVector23.x - paramVector21.x) * (paramVector22.y - paramVector21.y);
  }
  
  public static float area2(Vector2 paramVector2, Vector2Line paramVector2Line)
  {
    return area2(paramVector2, paramVector2Line.mVertexA, paramVector2Line.mVertexB);
  }
  
  public static float getManhattanDistance(Vector2 paramVector21, Vector2 paramVector22)
  {
    return Math.abs(paramVector21.x - paramVector22.x) + Math.abs(paramVector21.y - paramVector22.y);
  }
  
  public static boolean isBetween(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23)
  {
    return getManhattanDistance(paramVector22, paramVector23) >= getManhattanDistance(paramVector21, paramVector22) + getManhattanDistance(paramVector21, paramVector23);
  }
  
  public static boolean isConvex(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23)
  {
    float f = area2(paramVector21, paramVector22, paramVector23);
    return (f < 0.0F) || ((f == 0.0F) && (!isBetween(paramVector21, paramVector22, paramVector23)));
  }
  
  public static boolean isLess(Vector2 paramVector21, Vector2 paramVector22)
  {
    float f = paramVector21.cross(paramVector22);
    return (f > 0.0F) || ((f == 0.0F) && (isLonger(paramVector21, paramVector22)));
  }
  
  public static boolean isLonger(Vector2 paramVector21, Vector2 paramVector22)
  {
    return paramVector21.lenManhattan() > paramVector22.lenManhattan();
  }
  
  public static boolean isRightOf(Vector2 paramVector2, Vector2Line paramVector2Line)
  {
    return area2(paramVector2, paramVector2Line) < 0.0F;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.physics.box2d.util.hull.Vector2Util
 * JD-Core Version:    0.7.0.1
 */