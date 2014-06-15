/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.BaseModifier;
import org.anddev.andengine.util.modifier.IModifier;

public abstract class ShapeModifier
extends BaseModifier<IShape>
implements IShapeModifier {
    public ShapeModifier() {
    }

    public ShapeModifier(IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(iShapeModifierListener);
    }

    protected ShapeModifier(ShapeModifier shapeModifier) {
        super(shapeModifier);
    }
}

