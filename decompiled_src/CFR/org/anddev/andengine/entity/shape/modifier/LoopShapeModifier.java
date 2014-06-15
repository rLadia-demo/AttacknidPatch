/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.LoopModifier;

public class LoopShapeModifier
extends LoopModifier<IShape>
implements IShapeModifier {
    public LoopShapeModifier(int n, IShapeModifier iShapeModifier) {
        super(n, iShapeModifier);
    }

    public LoopShapeModifier(IShapeModifier.IShapeModifierListener iShapeModifierListener, int n, IShapeModifier iShapeModifier) {
        super(iShapeModifierListener, n, iShapeModifier);
    }

    public LoopShapeModifier(IShapeModifier.IShapeModifierListener iShapeModifierListener, int n, ILoopShapeModifierListener iLoopShapeModifierListener, IShapeModifier iShapeModifier) {
        super(iShapeModifierListener, n, iLoopShapeModifierListener, iShapeModifier);
    }

    public LoopShapeModifier(IShapeModifier iShapeModifier) {
        super(iShapeModifier);
    }

    protected LoopShapeModifier(LoopShapeModifier loopShapeModifier) {
        super(loopShapeModifier);
    }

    @Override
    public LoopShapeModifier clone() {
        return new LoopShapeModifier(this);
    }

    public interface ILoopShapeModifierListener
    extends LoopModifier.ILoopModifierListener<IShape> {
    }

}

