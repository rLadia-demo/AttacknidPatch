/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.entity.shape.modifier.SingleValueSpanShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class RotationModifier
extends SingleValueSpanShapeModifier {
    public RotationModifier(float f, float f2, float f3) {
        this(f, f2, f3, null, IEaseFunction.DEFAULT);
    }

    public RotationModifier(float f, float f2, float f3, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, f2, f3, iShapeModifierListener, IEaseFunction.DEFAULT);
    }

    public RotationModifier(float f, float f2, float f3, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, iShapeModifierListener, iEaseFunction);
    }

    public RotationModifier(float f, float f2, float f3, IEaseFunction iEaseFunction) {
        this(f, f2, f3, null, iEaseFunction);
    }

    protected RotationModifier(RotationModifier rotationModifier) {
        super(rotationModifier);
    }

    @Override
    public RotationModifier clone() {
        return new RotationModifier(this);
    }

    @Override
    protected void onSetInitialValue(IShape iShape, float f) {
        iShape.setRotation(f);
    }

    @Override
    protected void onSetValue(IShape iShape, float f, float f2) {
        iShape.setRotation(f2);
    }
}

