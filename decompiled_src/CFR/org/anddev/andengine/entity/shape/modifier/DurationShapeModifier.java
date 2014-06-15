/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.BaseDurationModifier;
import org.anddev.andengine.util.modifier.IModifier;

public abstract class DurationShapeModifier
extends BaseDurationModifier<IShape>
implements IShapeModifier {
    public DurationShapeModifier() {
    }

    public DurationShapeModifier(float f) {
        super(f);
    }

    public DurationShapeModifier(float f, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, iShapeModifierListener);
    }

    protected DurationShapeModifier(DurationShapeModifier durationShapeModifier) {
        super(durationShapeModifier);
    }
}

