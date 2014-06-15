package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.*;

public class GrahamScan extends BaseHullAlgorithm
{
    private void grahamScan() {
        this.swap(0, this.indexOfLowestVertex());
        final Vector2 vector2 = new Vector2(this.mVertices[0]);
        this.makeAllVerticesRelativeTo(vector2);
        this.sort();
        this.makeAllVerticesRelativeTo(new Vector2(vector2).mul(-1.0f));
        int mHullVertexCount = 3;
        for (int i = 3; i < this.mVertexCount; ++i, ++mHullVertexCount) {
            this.swap(mHullVertexCount, i);
            while (!this.isConvex(mHullVertexCount - 1)) {
                final int n = mHullVertexCount - 1;
                final int n2 = mHullVertexCount - 1;
                this.swap(n, mHullVertexCount);
                mHullVertexCount = n2;
            }
        }
        this.mHullVertexCount = mHullVertexCount;
    }
    
    private boolean isConvex(final int n) {
        final Vector2[] mVertices = this.mVertices;
        return Vector2Util.isConvex(mVertices[n], mVertices[n - 1], mVertices[n + 1]);
    }
    
    private void makeAllVerticesRelativeTo(Vector2 vector2) {
        final Vector2[] mVertices = this.mVertices;
        final int mVertexCount = this.mVertexCount;
        final Vector2 vector2 = new Vector2(vector2);
        for (int i = 0; i < mVertexCount; ++i) {
            mVertices[i].sub(vector2);
        }
    }
    
    private void quicksort(final int n, final int n2) {
        final Vector2[] mVertices = this.mVertices;
        int i = n;
        int n3 = n2;
        final Vector2 vector2 = mVertices[(n + n2) / 2];
        while (i <= n3) {
            while (Vector2Util.isLess(mVertices[i], vector2)) {
                ++i;
            }
            while (Vector2Util.isLess(vector2, mVertices[n3])) {
                --n3;
            }
            if (i <= n3) {
                final int n4 = i + 1;
                final int n5 = n3 - 1;
                this.swap(i, n3);
                n3 = n5;
                i = n4;
            }
        }
        if (n < n3) {
            this.quicksort(n, n3);
        }
        if (i < n2) {
            this.quicksort(i, n2);
        }
    }
    
    private void sort() {
        this.quicksort(1, -1 + this.mVertexCount);
    }
    
    @Override
    public int computeHull(final Vector2[] mVertices) {
        this.mVertices = mVertices;
        this.mVertexCount = mVertices.length;
        if (this.mVertexCount < 3) {
            return this.mVertexCount;
        }
        this.mHullVertexCount = 0;
        this.grahamScan();
        return this.mHullVertexCount;
    }
}
