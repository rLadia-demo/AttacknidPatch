/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.BaseSingleValueChangeModifier;
import org.anddev.andengine.util.modifier.IModifier;

public abstract class SingleValueChangeShapeModifier
extends BaseSingleValueChangeModifier<IShape>
implements IShapeModifier {
    public SingleValueChangeShapeModifier(float f, float f2) {
        super(f, f2);
    }

    public SingleValueChangeShapeModifier(float f, float f2, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, f2, iShapeModifierListener);
    }

    protected SingleValueChangeShapeModifier(SingleValueChangeShapeModifier singleValueChangeShapeModifier) {
        super(singleValueChangeShapeModifier);
    }
}

