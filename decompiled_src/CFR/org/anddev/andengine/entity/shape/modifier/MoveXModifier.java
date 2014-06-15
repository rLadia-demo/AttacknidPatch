/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.entity.shape.modifier.SingleValueSpanShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class MoveXModifier
extends SingleValueSpanShapeModifier {
    public MoveXModifier(float f, float f2, float f3) {
        this(f, f2, f3, null, IEaseFunction.DEFAULT);
    }

    public MoveXModifier(float f, float f2, float f3, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, f2, f3, iShapeModifierListener, IEaseFunction.DEFAULT);
    }

    public MoveXModifier(float f, float f2, float f3, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, iShapeModifierListener, iEaseFunction);
    }

    public MoveXModifier(float f, float f2, float f3, IEaseFunction iEaseFunction) {
        this(f, f2, f3, null, iEaseFunction);
    }

    protected MoveXModifier(MoveXModifier moveXModifier) {
        super(moveXModifier);
    }

    @Override
    public MoveXModifier clone() {
        return new MoveXModifier(this);
    }

    @Override
    protected void onSetInitialValue(IShape iShape, float f) {
        iShape.setPosition(f, iShape.getY());
    }

    @Override
    protected void onSetValue(IShape iShape, float f, float f2) {
        iShape.setPosition(f2, iShape.getY());
    }
}

