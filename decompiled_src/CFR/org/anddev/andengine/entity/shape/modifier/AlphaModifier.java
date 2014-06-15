/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.entity.shape.modifier.SingleValueSpanShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class AlphaModifier
extends SingleValueSpanShapeModifier {
    public AlphaModifier(float f, float f2, float f3) {
        this(f, f2, f3, null, IEaseFunction.DEFAULT);
    }

    public AlphaModifier(float f, float f2, float f3, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, f2, f3, iShapeModifierListener, IEaseFunction.DEFAULT);
    }

    public AlphaModifier(float f, float f2, float f3, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, iShapeModifierListener, iEaseFunction);
    }

    public AlphaModifier(float f, float f2, float f3, IEaseFunction iEaseFunction) {
        this(f, f2, f3, null, iEaseFunction);
    }

    protected AlphaModifier(AlphaModifier alphaModifier) {
        super(alphaModifier);
    }

    @Override
    public AlphaModifier clone() {
        return new AlphaModifier(this);
    }

    @Override
    protected void onSetInitialValue(IShape iShape, float f) {
        iShape.setAlpha(f);
    }

    @Override
    protected void onSetValue(IShape iShape, float f, float f2) {
        iShape.setAlpha(f2);
    }
}

