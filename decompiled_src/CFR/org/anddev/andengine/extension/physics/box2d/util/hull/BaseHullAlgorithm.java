/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.Vector2;
import org.anddev.andengine.extension.physics.box2d.util.hull.IHullAlgorithm;

public abstract class BaseHullAlgorithm
implements IHullAlgorithm {
    protected int mHullVertexCount;
    protected int mVertexCount;
    protected Vector2[] mVertices;

    protected int indexOfLowestVertex() {
        Vector2[] arrvector2 = this.mVertices;
        int n = this.mVertexCount;
        int n2 = 0;
        int n3 = 1;
        while (n3 < n) {
            float f = arrvector2[n3].y - arrvector2[n2].y;
            float f2 = arrvector2[n3].x - arrvector2[n2].x;
            if (f < 0.0f || f == 0.0f && f2 < 0.0f) {
                n2 = n3;
            }
            ++n3;
        }
        return n2;
    }

    protected void swap(int n, int n2) {
        Vector2[] arrvector2 = this.mVertices;
        Vector2 vector2 = arrvector2[n];
        arrvector2[n] = arrvector2[n2];
        arrvector2[n2] = vector2;
    }
}

