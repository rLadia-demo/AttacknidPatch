/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.Vector2;
import org.anddev.andengine.extension.physics.box2d.util.hull.BaseHullAlgorithm;
import org.anddev.andengine.extension.physics.box2d.util.hull.Vector2Line;
import org.anddev.andengine.extension.physics.box2d.util.hull.Vector2Util;

public class QuickHull
extends BaseHullAlgorithm {
    private static final float EPSILON = 0.001f;

    private void computeHullVertices(Vector2Line vector2Line, int n, int n2) {
        if (n > n2) {
            return;
        }
        int n3 = this.indexOfFurthestVertex(vector2Line, n, n2);
        Vector2Line vector2Line2 = new Vector2Line(vector2Line.mVertexA, this.mVertices[n3]);
        Vector2Line vector2Line3 = new Vector2Line(this.mVertices[n3], vector2Line.mVertexB);
        this.swap(n3, n2);
        int n4 = this.partition(vector2Line2, n, n2 - 1);
        this.computeHullVertices(vector2Line2, n, n4 - 1);
        this.swap(n2, n4);
        this.swap(n4, this.mHullVertexCount);
        this.mHullVertexCount = 1 + this.mHullVertexCount;
        int n5 = this.partition(vector2Line3, n4 + 1, n2);
        this.computeHullVertices(vector2Line3, n4 + 1, n5 - 1);
    }

    private int indexOfFurthestVertex(Vector2Line vector2Line, int n, int n2) {
        Vector2[] arrvector2 = this.mVertices;
        int n3 = n;
        float f = 0.0f;
        int n4 = n;
        while (n4 <= n2) {
            float f2;
            if ((f2 = - Vector2Util.area2(arrvector2[n4], vector2Line)) > f || f2 == f && arrvector2[n4].x > arrvector2[n3].y) {
                f = f2;
                n3 = n4;
            }
            ++n4;
        }
        return n3;
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     */
    private int partition(Vector2Line var1_1, int var2_2, int var3_3) {
        var4_4 = this.mVertices;
        var5_5 = var2_2;
        var6_6 = var3_3;
        block0 : while (var5_5 <= var6_6) {
            block4 : {
                var7_7 = var5_5;
                ** GOTO lbl8
lbl-1000: // 1 sources:
                {
                    ++var7_7;
lbl8: // 2 sources:
                    if (var7_7 > var6_6) break block4;
                    ** while (Vector2Util.isRightOf((Vector2)var4_4[var7_7], (Vector2Line)var1_1))
                }
lbl10: // 1 sources:
                var8_8 = var6_6;
                ** GOTO lbl14
            }
            var8_8 = var6_6;
lbl14: // 2 sources:
            do {
                if (var7_7 > var8_8 || Vector2Util.isRightOf(var4_4[var8_8], var1_1)) {
                    if (var7_7 > var8_8) break;
                    var5_5 = var7_7 + 1;
                    var6_6 = var8_8 - 1;
                    this.swap(var7_7, var8_8);
                    continue block0;
                }
                --var8_8;
            } while (true);
            var6_6 = var8_8;
            var5_5 = var7_7;
        }
        return var5_5;
    }

    private void quickHull() {
        this.swap(0, this.indexOfLowestVertex());
        this.mHullVertexCount = 1 + this.mHullVertexCount;
        this.computeHullVertices(new Vector2Line(this.mVertices[0], new Vector2(this.mVertices[0]).add(-0.001f, 0.0f)), 1, -1 + this.mVertexCount);
    }

    @Override
    public int computeHull(Vector2[] arrvector2) {
        this.mVertices = arrvector2;
        this.mVertexCount = this.mVertices.length;
        this.mHullVertexCount = 0;
        this.quickHull();
        return this.mHullVertexCount;
    }
}

