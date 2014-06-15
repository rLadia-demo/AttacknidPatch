package org.anddev.andengine.entity.sprite;

import org.anddev.andengine.entity.primitive.*;
import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.opengl.vertex.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.opengl.util.*;

public abstract class BaseSprite extends BaseRectangle
{
    protected final BaseTextureRegion mTextureRegion;
    
    public BaseSprite(final float n, final float n2, final float n3, final float n4, final BaseTextureRegion mTextureRegion) {
        super(n, n2, n3, n4);
        this.mTextureRegion = mTextureRegion;
        this.initBlendFunction();
    }
    
    public BaseSprite(final float n, final float n2, final float n3, final float n4, final BaseTextureRegion mTextureRegion, final RectangleVertexBuffer rectangleVertexBuffer) {
        super(n, n2, n3, n4, rectangleVertexBuffer);
        this.mTextureRegion = mTextureRegion;
        this.initBlendFunction();
    }
    
    private void initBlendFunction() {
        if (this.mTextureRegion.getTexture().getTextureOptions().mPreMultipyAlpha) {
            this.setBlendFunction(1, 771);
        }
    }
    
    public BaseTextureRegion getTextureRegion() {
        return this.mTextureRegion;
    }
    
    @Override
    protected void onApplyTransformations(final GL10 gl10) {
        super.onApplyTransformations(gl10);
        this.mTextureRegion.onApply(gl10);
    }
    
    @Override
    protected void onInitDraw(final GL10 gl10) {
        super.onInitDraw(gl10);
        GLHelper.enableTextures(gl10);
        GLHelper.enableTexCoordArray(gl10);
    }
    
    @Override
    public void reset() {
        super.reset();
        this.initBlendFunction();
    }
}
