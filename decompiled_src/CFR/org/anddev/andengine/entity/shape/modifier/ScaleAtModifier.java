/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.entity.shape.modifier.ScaleModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class ScaleAtModifier
extends ScaleModifier {
    private final float mScaleCenterX;
    private final float mScaleCenterY;

    public ScaleAtModifier(float f, float f2, float f3, float f4, float f5) {
        this(f, f2, f3, f4, f5, IEaseFunction.DEFAULT);
    }

    public ScaleAtModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7) {
        this(f, f2, f3, f4, f5, f6, f7, IEaseFunction.DEFAULT);
    }

    public ScaleAtModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        this(f, f2, f3, f4, f5, f6, f7, iShapeModifierListener, IEaseFunction.DEFAULT);
    }

    public ScaleAtModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, f4, f5, iShapeModifierListener, iEaseFunction);
        this.mScaleCenterX = f6;
        this.mScaleCenterY = f7;
    }

    public ScaleAtModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, IEaseFunction iEaseFunction) {
        this(f, f2, f3, f4, f5, f6, f7, null, iEaseFunction);
    }

    public ScaleAtModifier(float f, float f2, float f3, float f4, float f5, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        this(f, f2, f3, f4, f5, iShapeModifierListener, IEaseFunction.DEFAULT);
    }

    public ScaleAtModifier(float f, float f2, float f3, float f4, float f5, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        this(f, f2, f3, f2, f3, f4, f5, iShapeModifierListener, iEaseFunction);
    }

    public ScaleAtModifier(float f, float f2, float f3, float f4, float f5, IEaseFunction iEaseFunction) {
        this(f, f2, f3, f4, f5, null, iEaseFunction);
    }

    protected ScaleAtModifier(ScaleAtModifier scaleAtModifier) {
        super(scaleAtModifier);
        this.mScaleCenterX = scaleAtModifier.mScaleCenterX;
        this.mScaleCenterY = scaleAtModifier.mScaleCenterY;
    }

    @Override
    public ScaleAtModifier clone() {
        return new ScaleAtModifier(this);
    }

    @Override
    protected void onManagedInitialize(IShape iShape) {
        super.onManagedInitialize((Object)iShape);
        iShape.setScaleCenter(this.mScaleCenterX, this.mScaleCenterY);
    }
}

