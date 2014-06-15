/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.BaseSingleValueSpanModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class SingleValueSpanShapeModifier
extends BaseSingleValueSpanModifier<IShape>
implements IShapeModifier {
    public SingleValueSpanShapeModifier(float f, float f2, float f3) {
        super(f, f2, f3);
    }

    public SingleValueSpanShapeModifier(float f, float f2, float f3, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, f2, f3, iShapeModifierListener);
    }

    public SingleValueSpanShapeModifier(float f, float f2, float f3, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, iShapeModifierListener, iEaseFunction);
    }

    public SingleValueSpanShapeModifier(float f, float f2, float f3, IEaseFunction iEaseFunction) {
        super(f, f2, f3, iEaseFunction);
    }

    protected SingleValueSpanShapeModifier(SingleValueSpanShapeModifier singleValueSpanShapeModifier) {
        super(singleValueSpanShapeModifier);
    }
}

