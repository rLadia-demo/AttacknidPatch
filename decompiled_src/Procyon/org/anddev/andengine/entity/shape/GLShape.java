package org.anddev.andengine.entity.shape;

import org.anddev.andengine.opengl.vertex.*;
import org.anddev.andengine.opengl.util.*;
import javax.microedition.khronos.opengles.*;

public abstract class GLShape extends Shape
{
    public GLShape(final float n, final float n2) {
        super(n, n2);
    }
    
    protected abstract VertexBuffer getVertexBuffer();
    
    @Override
    protected void onApplyVertices(final GL10 gl10) {
        if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS) {
            final GL11 gl2 = (GL11)gl10;
            this.getVertexBuffer().selectOnHardware(gl2);
            GLHelper.vertexZeroPointer(gl2);
            return;
        }
        GLHelper.vertexPointer(gl10, this.getVertexBuffer().getFloatBuffer());
    }
    
    protected abstract void onUpdateVertexBuffer();
    
    protected void updateVertexBuffer() {
        this.onUpdateVertexBuffer();
    }
}
