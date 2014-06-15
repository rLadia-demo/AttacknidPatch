/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 *  javax.microedition.khronos.opengles.GL11
 */
package org.anddev.andengine.entity.shape;

import javax.microedition.khronos.opengles.GL10;
import javax.microedition.khronos.opengles.GL11;
import org.anddev.andengine.entity.shape.Shape;
import org.anddev.andengine.opengl.util.FastFloatBuffer;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.opengl.vertex.VertexBuffer;

public abstract class GLShape
extends Shape {
    public GLShape(float f, float f2) {
        super(f, f2);
    }

    protected abstract VertexBuffer getVertexBuffer();

    @Override
    protected void onApplyVertices(GL10 gL10) {
        if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS) {
            GL11 gL11 = (GL11)gL10;
            this.getVertexBuffer().selectOnHardware(gL11);
            GLHelper.vertexZeroPointer(gL11);
            return;
        }
        GLHelper.vertexPointer(gL10, this.getVertexBuffer().getFloatBuffer());
    }

    protected abstract void onUpdateVertexBuffer();

    protected void updateVertexBuffer() {
        this.onUpdateVertexBuffer();
    }
}

