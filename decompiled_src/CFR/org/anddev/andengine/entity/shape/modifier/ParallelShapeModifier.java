/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ParallelModifier;

public class ParallelShapeModifier
extends ParallelModifier<IShape>
implements IShapeModifier {
    public /* varargs */ ParallelShapeModifier(IShapeModifier.IShapeModifierListener iShapeModifierListener, IShapeModifier ... arriShapeModifier) throws IllegalArgumentException {
        super(iShapeModifierListener, arriShapeModifier);
    }

    protected ParallelShapeModifier(ParallelShapeModifier parallelShapeModifier) {
        super(parallelShapeModifier);
    }

    public /* varargs */ ParallelShapeModifier(IShapeModifier ... arriShapeModifier) throws IllegalArgumentException {
        super(arriShapeModifier);
    }

    @Override
    public ParallelShapeModifier clone() {
        return new ParallelShapeModifier(this);
    }
}

