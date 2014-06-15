package org.anddev.andengine.extension.physics.box2d.util.triangulation;

import com.badlogic.gdx.math.*;
import java.util.*;

public final class EarClippingTriangulator implements ITriangulationAlgoritm
{
    private static final int CONCAVE = 1;
    private static final int CONVEX = -1;
    private int mConcaveVertexCount;
    
    private static boolean areVerticesClockwise(final ArrayList<Vector2> list) {
        final int size = list.size();
        float n = 0.0f;
        for (int i = 0; i < size; ++i) {
            Vector2 vector2 = list.get(i);
            vector2 = list.get(computeNextIndex(list, i));
            n += vector2.x * vector2.y - vector2.x * vector2.y;
        }
        return n < 0.0f;
    }
    
    private int[] classifyVertices(final ArrayList<Vector2> list) {
        final int size = list.size();
        final int[] array = new int[size];
        this.mConcaveVertexCount = 0;
        if (!areVerticesClockwise(list)) {
            Collections.reverse(list);
        }
        for (int i = 0; i < size; ++i) {
            final int computePreviousIndex = computePreviousIndex(list, i);
            final int computeNextIndex = computeNextIndex(list, i);
            Vector2 vector2 = list.get(computePreviousIndex);
            vector2 = list.get(i);
            final Vector2 vector3 = list.get(computeNextIndex);
            if (isTriangleConvex(vector2.x, vector2.y, vector2.x, vector2.y, vector3.x, vector3.y)) {
                array[i] = -1;
            }
            else {
                array[i] = 1;
                ++this.mConcaveVertexCount;
            }
        }
        return array;
    }
    
    private static int computeNextIndex(final List<Vector2> list, final int n) {
        if (n == -1 + list.size()) {
            return 0;
        }
        return n + 1;
    }
    
    private static int computePreviousIndex(final List<Vector2> list, final int n) {
        if (n == 0) {
            return -1 + list.size();
        }
        return n - 1;
    }
    
    private static int computeSpannedAreaSign(final float n, final float n2, final float n3, final float n4, final float n5, final float n6) {
        return (int)Math.signum(0.0f + n * (n6 - n4) + n3 * (n2 - n6) + n5 * (n4 - n2));
    }
    
    private void cutEarTip(final ArrayList<Vector2> list, final int n, final ArrayList<Vector2> list2) {
        final int computePreviousIndex = computePreviousIndex(list, n);
        final int computeNextIndex = computeNextIndex(list, n);
        if (!isCollinear(list, computePreviousIndex, n, computeNextIndex)) {
            list2.add(new Vector2(list.get(computePreviousIndex)));
            list2.add(new Vector2(list.get(n)));
            list2.add(new Vector2(list.get(computeNextIndex)));
        }
        list.remove(n);
        if (list.size() >= 3) {
            removeCollinearNeighborEarsAfterRemovingEarTip(list, n);
        }
    }
    
    private static boolean isAnyVertexInTriangle(final ArrayList<Vector2> list, final int[] array, final float n, final float n2, final float n3, final float n4, final float n5, final float n6) {
        for (int i = 0; i < list.size() - 1; ++i) {
            if (array[i] == 1) {
                final Vector2 vector2 = list.get(i);
                final float x = vector2.x;
                final float y = vector2.y;
                final int computeSpannedAreaSign = computeSpannedAreaSign(n, n2, n3, n4, x, y);
                final int computeSpannedAreaSign2 = computeSpannedAreaSign(n3, n4, n5, n6, x, y);
                final int computeSpannedAreaSign3 = computeSpannedAreaSign(n5, n6, n, n2, x, y);
                if (computeSpannedAreaSign > 0 && computeSpannedAreaSign2 > 0 && computeSpannedAreaSign3 > 0) {
                    return true;
                }
                if (computeSpannedAreaSign <= 0 && computeSpannedAreaSign2 <= 0 && computeSpannedAreaSign3 <= 0) {
                    return true;
                }
            }
        }
        return false;
    }
    
    private static boolean isCollinear(final ArrayList<Vector2> list, final int n) {
        return isCollinear(list, computePreviousIndex(list, n), n, computeNextIndex(list, n));
    }
    
    private static boolean isCollinear(final ArrayList<Vector2> list, final int n, final int n2, final int n3) {
        Vector2 vector2 = list.get(n);
        vector2 = list.get(n2);
        final Vector2 vector3 = list.get(n3);
        return computeSpannedAreaSign(vector2.x, vector2.y, vector2.x, vector2.y, vector3.x, vector3.y) == 0;
    }
    
    private boolean isEarTip(final ArrayList<Vector2> list, final int n, final int[] array) {
        if (this.mConcaveVertexCount != 0) {
            Vector2 vector2 = list.get(computePreviousIndex(list, n));
            vector2 = list.get(n);
            final Vector2 vector3 = list.get(computeNextIndex(list, n));
            return !isAnyVertexInTriangle(list, array, vector2.x, vector2.y, vector2.x, vector2.y, vector3.x, vector3.y);
        }
        return true;
    }
    
    private static boolean isTriangleConvex(final float n, final float n2, final float n3, final float n4, final float n5, final float n6) {
        return computeSpannedAreaSign(n, n2, n3, n4, n5, n6) >= 0;
    }
    
    private static void removeCollinearNeighborEarsAfterRemovingEarTip(final ArrayList<Vector2> list, final int n) {
        final int n2 = n % list.size();
        final int computePreviousIndex = computePreviousIndex(list, n2);
        if (isCollinear(list, n2)) {
            list.remove(n2);
            if (list.size() > 3) {
                final int computePreviousIndex2 = computePreviousIndex(list, n2);
                if (isCollinear(list, computePreviousIndex2)) {
                    list.remove(computePreviousIndex2);
                }
            }
        }
        else if (isCollinear(list, computePreviousIndex)) {
            list.remove(computePreviousIndex);
        }
    }
    
    @Override
    public List<Vector2> computeTriangles(final List<Vector2> list) {
        final ArrayList<Vector2> list2 = new ArrayList<Vector2>();
        final ArrayList list3 = new ArrayList<Vector2>(list.size());
        list3.addAll(list);
        if (list3.size() == 3) {
            list2.addAll((Collection<? extends Vector2>)list3);
            return list2;
        }
        while (list3.size() >= 3) {
            final int[] classifyVertices = this.classifyVertices((ArrayList<Vector2>)list3);
            for (int size = list3.size(), i = 0; i < size; ++i) {
                if (this.isEarTip((ArrayList<Vector2>)list3, i, classifyVertices)) {
                    this.cutEarTip((ArrayList<Vector2>)list3, i, list2);
                    break;
                }
            }
        }
        return list2;
    }
}
