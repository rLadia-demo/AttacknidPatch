/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.entity.shape.modifier.RotationModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class RotationAtModifier
extends RotationModifier {
    private final float mRotationCenterX;
    private final float mRotationCenterY;

    public RotationAtModifier(float f, float f2, float f3, float f4, float f5) {
        super(f, f2, f3, IEaseFunction.DEFAULT);
        this.mRotationCenterX = f4;
        this.mRotationCenterY = f5;
    }

    public RotationAtModifier(float f, float f2, float f3, float f4, float f5, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, f2, f3, iShapeModifierListener, IEaseFunction.DEFAULT);
        this.mRotationCenterX = f4;
        this.mRotationCenterY = f5;
    }

    public RotationAtModifier(float f, float f2, float f3, float f4, float f5, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, iShapeModifierListener, iEaseFunction);
        this.mRotationCenterX = f4;
        this.mRotationCenterY = f5;
    }

    public RotationAtModifier(float f, float f2, float f3, float f4, float f5, IEaseFunction iEaseFunction) {
        super(f, f2, f3, iEaseFunction);
        this.mRotationCenterX = f4;
        this.mRotationCenterY = f5;
    }

    protected RotationAtModifier(RotationAtModifier rotationAtModifier) {
        super(rotationAtModifier);
        this.mRotationCenterX = rotationAtModifier.mRotationCenterX;
        this.mRotationCenterY = rotationAtModifier.mRotationCenterY;
    }

    @Override
    public RotationAtModifier clone() {
        return new RotationAtModifier(this);
    }

    @Override
    protected void onManagedInitialize(IShape iShape) {
        super.onManagedInitialize((Object)iShape);
        iShape.setRotationCenter(this.mRotationCenterX, this.mRotationCenterY);
    }
}

