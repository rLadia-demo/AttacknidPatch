package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.*;

public abstract class BaseHullAlgorithm implements IHullAlgorithm
{
    protected int mHullVertexCount;
    protected int mVertexCount;
    protected Vector2[] mVertices;
    
    protected int indexOfLowestVertex() {
        final Vector2[] mVertices = this.mVertices;
        final int mVertexCount = this.mVertexCount;
        int n = 0;
        for (int i = 1; i < mVertexCount; ++i) {
            final float n2 = mVertices[i].y - mVertices[n].y;
            final float n3 = mVertices[i].x - mVertices[n].x;
            if (n2 < 0.0f || (n2 == 0.0f && n3 < 0.0f)) {
                n = i;
            }
        }
        return n;
    }
    
    protected void swap(final int n, final int n2) {
        final Vector2[] mVertices = this.mVertices;
        final Vector2 vector2 = mVertices[n];
        mVertices[n] = mVertices[n2];
        mVertices[n2] = vector2;
    }
}
