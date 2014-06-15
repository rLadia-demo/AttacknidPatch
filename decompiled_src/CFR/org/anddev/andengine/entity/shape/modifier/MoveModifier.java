/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.DoubleValueSpanShapeModifier;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class MoveModifier
extends DoubleValueSpanShapeModifier {
    public MoveModifier(float f, float f2, float f3, float f4, float f5) {
        this(f, f2, f3, f4, f5, null, IEaseFunction.DEFAULT);
    }

    public MoveModifier(float f, float f2, float f3, float f4, float f5, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, f2, f3, f4, f5, iShapeModifierListener, IEaseFunction.DEFAULT);
    }

    public MoveModifier(float f, float f2, float f3, float f4, float f5, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, f4, f5, iShapeModifierListener, iEaseFunction);
    }

    public MoveModifier(float f, float f2, float f3, float f4, float f5, IEaseFunction iEaseFunction) {
        this(f, f2, f3, f4, f5, null, iEaseFunction);
    }

    protected MoveModifier(MoveModifier moveModifier) {
        super(moveModifier);
    }

    @Override
    public MoveModifier clone() {
        return new MoveModifier(this);
    }

    @Override
    protected void onSetInitialValues(IShape iShape, float f, float f2) {
        iShape.setPosition(f, f2);
    }

    @Override
    protected void onSetValues(IShape iShape, float f, float f2, float f3) {
        iShape.setPosition(f2, f3);
    }
}

