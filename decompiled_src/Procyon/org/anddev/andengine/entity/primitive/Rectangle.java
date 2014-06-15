package org.anddev.andengine.entity.primitive;

import org.anddev.andengine.opengl.vertex.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.opengl.util.*;

public class Rectangle extends BaseRectangle
{
    public Rectangle(final float n, final float n2, final float n3, final float n4) {
        super(n, n2, n3, n4);
    }
    
    public Rectangle(final float n, final float n2, final float n3, final float n4, final RectangleVertexBuffer rectangleVertexBuffer) {
        super(n, n2, n3, n4, rectangleVertexBuffer);
    }
    
    @Override
    protected void onInitDraw(final GL10 gl10) {
        super.onInitDraw(gl10);
        GLHelper.disableTextures(gl10);
        GLHelper.disableTexCoordArray(gl10);
    }
}
