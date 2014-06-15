/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.SingleValueChangeShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;

public class RotationByModifier
extends SingleValueChangeShapeModifier {
    public RotationByModifier(float f, float f2) {
        super(f, f2);
    }

    protected RotationByModifier(RotationByModifier rotationByModifier) {
        super(rotationByModifier);
    }

    @Override
    public RotationByModifier clone() {
        return new RotationByModifier(this);
    }

    @Override
    protected void onChangeValue(IShape iShape, float f) {
        iShape.setRotation(f + iShape.getRotation());
    }
}

