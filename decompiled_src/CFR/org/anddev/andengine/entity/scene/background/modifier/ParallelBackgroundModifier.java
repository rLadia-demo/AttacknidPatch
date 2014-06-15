/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.background.modifier;

import org.anddev.andengine.entity.scene.background.IBackground;
import org.anddev.andengine.entity.scene.background.modifier.IBackgroundModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ParallelModifier;

public class ParallelBackgroundModifier
extends ParallelModifier<IBackground>
implements IBackgroundModifier {
    public /* varargs */ ParallelBackgroundModifier(IBackgroundModifier.IBackgroundModifierListener iBackgroundModifierListener, IBackgroundModifier ... arriBackgroundModifier) throws IllegalArgumentException {
        super(iBackgroundModifierListener, arriBackgroundModifier);
    }

    protected ParallelBackgroundModifier(ParallelBackgroundModifier parallelBackgroundModifier) {
        super(parallelBackgroundModifier);
    }

    public /* varargs */ ParallelBackgroundModifier(IBackgroundModifier ... arriBackgroundModifier) throws IllegalArgumentException {
        super(arriBackgroundModifier);
    }

    @Override
    public ParallelBackgroundModifier clone() {
        return new ParallelBackgroundModifier(this);
    }
}

