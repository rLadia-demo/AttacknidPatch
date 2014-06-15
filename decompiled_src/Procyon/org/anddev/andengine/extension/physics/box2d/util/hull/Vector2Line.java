package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.*;

class Vector2Line
{
    Vector2 mVertexA;
    Vector2 mVertexB;
    
    public Vector2Line(final Vector2 mVertexA, final Vector2 mVertexB) {
        super();
        this.mVertexA = mVertexA;
        this.mVertexB = mVertexB;
    }
}
