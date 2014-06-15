/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.Vector2;
import org.anddev.andengine.extension.physics.box2d.util.hull.BaseHullAlgorithm;
import org.anddev.andengine.extension.physics.box2d.util.hull.Vector2Util;

public class GrahamScan
extends BaseHullAlgorithm {
    private void grahamScan() {
        this.swap(0, this.indexOfLowestVertex());
        Vector2 vector2 = new Vector2(this.mVertices[0]);
        this.makeAllVerticesRelativeTo(vector2);
        this.sort();
        this.makeAllVerticesRelativeTo(new Vector2(vector2).mul(-1.0f));
        int n = 3;
        int n2 = 3;
        block0 : do {
            if (n2 >= this.mVertexCount) {
                this.mHullVertexCount = n;
                return;
            }
            this.swap(n, n2);
            do {
                if (this.isConvex(n - 1)) {
                    ++n2;
                    ++n;
                    continue block0;
                }
                int n3 = n - 1;
                int n4 = n - 1;
                this.swap(n3, n);
                n = n4;
            } while (true);
            break;
        } while (true);
    }

    private boolean isConvex(int n) {
        Vector2[] arrvector2 = this.mVertices;
        return Vector2Util.isConvex(arrvector2[n], arrvector2[n - 1], arrvector2[n + 1]);
    }

    private void makeAllVerticesRelativeTo(Vector2 vector2) {
        Vector2[] arrvector2 = this.mVertices;
        int n = this.mVertexCount;
        Vector2 vector22 = new Vector2(vector2);
        int n2 = 0;
        while (n2 < n) {
            arrvector2[n2].sub(vector22);
            ++n2;
        }
        return;
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     */
    private void quicksort(int var1_1, int var2_2) {
        var3_3 = this.mVertices;
        var4_4 = var1_1;
        var5_5 = var2_2;
        var6_6 = var3_3[(var1_1 + var2_2) / 2];
        block0 : do {
            ** if (var4_4 <= var5_5) goto lbl13
lbl7: // 1 sources:
            if (var1_1 < var5_5) {
                this.quicksort(var1_1, var5_5);
            }
            if (var4_4 >= var2_2) return;
            this.quicksort(var4_4, var2_2);
            return;
lbl-1000: // 1 sources:
            {
                ++var4_4;
lbl13: // 2 sources:
                ** while (Vector2Util.isLess((Vector2)var3_3[var4_4], (Vector2)var6_6))
            }
lbl14: // 1 sources:
            do {
                if (!Vector2Util.isLess(var6_6, var3_3[var5_5])) {
                    if (var4_4 > var5_5) continue block0;
                    var7_7 = var4_4 + 1;
                    var8_8 = var5_5 - 1;
                    this.swap(var4_4, var5_5);
                    var5_5 = var8_8;
                    var4_4 = var7_7;
                    continue block0;
                }
                --var5_5;
            } while (true);
            break;
        } while (true);
    }

    private void sort() {
        this.quicksort(1, -1 + this.mVertexCount);
    }

    @Override
    public int computeHull(Vector2[] arrvector2) {
        this.mVertices = arrvector2;
        this.mVertexCount = arrvector2.length;
        if (this.mVertexCount < 3) {
            return this.mVertexCount;
        }
        this.mHullVertexCount = 0;
        this.grahamScan();
        return this.mHullVertexCount;
    }
}

