/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.DoubleValueSpanShapeModifier;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class ScaleModifier
extends DoubleValueSpanShapeModifier {
    public ScaleModifier(float f, float f2, float f3) {
        this(f, f2, f3, null, IEaseFunction.DEFAULT);
    }

    public ScaleModifier(float f, float f2, float f3, float f4, float f5) {
        this(f, f2, f3, f4, f5, null, IEaseFunction.DEFAULT);
    }

    public ScaleModifier(float f, float f2, float f3, float f4, float f5, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, f2, f3, f4, f5, iShapeModifierListener, IEaseFunction.DEFAULT);
    }

    public ScaleModifier(float f, float f2, float f3, float f4, float f5, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, f4, f5, iShapeModifierListener, iEaseFunction);
    }

    public ScaleModifier(float f, float f2, float f3, float f4, float f5, IEaseFunction iEaseFunction) {
        this(f, f2, f3, f4, f5, null, iEaseFunction);
    }

    public ScaleModifier(float f, float f2, float f3, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        this(f, f2, f3, f2, f3, iShapeModifierListener, IEaseFunction.DEFAULT);
    }

    public ScaleModifier(float f, float f2, float f3, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        this(f, f2, f3, f2, f3, iShapeModifierListener, iEaseFunction);
    }

    public ScaleModifier(float f, float f2, float f3, IEaseFunction iEaseFunction) {
        this(f, f2, f3, null, iEaseFunction);
    }

    protected ScaleModifier(ScaleModifier scaleModifier) {
        super(scaleModifier);
    }

    @Override
    public ScaleModifier clone() {
        return new ScaleModifier(this);
    }

    @Override
    protected void onSetInitialValues(IShape iShape, float f, float f2) {
        iShape.setScale(f, f2);
    }

    @Override
    protected void onSetValues(IShape iShape, float f, float f2, float f3) {
        iShape.setScale(f2, f3);
    }
}

