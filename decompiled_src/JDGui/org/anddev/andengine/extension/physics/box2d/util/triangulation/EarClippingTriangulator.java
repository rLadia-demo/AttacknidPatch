package org.anddev.andengine.extension.physics.box2d.util.triangulation;

import com.badlogic.gdx.math.Vector2;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class EarClippingTriangulator
  implements ITriangulationAlgoritm
{
  private static final int CONCAVE = 1;
  private static final int CONVEX = -1;
  private int mConcaveVertexCount;
  
  private static boolean areVerticesClockwise(ArrayList<Vector2> paramArrayList)
  {
    int i = paramArrayList.size();
    float f = 0.0F;
    for (int j = 0;; j++)
    {
      if (j >= i)
      {
        if (f >= 0.0F) {
          break;
        }
        return true;
      }
      Vector2 localVector21 = (Vector2)paramArrayList.get(j);
      Vector2 localVector22 = (Vector2)paramArrayList.get(computeNextIndex(paramArrayList, j));
      f += localVector21.x * localVector22.y - localVector22.x * localVector21.y;
    }
    return false;
  }
  
  private int[] classifyVertices(ArrayList<Vector2> paramArrayList)
  {
    int i = paramArrayList.size();
    int[] arrayOfInt = new int[i];
    this.mConcaveVertexCount = 0;
    if (!areVerticesClockwise(paramArrayList)) {
      Collections.reverse(paramArrayList);
    }
    int j = 0;
    if (j >= i) {
      return arrayOfInt;
    }
    int k = computePreviousIndex(paramArrayList, j);
    int m = computeNextIndex(paramArrayList, j);
    Vector2 localVector21 = (Vector2)paramArrayList.get(k);
    Vector2 localVector22 = (Vector2)paramArrayList.get(j);
    Vector2 localVector23 = (Vector2)paramArrayList.get(m);
    if (isTriangleConvex(localVector21.x, localVector21.y, localVector22.x, localVector22.y, localVector23.x, localVector23.y)) {
      arrayOfInt[j] = -1;
    }
    for (;;)
    {
      j++;
      break;
      arrayOfInt[j] = 1;
      this.mConcaveVertexCount = (1 + this.mConcaveVertexCount);
    }
  }
  
  private static int computeNextIndex(List<Vector2> paramList, int paramInt)
  {
    if (paramInt == -1 + paramList.size()) {
      return 0;
    }
    return paramInt + 1;
  }
  
  private static int computePreviousIndex(List<Vector2> paramList, int paramInt)
  {
    if (paramInt == 0) {
      return -1 + paramList.size();
    }
    return paramInt - 1;
  }
  
  private static int computeSpannedAreaSign(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    return (int)Math.signum(0.0F + paramFloat1 * (paramFloat6 - paramFloat4) + paramFloat3 * (paramFloat2 - paramFloat6) + paramFloat5 * (paramFloat4 - paramFloat2));
  }
  
  private void cutEarTip(ArrayList<Vector2> paramArrayList1, int paramInt, ArrayList<Vector2> paramArrayList2)
  {
    int i = computePreviousIndex(paramArrayList1, paramInt);
    int j = computeNextIndex(paramArrayList1, paramInt);
    if (!isCollinear(paramArrayList1, i, paramInt, j))
    {
      paramArrayList2.add(new Vector2((Vector2)paramArrayList1.get(i)));
      paramArrayList2.add(new Vector2((Vector2)paramArrayList1.get(paramInt)));
      paramArrayList2.add(new Vector2((Vector2)paramArrayList1.get(j)));
    }
    paramArrayList1.remove(paramInt);
    if (paramArrayList1.size() >= 3) {
      removeCollinearNeighborEarsAfterRemovingEarTip(paramArrayList1, paramInt);
    }
  }
  
  private static boolean isAnyVertexInTriangle(ArrayList<Vector2> paramArrayList, int[] paramArrayOfInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    int i = 0;
    int j = paramArrayList.size();
    for (;;)
    {
      if (i >= j - 1) {
        return false;
      }
      if (paramArrayOfInt[i] == 1)
      {
        Vector2 localVector2 = (Vector2)paramArrayList.get(i);
        float f1 = localVector2.x;
        float f2 = localVector2.y;
        int k = computeSpannedAreaSign(paramFloat1, paramFloat2, paramFloat3, paramFloat4, f1, f2);
        int m = computeSpannedAreaSign(paramFloat3, paramFloat4, paramFloat5, paramFloat6, f1, f2);
        int n = computeSpannedAreaSign(paramFloat5, paramFloat6, paramFloat1, paramFloat2, f1, f2);
        if ((k > 0) && (m > 0) && (n > 0)) {
          return true;
        }
        if ((k <= 0) && (m <= 0) && (n <= 0)) {
          return true;
        }
      }
      i++;
    }
  }
  
  private static boolean isCollinear(ArrayList<Vector2> paramArrayList, int paramInt)
  {
    return isCollinear(paramArrayList, computePreviousIndex(paramArrayList, paramInt), paramInt, computeNextIndex(paramArrayList, paramInt));
  }
  
  private static boolean isCollinear(ArrayList<Vector2> paramArrayList, int paramInt1, int paramInt2, int paramInt3)
  {
    Vector2 localVector21 = (Vector2)paramArrayList.get(paramInt1);
    Vector2 localVector22 = (Vector2)paramArrayList.get(paramInt2);
    Vector2 localVector23 = (Vector2)paramArrayList.get(paramInt3);
    return computeSpannedAreaSign(localVector21.x, localVector21.y, localVector22.x, localVector22.y, localVector23.x, localVector23.y) == 0;
  }
  
  private boolean isEarTip(ArrayList<Vector2> paramArrayList, int paramInt, int[] paramArrayOfInt)
  {
    if (this.mConcaveVertexCount != 0)
    {
      Vector2 localVector21 = (Vector2)paramArrayList.get(computePreviousIndex(paramArrayList, paramInt));
      Vector2 localVector22 = (Vector2)paramArrayList.get(paramInt);
      Vector2 localVector23 = (Vector2)paramArrayList.get(computeNextIndex(paramArrayList, paramInt));
      return !isAnyVertexInTriangle(paramArrayList, paramArrayOfInt, localVector21.x, localVector21.y, localVector22.x, localVector22.y, localVector23.x, localVector23.y);
    }
    return true;
  }
  
  private static boolean isTriangleConvex(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    return computeSpannedAreaSign(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6) >= 0;
  }
  
  private static void removeCollinearNeighborEarsAfterRemovingEarTip(ArrayList<Vector2> paramArrayList, int paramInt)
  {
    int i = paramInt % paramArrayList.size();
    int j = computePreviousIndex(paramArrayList, i);
    if (isCollinear(paramArrayList, i))
    {
      paramArrayList.remove(i);
      if (paramArrayList.size() > 3)
      {
        k = computePreviousIndex(paramArrayList, i);
        if (isCollinear(paramArrayList, k)) {
          paramArrayList.remove(k);
        }
      }
    }
    while (!isCollinear(paramArrayList, j))
    {
      int k;
      return;
    }
    paramArrayList.remove(j);
  }
  
  public List<Vector2> computeTriangles(List<Vector2> paramList)
  {
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList(paramList.size());
    localArrayList2.addAll(paramList);
    int[] arrayOfInt;
    int i;
    if (localArrayList2.size() == 3)
    {
      localArrayList1.addAll(localArrayList2);
      return localArrayList1;
      arrayOfInt = classifyVertices(localArrayList2);
      i = localArrayList2.size();
    }
    label100:
    for (int j = 0;; j++)
    {
      if (j >= i) {}
      while (localArrayList2.size() < 3)
      {
        return localArrayList1;
        if (!isEarTip(localArrayList2, j, arrayOfInt)) {
          break label100;
        }
        cutEarTip(localArrayList2, j, localArrayList1);
      }
      break;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.physics.box2d.util.triangulation.EarClippingTriangulator
 * JD-Core Version:    0.7.0.1
 */