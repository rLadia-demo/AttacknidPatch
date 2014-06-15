/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.physics.box2d.util.triangulation;

import com.badlogic.gdx.math.Vector2;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import org.anddev.andengine.extension.physics.box2d.util.triangulation.ITriangulationAlgoritm;

public final class EarClippingTriangulator
implements ITriangulationAlgoritm {
    private static final int CONCAVE = 1;
    private static final int CONVEX = -1;
    private int mConcaveVertexCount;

    private static boolean areVerticesClockwise(ArrayList<Vector2> arrayList) {
        int n = arrayList.size();
        float f = 0.0f;
        int n2 = 0;
        do {
            if (n2 >= n) {
                if (f >= 0.0f) return false;
                return true;
            }
            Vector2 vector2 = arrayList.get(n2);
            Vector2 vector22 = arrayList.get(EarClippingTriangulator.computeNextIndex(arrayList, n2));
            f+=vector2.x * vector22.y - vector22.x * vector2.y;
            ++n2;
        } while (true);
    }

    /*
     * Enabled aggressive block sorting
     */
    private int[] classifyVertices(ArrayList<Vector2> arrayList) {
        int n = arrayList.size();
        int[] arrn = new int[n];
        this.mConcaveVertexCount = 0;
        if (!EarClippingTriangulator.areVerticesClockwise(arrayList)) {
            Collections.reverse(arrayList);
        }
        for (int i = 0; i < n; ++i) {
            int n2 = EarClippingTriangulator.computePreviousIndex(arrayList, i);
            int n3 = EarClippingTriangulator.computeNextIndex(arrayList, i);
            Vector2 vector2 = arrayList.get(n2);
            Vector2 vector22 = arrayList.get(i);
            Vector2 vector23 = arrayList.get(n3);
            if (EarClippingTriangulator.isTriangleConvex(vector2.x, vector2.y, vector22.x, vector22.y, vector23.x, vector23.y)) {
                arrn[i] = -1;
                continue;
            }
            arrn[i] = 1;
            this.mConcaveVertexCount = 1 + this.mConcaveVertexCount;
        }
        return arrn;
    }

    private static int computeNextIndex(List<Vector2> list, int n) {
        if (n != -1 + list.size()) return n + 1;
        return 0;
    }

    private static int computePreviousIndex(List<Vector2> list, int n) {
        if (n != 0) return n - 1;
        return -1 + list.size();
    }

    private static int computeSpannedAreaSign(float f, float f2, float f3, float f4, float f5, float f6) {
        return (int)Math.signum(0.0f + f * (f6 - f4) + f3 * (f2 - f6) + f5 * (f4 - f2));
    }

    private void cutEarTip(ArrayList<Vector2> arrayList, int n, ArrayList<Vector2> arrayList2) {
        int n2 = EarClippingTriangulator.computePreviousIndex(arrayList, n);
        int n3 = EarClippingTriangulator.computeNextIndex(arrayList, n);
        if (!EarClippingTriangulator.isCollinear(arrayList, n2, n, n3)) {
            arrayList2.add(new Vector2(arrayList.get(n2)));
            arrayList2.add(new Vector2(arrayList.get(n)));
            arrayList2.add(new Vector2(arrayList.get(n3)));
        }
        arrayList.remove(n);
        if (arrayList.size() < 3) return;
        EarClippingTriangulator.removeCollinearNeighborEarsAfterRemovingEarTip(arrayList, n);
    }

    private static boolean isAnyVertexInTriangle(ArrayList<Vector2> arrayList, int[] arrn, float f, float f2, float f3, float f4, float f5, float f6) {
        int n = 0;
        int n2 = arrayList.size();
        while (n < n2 - 1) {
            if (arrn[n] == 1) {
                Vector2 vector2 = arrayList.get(n);
                float f7 = vector2.x;
                float f8 = vector2.y;
                int n3 = EarClippingTriangulator.computeSpannedAreaSign(f, f2, f3, f4, f7, f8);
                int n4 = EarClippingTriangulator.computeSpannedAreaSign(f3, f4, f5, f6, f7, f8);
                int n5 = EarClippingTriangulator.computeSpannedAreaSign(f5, f6, f, f2, f7, f8);
                if (n3 > 0 && n4 > 0 && n5 > 0) {
                    return true;
                }
                if (n3 <= 0 && n4 <= 0 && n5 <= 0) {
                    return true;
                }
            }
            ++n;
        }
        return false;
    }

    private static boolean isCollinear(ArrayList<Vector2> arrayList, int n) {
        return EarClippingTriangulator.isCollinear(arrayList, EarClippingTriangulator.computePreviousIndex(arrayList, n), n, EarClippingTriangulator.computeNextIndex(arrayList, n));
    }

    private static boolean isCollinear(ArrayList<Vector2> arrayList, int n, int n2, int n3) {
        Vector2 vector2 = arrayList.get(n);
        Vector2 vector22 = arrayList.get(n2);
        Vector2 vector23 = arrayList.get(n3);
        if (EarClippingTriangulator.computeSpannedAreaSign(vector2.x, vector2.y, vector22.x, vector22.y, vector23.x, vector23.y) != 0) return false;
        return true;
    }

    private boolean isEarTip(ArrayList<Vector2> arrayList, int n, int[] arrn) {
        if (this.mConcaveVertexCount == 0) return true;
        Vector2 vector2 = arrayList.get(EarClippingTriangulator.computePreviousIndex(arrayList, n));
        Vector2 vector22 = arrayList.get(n);
        Vector2 vector23 = arrayList.get(EarClippingTriangulator.computeNextIndex(arrayList, n));
        if (!EarClippingTriangulator.isAnyVertexInTriangle(arrayList, arrn, vector2.x, vector2.y, vector22.x, vector22.y, vector23.x, vector23.y)) return true;
        return false;
    }

    private static boolean isTriangleConvex(float f, float f2, float f3, float f4, float f5, float f6) {
        if (EarClippingTriangulator.computeSpannedAreaSign(f, f2, f3, f4, f5, f6) >= 0) return true;
        return false;
    }

    /*
     * Enabled aggressive block sorting
     */
    private static void removeCollinearNeighborEarsAfterRemovingEarTip(ArrayList<Vector2> arrayList, int n) {
        int n2 = n % arrayList.size();
        int n3 = EarClippingTriangulator.computePreviousIndex(arrayList, n2);
        if (EarClippingTriangulator.isCollinear(arrayList, n2)) {
            arrayList.remove(n2);
            if (arrayList.size() <= 3) return;
            int n4 = EarClippingTriangulator.computePreviousIndex(arrayList, n2);
            if (!EarClippingTriangulator.isCollinear(arrayList, n4)) return;
            arrayList.remove(n4);
            return;
        }
        if (!EarClippingTriangulator.isCollinear(arrayList, n3)) return;
        arrayList.remove(n3);
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     */
    @Override
    public List<Vector2> computeTriangles(List<Vector2> var1_1) {
        var2_2 = new ArrayList<E>();
        var3_3 = new ArrayList<Vector2>(var1_1.size());
        var3_3.addAll(var1_1);
        ** if (var3_3.size() != 3) goto lbl-1000
lbl5: // 1 sources:
        var2_2.addAll(var3_3);
        return var2_2;
        {
            var5_4 = this.classifyVertices(var3_3);
            var6_5 = var3_3.size();
            var7_6 = 0;
            do {
                if (var7_6 < var6_5) {
                    if (this.isEarTip(var3_3, var7_6, var5_4)) {
                        this.cutEarTip(var3_3, var7_6, (ArrayList<Vector2>)var2_2);
                    }
                } else lbl-1000: // 3 sources:
                {
                    if (var3_3.size() >= 3) continue block0;
                    return var2_2;
                }
                ++var7_6;
            } while (true);
        }
    }
}

