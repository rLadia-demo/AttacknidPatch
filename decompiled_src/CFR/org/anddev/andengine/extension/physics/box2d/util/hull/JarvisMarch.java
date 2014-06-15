/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.Vector2;
import org.anddev.andengine.extension.physics.box2d.util.Vector2Pool;
import org.anddev.andengine.extension.physics.box2d.util.hull.BaseHullAlgorithm;
import org.anddev.andengine.extension.physics.box2d.util.hull.Vector2Util;

public class JarvisMarch
extends BaseHullAlgorithm {
    private int indexOfRightmostVertexOf(Vector2 vector2) {
        Vector2[] arrvector2 = this.mVertices;
        int n = this.mVertexCount;
        int n2 = 0;
        int n3 = 1;
        while (n3 < n) {
            Vector2 vector22;
            Vector2 vector23 = Vector2Pool.obtain().set(arrvector2[n3]);
            if (Vector2Util.isLess(vector23.sub(vector2), (vector22 = Vector2Pool.obtain().set(arrvector2[n2])).sub(vector2))) {
                n2 = n3;
            }
            Vector2Pool.recycle(vector23);
            Vector2Pool.recycle(vector22);
            ++n3;
        }
        return n2;
    }

    private void jarvisMarch() {
        Vector2[] arrvector2 = this.mVertices;
        int n = this.indexOfLowestVertex();
        do {
            this.swap(this.mHullVertexCount, n);
            n = this.indexOfRightmostVertexOf(arrvector2[this.mHullVertexCount]);
            this.mHullVertexCount = 1 + this.mHullVertexCount;
        } while (n > 0);
    }

    @Override
    public int computeHull(Vector2[] arrvector2) {
        this.mVertices = arrvector2;
        this.mVertexCount = arrvector2.length;
        this.mHullVertexCount = 0;
        this.jarvisMarch();
        return this.mHullVertexCount;
    }
}

