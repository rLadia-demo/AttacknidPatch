package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.Vector2;

public class QuickHull
  extends BaseHullAlgorithm
{
  private static final float EPSILON = 0.001F;
  
  private void computeHullVertices(Vector2Line paramVector2Line, int paramInt1, int paramInt2)
  {
    if (paramInt1 > paramInt2) {
      return;
    }
    int i = indexOfFurthestVertex(paramVector2Line, paramInt1, paramInt2);
    Vector2Line localVector2Line1 = new Vector2Line(paramVector2Line.mVertexA, this.mVertices[i]);
    Vector2Line localVector2Line2 = new Vector2Line(this.mVertices[i], paramVector2Line.mVertexB);
    swap(i, paramInt2);
    int j = partition(localVector2Line1, paramInt1, paramInt2 - 1);
    computeHullVertices(localVector2Line1, paramInt1, j - 1);
    swap(paramInt2, j);
    swap(j, this.mHullVertexCount);
    this.mHullVertexCount = (1 + this.mHullVertexCount);
    int k = partition(localVector2Line2, j + 1, paramInt2);
    computeHullVertices(localVector2Line2, j + 1, k - 1);
  }
  
  private int indexOfFurthestVertex(Vector2Line paramVector2Line, int paramInt1, int paramInt2)
  {
    Vector2[] arrayOfVector2 = this.mVertices;
    int i = paramInt1;
    float f1 = 0.0F;
    for (int j = paramInt1;; j++)
    {
      if (j > paramInt2) {
        return i;
      }
      float f2 = -Vector2Util.area2(arrayOfVector2[j], paramVector2Line);
      if ((f2 > f1) || ((f2 == f1) && (arrayOfVector2[j].x > arrayOfVector2[i].y)))
      {
        f1 = f2;
        i = j;
      }
    }
  }
  
  private int partition(Vector2Line paramVector2Line, int paramInt1, int paramInt2)
  {
    Vector2[] arrayOfVector2 = this.mVertices;
    int i = paramInt1;
    int j = paramInt2;
    label22:
    int k;
    if (i > j)
    {
      return i;
      k++;
    }
    for (;;)
    {
      int m;
      if (k <= j)
      {
        if (Vector2Util.isRightOf(arrayOfVector2[k], paramVector2Line)) {
          break label22;
        }
        m = j;
      }
      for (;;)
      {
        if ((k > m) || (Vector2Util.isRightOf(arrayOfVector2[m], paramVector2Line)))
        {
          if (k > m) {
            break label103;
          }
          i = k + 1;
          j = m - 1;
          swap(k, m);
          break;
        }
        m--;
        continue;
        label103:
        j = m;
        i = k;
        break;
        m = j;
      }
      k = i;
    }
  }
  
  private void quickHull()
  {
    swap(0, indexOfLowestVertex());
    this.mHullVertexCount = (1 + this.mHullVertexCount);
    computeHullVertices(new Vector2Line(this.mVertices[0], new Vector2(this.mVertices[0]).add(-0.001F, 0.0F)), 1, -1 + this.mVertexCount);
  }
  
  public int computeHull(Vector2[] paramArrayOfVector2)
  {
    this.mVertices = paramArrayOfVector2;
    this.mVertexCount = this.mVertices.length;
    this.mHullVertexCount = 0;
    quickHull();
    return this.mHullVertexCount;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.physics.box2d.util.hull.QuickHull
 * JD-Core Version:    0.7.0.1
 */