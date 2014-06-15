/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.primitive;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.entity.primitive.BaseRectangle;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;

public class Rectangle
extends BaseRectangle {
    public Rectangle(float f, float f2, float f3, float f4) {
        super(f, f2, f3, f4);
    }

    public Rectangle(float f, float f2, float f3, float f4, RectangleVertexBuffer rectangleVertexBuffer) {
        super(f, f2, f3, f4, rectangleVertexBuffer);
    }

    @Override
    protected void onInitDraw(GL10 gL10) {
        super.onInitDraw(gL10);
        GLHelper.disableTextures(gL10);
        GLHelper.disableTexCoordArray(gL10);
    }
}

