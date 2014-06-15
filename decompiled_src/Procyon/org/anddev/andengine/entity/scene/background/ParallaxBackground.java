package org.anddev.andengine.entity.scene.background;

import java.util.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.entity.shape.*;

public class ParallaxBackground extends ColorBackground
{
    private final ArrayList<ParallaxEntity> mParallaxEntities;
    private int mParallaxEntityCount;
    protected float mParallaxValue;
    
    public ParallaxBackground(final float n, final float n2, final float n3) {
        super(n, n2, n3);
        this.mParallaxEntities = new ArrayList<ParallaxEntity>();
    }
    
    public void addParallaxEntity(final ParallaxEntity parallaxEntity) {
        this.mParallaxEntities.add(parallaxEntity);
        ++this.mParallaxEntityCount;
    }
    
    @Override
    public void onDraw(final GL10 gl10, final Camera camera) {
        super.onDraw(gl10, camera);
        final float mParallaxValue = this.mParallaxValue;
        final ArrayList<ParallaxEntity> mParallaxEntities = this.mParallaxEntities;
        for (int i = 0; i < this.mParallaxEntityCount; ++i) {
            mParallaxEntities.get(i).onDraw(gl10, mParallaxValue, camera);
        }
    }
    
    public boolean removeParallaxEntity(final ParallaxEntity parallaxEntity) {
        --this.mParallaxEntityCount;
        final boolean remove = this.mParallaxEntities.remove(parallaxEntity);
        if (!remove) {
            ++this.mParallaxEntityCount;
        }
        return remove;
    }
    
    public void setParallaxValue(final float mParallaxValue) {
        this.mParallaxValue = mParallaxValue;
    }
    
    public static class ParallaxEntity
    {
        final float mParallaxFactor;
        final Shape mShape;
        
        public ParallaxEntity(final float mParallaxFactor, final Shape mShape) {
            super();
            this.mParallaxFactor = mParallaxFactor;
            this.mShape = mShape;
        }
        
        public void onDraw(final GL10 gl10, final float n, final Camera camera) {
            gl10.glPushMatrix();
            final float width = camera.getWidth();
            float widthScaled;
            float n2;
            for (widthScaled = this.mShape.getWidthScaled(), n2 = n * this.mParallaxFactor % widthScaled; n2 > 0.0f; n2 -= widthScaled) {}
            gl10.glTranslatef(n2, 0.0f, 0.0f);
            float n3 = n2;
            do {
                this.mShape.onDraw(gl10, camera);
                gl10.glTranslatef(widthScaled, 0.0f, 0.0f);
                n3 += widthScaled;
            } while (n3 < width);
            gl10.glPopMatrix();
        }
    }
}
