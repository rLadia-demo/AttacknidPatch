package org.anddev.andengine.entity.primitive;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.opengl.vertex.*;

public abstract class BaseRectangle extends RectangularShape
{
    public BaseRectangle(final float n, final float n2, final float n3, final float n4) {
        super(n, n2, n3, n4, new RectangleVertexBuffer(35044));
        this.updateVertexBuffer();
    }
    
    public BaseRectangle(final float n, final float n2, final float n3, final float n4, final RectangleVertexBuffer rectangleVertexBuffer) {
        super(n, n2, n3, n4, rectangleVertexBuffer);
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
