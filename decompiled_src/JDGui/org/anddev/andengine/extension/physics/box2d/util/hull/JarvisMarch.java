package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.Vector2;
import org.anddev.andengine.extension.physics.box2d.util.Vector2Pool;

public class JarvisMarch
  extends BaseHullAlgorithm
{
  private int indexOfRightmostVertexOf(Vector2 paramVector2)
  {
    Vector2[] arrayOfVector2 = this.mVertices;
    int i = this.mVertexCount;
    int j = 0;
    for (int k = 1;; k++)
    {
      if (k >= i) {
        return j;
      }
      Vector2 localVector21 = Vector2Pool.obtain().set(arrayOfVector2[k]);
      Vector2 localVector22 = Vector2Pool.obtain().set(arrayOfVector2[j]);
      if (Vector2Util.isLess(localVector21.sub(paramVector2), localVector22.sub(paramVector2))) {
        j = k;
      }
      Vector2Pool.recycle(localVector21);
      Vector2Pool.recycle(localVector22);
    }
  }
  
  private void jarvisMarch()
  {
    Vector2[] arrayOfVector2 = this.mVertices;
    int i = indexOfLowestVertex();
    do
    {
      swap(this.mHullVertexCount, i);
      i = indexOfRightmostVertexOf(arrayOfVector2[this.mHullVertexCount]);
      this.mHullVertexCount = (1 + this.mHullVertexCount);
    } while (i > 0);
  }
  
  public int computeHull(Vector2[] paramArrayOfVector2)
  {
    this.mVertices = paramArrayOfVector2;
    this.mVertexCount = paramArrayOfVector2.length;
    this.mHullVertexCount = 0;
    jarvisMarch();
    return this.mHullVertexCount;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.physics.box2d.util.hull.JarvisMarch
 * JD-Core Version:    0.7.0.1
 */