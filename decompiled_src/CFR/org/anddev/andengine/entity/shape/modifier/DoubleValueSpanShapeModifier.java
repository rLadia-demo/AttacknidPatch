/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.BaseDoubleValueSpanModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class DoubleValueSpanShapeModifier
extends BaseDoubleValueSpanModifier<IShape>
implements IShapeModifier {
    public DoubleValueSpanShapeModifier(float f, float f2, float f3, float f4, float f5) {
        super(f, f2, f3, f4, f5);
    }

    public DoubleValueSpanShapeModifier(float f, float f2, float f3, float f4, float f5, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, f2, f3, f4, f5, iShapeModifierListener);
    }

    public DoubleValueSpanShapeModifier(float f, float f2, float f3, float f4, float f5, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, f4, f5, iShapeModifierListener, iEaseFunction);
    }

    public DoubleValueSpanShapeModifier(float f, float f2, float f3, float f4, float f5, IEaseFunction iEaseFunction) {
        super(f, f2, f3, f4, f5, iEaseFunction);
    }

    protected DoubleValueSpanShapeModifier(DoubleValueSpanShapeModifier doubleValueSpanShapeModifier) {
        super(doubleValueSpanShapeModifier);
    }
}

