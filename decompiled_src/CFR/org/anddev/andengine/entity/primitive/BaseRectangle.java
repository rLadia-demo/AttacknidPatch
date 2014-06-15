/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.primitive;

import org.anddev.andengine.entity.shape.RectangularShape;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;
import org.anddev.andengine.opengl.vertex.VertexBuffer;

public abstract class BaseRectangle
extends RectangularShape {
    public BaseRectangle(float f, float f2, float f3, float f4) {
        super(f, f2, f3, f4, new RectangleVertexBuffer(35044));
        this.updateVertexBuffer();
    }

    public BaseRectangle(float f, float f2, float f3, float f4, RectangleVertexBuffer rectangleVertexBuffer) {
        super(f, f2, f3, f4, rectangleVertexBuffer);
    }

    @Override
    public RectangleVertexBuffer getVertexBuffer() {
        return (RectangleVertexBuffer)super.getVertexBuffer();
    }

    @Override
    protected void onUpdateVertexBuffer() {
        this.getVertexBuffer().update(this.mWidth, this.mHeight);
    }
}

