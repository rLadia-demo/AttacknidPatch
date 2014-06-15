/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.entity.shape.modifier.TripleValueSpanShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class ColorModifier
extends TripleValueSpanShapeModifier {
    public ColorModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7) {
        this(f, f2, f3, f4, f5, f6, f7, null, IEaseFunction.DEFAULT);
    }

    public ColorModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, f2, f3, f4, f5, f6, f7, iShapeModifierListener, IEaseFunction.DEFAULT);
    }

    public ColorModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, f4, f5, f6, f7, iShapeModifierListener, iEaseFunction);
    }

    public ColorModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, IEaseFunction iEaseFunction) {
        this(f, f2, f3, f4, f5, f6, f7, null, iEaseFunction);
    }

    protected ColorModifier(ColorModifier colorModifier) {
        super(colorModifier);
    }

    @Override
    public ColorModifier clone() {
        return new ColorModifier(this);
    }

    @Override
    protected void onSetInitialValues(IShape iShape, float f, float f2, float f3) {
        iShape.setColor(f, f2, f3);
    }

    @Override
    protected void onSetValues(IShape iShape, float f, float f2, float f3, float f4) {
        iShape.setColor(f2, f3, f4);
    }
}

