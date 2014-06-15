package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.Vector2;

public abstract class BaseHullAlgorithm
  implements IHullAlgorithm
{
  protected int mHullVertexCount;
  protected int mVertexCount;
  protected Vector2[] mVertices;
  
  protected int indexOfLowestVertex()
  {
    Vector2[] arrayOfVector2 = this.mVertices;
    int i = this.mVertexCount;
    int j = 0;
    for (int k = 1;; k++)
    {
      if (k >= i) {
        return j;
      }
      float f1 = arrayOfVector2[k].y - arrayOfVector2[j].y;
      float f2 = arrayOfVector2[k].x - arrayOfVector2[j].x;
      if ((f1 < 0.0F) || ((f1 == 0.0F) && (f2 < 0.0F))) {
        j = k;
      }
    }
  }
  
  protected void swap(int paramInt1, int paramInt2)
  {
    Vector2[] arrayOfVector2 = this.mVertices;
    Vector2 localVector2 = arrayOfVector2[paramInt1];
    arrayOfVector2[paramInt1] = arrayOfVector2[paramInt2];
    arrayOfVector2[paramInt2] = localVector2;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.physics.box2d.util.hull.BaseHullAlgorithm
 * JD-Core Version:    0.7.0.1
 */