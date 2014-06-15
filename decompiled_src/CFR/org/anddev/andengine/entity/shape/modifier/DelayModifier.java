/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.DurationShapeModifier;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;

public class DelayModifier
extends DurationShapeModifier {
    public DelayModifier(float f) {
        super(f);
    }

    public DelayModifier(float f, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, iShapeModifierListener);
    }

    protected DelayModifier(DelayModifier delayModifier) {
        super(delayModifier);
    }

    @Override
    public DelayModifier clone() {
        return new DelayModifier(this);
    }

    @Override
    protected void onManagedInitialize(IShape iShape) {
    }

    @Override
    protected void onManagedUpdate(float f2, IShape f2) {
    }
}

