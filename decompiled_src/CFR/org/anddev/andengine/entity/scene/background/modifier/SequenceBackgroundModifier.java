/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.background.modifier;

import org.anddev.andengine.entity.scene.background.IBackground;
import org.anddev.andengine.entity.scene.background.modifier.IBackgroundModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.SequenceModifier;

public class SequenceBackgroundModifier
extends SequenceModifier<IBackground>
implements IBackgroundModifier {
    public /* varargs */ SequenceBackgroundModifier(IBackgroundModifier.IBackgroundModifierListener iBackgroundModifierListener, ISubSequenceBackgroundModifierListener iSubSequenceBackgroundModifierListener, IBackgroundModifier ... arriBackgroundModifier) throws IllegalArgumentException {
        super(iBackgroundModifierListener, iSubSequenceBackgroundModifierListener, arriBackgroundModifier);
    }

    public /* varargs */ SequenceBackgroundModifier(IBackgroundModifier.IBackgroundModifierListener iBackgroundModifierListener, IBackgroundModifier ... arriBackgroundModifier) throws IllegalArgumentException {
        super(iBackgroundModifierListener, arriBackgroundModifier);
    }

    protected SequenceBackgroundModifier(SequenceBackgroundModifier sequenceBackgroundModifier) {
        super(sequenceBackgroundModifier);
    }

    public /* varargs */ SequenceBackgroundModifier(IBackgroundModifier ... arriBackgroundModifier) throws IllegalArgumentException {
        super(arriBackgroundModifier);
    }

    @Override
    public SequenceBackgroundModifier clone() {
        return new SequenceBackgroundModifier(this);
    }

    public interface ISubSequenceBackgroundModifierListener
    extends SequenceModifier.ISubSequenceModifierListener<IBackground> {
    }

}

