package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.Vector2;

public class GrahamScan
  extends BaseHullAlgorithm
{
  private void grahamScan()
  {
    swap(0, indexOfLowestVertex());
    Vector2 localVector2 = new Vector2(this.mVertices[0]);
    makeAllVerticesRelativeTo(localVector2);
    sort();
    makeAllVerticesRelativeTo(new Vector2(localVector2).mul(-1.0F));
    int i = 3;
    int j = 3;
    if (j >= this.mVertexCount)
    {
      this.mHullVertexCount = i;
      return;
    }
    swap(i, j);
    for (;;)
    {
      if (isConvex(i - 1))
      {
        j++;
        i++;
        break;
      }
      int k = i - 1;
      int m = i - 1;
      swap(k, i);
      i = m;
    }
  }
  
  private boolean isConvex(int paramInt)
  {
    Vector2[] arrayOfVector2 = this.mVertices;
    return Vector2Util.isConvex(arrayOfVector2[paramInt], arrayOfVector2[(paramInt - 1)], arrayOfVector2[(paramInt + 1)]);
  }
  
  private void makeAllVerticesRelativeTo(Vector2 paramVector2)
  {
    Vector2[] arrayOfVector2 = this.mVertices;
    int i = this.mVertexCount;
    Vector2 localVector2 = new Vector2(paramVector2);
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return;
      }
      arrayOfVector2[j].sub(localVector2);
    }
  }
  
  private void quicksort(int paramInt1, int paramInt2)
  {
    Vector2[] arrayOfVector2 = this.mVertices;
    int i = paramInt1;
    int j = paramInt2;
    Vector2 localVector2 = arrayOfVector2[((paramInt1 + paramInt2) / 2)];
    if (i > j)
    {
      if (paramInt1 < j) {
        quicksort(paramInt1, j);
      }
      if (i < paramInt2) {
        quicksort(i, paramInt2);
      }
      return;
    }
    while (Vector2Util.isLess(arrayOfVector2[i], localVector2)) {
      i++;
    }
    for (;;)
    {
      if (!Vector2Util.isLess(localVector2, arrayOfVector2[j]))
      {
        if (i > j) {
          break;
        }
        int k = i + 1;
        int m = j - 1;
        swap(i, j);
        j = m;
        i = k;
        break;
      }
      j--;
    }
  }
  
  private void sort()
  {
    quicksort(1, -1 + this.mVertexCount);
  }
  
  public int computeHull(Vector2[] paramArrayOfVector2)
  {
    this.mVertices = paramArrayOfVector2;
    this.mVertexCount = paramArrayOfVector2.length;
    if (this.mVertexCount < 3) {
      return this.mVertexCount;
    }
    this.mHullVertexCount = 0;
    grahamScan();
    return this.mHullVertexCount;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.physics.box2d.util.hull.GrahamScan
 * JD-Core Version:    0.7.0.1
 */