package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.*;
import org.anddev.andengine.extension.physics.box2d.util.*;

public class JarvisMarch extends BaseHullAlgorithm
{
    private int indexOfRightmostVertexOf(final Vector2 vector2) {
        final Vector2[] mVertices = this.mVertices;
        final int mVertexCount = this.mVertexCount;
        int n = 0;
        for (int i = 1; i < mVertexCount; ++i) {
            final Vector2 set = Vector2Pool.obtain().set(mVertices[i]);
            final Vector2 set2 = Vector2Pool.obtain().set(mVertices[n]);
            if (Vector2Util.isLess(set.sub(vector2), set2.sub(vector2))) {
                n = i;
            }
            Vector2Pool.recycle(set);
            Vector2Pool.recycle(set2);
        }
        return n;
    }
    
    private void jarvisMarch() {
        final Vector2[] mVertices = this.mVertices;
        int i = this.indexOfLowestVertex();
        do {
            this.swap(this.mHullVertexCount, i);
            i = this.indexOfRightmostVertexOf(mVertices[this.mHullVertexCount]);
            ++this.mHullVertexCount;
        } while (i > 0);
    }
    
    @Override
    public int computeHull(final Vector2[] mVertices) {
        this.mVertices = mVertices;
        this.mVertexCount = mVertices.length;
        this.mHullVertexCount = 0;
        this.jarvisMarch();
        return this.mHullVertexCount;
    }
}
