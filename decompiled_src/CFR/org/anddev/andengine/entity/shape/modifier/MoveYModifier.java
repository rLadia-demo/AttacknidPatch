/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.entity.shape.modifier.SingleValueSpanShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class MoveYModifier
extends SingleValueSpanShapeModifier {
    public MoveYModifier(float f, float f2, float f3) {
        this(f, f2, f3, null, IEaseFunction.DEFAULT);
    }

    public MoveYModifier(float f, float f2, float f3, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, f2, f3, iShapeModifierListener, IEaseFunction.DEFAULT);
    }

    public MoveYModifier(float f, float f2, float f3, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, iShapeModifierListener, iEaseFunction);
    }

    public MoveYModifier(float f, float f2, float f3, IEaseFunction iEaseFunction) {
        this(f, f2, f3, null, iEaseFunction);
    }

    protected MoveYModifier(MoveYModifier moveYModifier) {
        super(moveYModifier);
    }

    @Override
    public MoveYModifier clone() {
        return new MoveYModifier(this);
    }

    @Override
    protected void onSetInitialValue(IShape iShape, float f) {
        iShape.setPosition(iShape.getX(), f);
    }

    @Override
    protected void onSetValue(IShape iShape, float f, float f2) {
        iShape.setPosition(iShape.getX(), f2);
    }
}

