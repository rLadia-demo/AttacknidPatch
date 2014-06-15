package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.*;

public class QuickHull extends BaseHullAlgorithm
{
    private static final float EPSILON = 0.001f;
    
    private void computeHullVertices(final Vector2Line vector2Line, final int n, final int n2) {
        if (n > n2) {
            return;
        }
        final int indexOfFurthestVertex = this.indexOfFurthestVertex(vector2Line, n, n2);
        final Vector2Line vector2Line2 = new Vector2Line(vector2Line.mVertexA, this.mVertices[indexOfFurthestVertex]);
        final Vector2Line vector2Line3 = new Vector2Line(this.mVertices[indexOfFurthestVertex], vector2Line.mVertexB);
        this.swap(indexOfFurthestVertex, n2);
        final int partition = this.partition(vector2Line2, n, n2 - 1);
        this.computeHullVertices(vector2Line2, n, partition - 1);
        this.swap(n2, partition);
        this.swap(partition, this.mHullVertexCount);
        ++this.mHullVertexCount;
        this.computeHullVertices(vector2Line3, partition + 1, this.partition(vector2Line3, partition + 1, n2) - 1);
    }
    
    private int indexOfFurthestVertex(final Vector2Line vector2Line, final int n, final int n2) {
        final Vector2[] mVertices = this.mVertices;
        int n3 = n;
        float n4 = 0.0f;
        for (int i = n; i <= n2; ++i) {
            final float n5 = -Vector2Util.area2(mVertices[i], vector2Line);
            if (n5 > n4 || (n5 == n4 && mVertices[i].x > mVertices[n3].y)) {
                n4 = n5;
                n3 = i;
            }
        }
        return n3;
    }
    
    private int partition(final Vector2Line vector2Line, final int n, final int n2) {
        final Vector2[] mVertices = this.mVertices;
        int i = n;
        int n3 = n2;
    Label_0012:
        while (i <= n3) {
            int j = i;
            while (true) {
                while (j <= n3) {
                    if (!Vector2Util.isRightOf(mVertices[j], vector2Line)) {
                        int n4 = n3;
                        while (j <= n4 && !Vector2Util.isRightOf(mVertices[n4], vector2Line)) {
                            --n4;
                        }
                        if (j <= n4) {
                            i = j + 1;
                            n3 = n4 - 1;
                            this.swap(j, n4);
                            continue Label_0012;
                        }
                        n3 = n4;
                        i = j;
                        continue Label_0012;
                    }
                    else {
                        ++j;
                    }
                }
                int n4 = n3;
                continue;
            }
        }
        return i;
    }
    
    private void quickHull() {
        this.swap(0, this.indexOfLowestVertex());
        ++this.mHullVertexCount;
        this.computeHullVertices(new Vector2Line(this.mVertices[0], new Vector2(this.mVertices[0]).add(-0.001f, 0.0f)), 1, -1 + this.mVertexCount);
    }
    
    @Override
    public int computeHull(final Vector2[] mVertices) {
        this.mVertices = mVertices;
        this.mVertexCount = this.mVertices.length;
        this.mHullVertexCount = 0;
        this.quickHull();
        return this.mHullVertexCount;
    }
}
