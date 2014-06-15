/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.sprite;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.entity.primitive.BaseRectangle;
import org.anddev.andengine.opengl.texture.region.BaseTextureRegion;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;

public abstract class BaseSprite
extends BaseRectangle {
    protected final BaseTextureRegion mTextureRegion;

    public BaseSprite(float f, float f2, float f3, float f4, BaseTextureRegion baseTextureRegion) {
        super(f, f2, f3, f4);
        this.mTextureRegion = baseTextureRegion;
        this.initBlendFunction();
    }

    public BaseSprite(float f, float f2, float f3, float f4, BaseTextureRegion baseTextureRegion, RectangleVertexBuffer rectangleVertexBuffer) {
        super(f, f2, f3, f4, rectangleVertexBuffer);
        this.mTextureRegion = baseTextureRegion;
        this.initBlendFunction();
    }

    private void initBlendFunction() {
        if (!this.mTextureRegion.getTexture().getTextureOptions().mPreMultipyAlpha) return;
        this.setBlendFunction(1, 771);
    }

    public BaseTextureRegion getTextureRegion() {
        return this.mTextureRegion;
    }

    @Override
    protected void onApplyTransformations(GL10 gL10) {
        super.onApplyTransformations(gL10);
        this.mTextureRegion.onApply(gL10);
    }

    @Override
    protected void onInitDraw(GL10 gL10) {
        super.onInitDraw(gL10);
        GLHelper.enableTextures(gL10);
        GLHelper.enableTexCoordArray(gL10);
    }

    @Override
    public void reset() {
        super.reset();
        this.initBlendFunction();
    }
}

