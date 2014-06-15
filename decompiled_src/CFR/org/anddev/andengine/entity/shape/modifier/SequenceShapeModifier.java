/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.SequenceModifier;

public class SequenceShapeModifier
extends SequenceModifier<IShape>
implements IShapeModifier {
    public /* varargs */ SequenceShapeModifier(IShapeModifier.IShapeModifierListener iShapeModifierListener, ISubSequenceShapeModifierListener iSubSequenceShapeModifierListener, IShapeModifier ... arriShapeModifier) throws IllegalArgumentException {
        super(iShapeModifierListener, iSubSequenceShapeModifierListener, arriShapeModifier);
    }

    public /* varargs */ SequenceShapeModifier(IShapeModifier.IShapeModifierListener iShapeModifierListener, IShapeModifier ... arriShapeModifier) throws IllegalArgumentException {
        super(iShapeModifierListener, arriShapeModifier);
    }

    protected SequenceShapeModifier(SequenceShapeModifier sequenceShapeModifier) {
        super(sequenceShapeModifier);
    }

    public /* varargs */ SequenceShapeModifier(IShapeModifier ... arriShapeModifier) throws IllegalArgumentException {
        super(arriShapeModifier);
    }

    @Override
    public SequenceShapeModifier clone() {
        return new SequenceShapeModifier(this);
    }

    public interface ISubSequenceShapeModifierListener
    extends SequenceModifier.ISubSequenceModifierListener<IShape> {
    }

}

