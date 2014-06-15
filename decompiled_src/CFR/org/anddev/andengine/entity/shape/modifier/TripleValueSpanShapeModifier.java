/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.BaseTripleValueSpanModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class TripleValueSpanShapeModifier
extends BaseTripleValueSpanModifier<IShape>
implements IShapeModifier {
    public TripleValueSpanShapeModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, f4, f5, f6, f7, iShapeModifierListener, iEaseFunction);
    }

    public TripleValueSpanShapeModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, IEaseFunction iEaseFunction) {
        super(f, f2, f3, f4, f5, f6, f7, iEaseFunction);
    }

    protected TripleValueSpanShapeModifier(TripleValueSpanShapeModifier tripleValueSpanShapeModifier) {
        super(tripleValueSpanShapeModifier);
    }
}

