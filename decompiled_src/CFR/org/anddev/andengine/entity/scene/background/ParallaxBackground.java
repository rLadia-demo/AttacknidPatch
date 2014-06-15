/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.scene.background;

import java.util.ArrayList;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.scene.background.ColorBackground;
import org.anddev.andengine.entity.shape.Shape;

public class ParallaxBackground
extends ColorBackground {
    private final ArrayList<ParallaxEntity> mParallaxEntities = new ArrayList<ParallaxEntity>();
    private int mParallaxEntityCount;
    protected float mParallaxValue;

    public ParallaxBackground(float f, float f2, float f3) {
        super(f, f2, f3);
    }

    public void addParallaxEntity(ParallaxEntity parallaxEntity) {
        this.mParallaxEntities.add(parallaxEntity);
        this.mParallaxEntityCount = 1 + this.mParallaxEntityCount;
    }

    @Override
    public void onDraw(GL10 gL10, Camera camera) {
        super.onDraw(gL10, camera);
        float f = this.mParallaxValue;
        ArrayList<ParallaxEntity> arrayList = this.mParallaxEntities;
        int n = 0;
        while (n < this.mParallaxEntityCount) {
            arrayList.get(n).onDraw(gL10, f, camera);
            ++n;
        }
        return;
    }

    public boolean removeParallaxEntity(ParallaxEntity parallaxEntity) {
        this.mParallaxEntityCount = -1 + this.mParallaxEntityCount;
        boolean bl = this.mParallaxEntities.remove(parallaxEntity);
        if (bl) return bl;
        this.mParallaxEntityCount = 1 + this.mParallaxEntityCount;
        return bl;
    }

    public void setParallaxValue(float f) {
        this.mParallaxValue = f;
    }

    public static class ParallaxEntity {
        final float mParallaxFactor;
        final Shape mShape;

        public ParallaxEntity(float f, Shape shape) {
            this.mParallaxFactor = f;
            this.mShape = shape;
        }

        public void onDraw(GL10 gL10, float f, Camera camera) {
            gL10.glPushMatrix();
            float f2 = camera.getWidth();
            float f3 = this.mShape.getWidthScaled();
            float f4 = f * this.mParallaxFactor % f3;
            do {
                if (f4 <= 0.0f) {
                    gL10.glTranslatef(f4, 0.0f, 0.0f);
                    float f5 = f4;
                    do {
                        this.mShape.onDraw(gL10, camera);
                        gL10.glTranslatef(f3, 0.0f, 0.0f);
                    } while ((f5+=f3) < f2);
                    gL10.glPopMatrix();
                    return;
                }
                f4-=f3;
            } while (true);
        }
    }

}

