/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.background.modifier;

import org.anddev.andengine.entity.scene.background.IBackground;
import org.anddev.andengine.entity.scene.background.modifier.IBackgroundModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.LoopModifier;

public class LoopBackgroundModifier
extends LoopModifier<IBackground>
implements IBackgroundModifier {
    public LoopBackgroundModifier(int n, IBackgroundModifier iBackgroundModifier) {
        super(n, iBackgroundModifier);
    }

    public LoopBackgroundModifier(IBackgroundModifier.IBackgroundModifierListener iBackgroundModifierListener, int n, IBackgroundModifier iBackgroundModifier) {
        super(iBackgroundModifierListener, n, iBackgroundModifier);
    }

    public LoopBackgroundModifier(IBackgroundModifier.IBackgroundModifierListener iBackgroundModifierListener, int n, ILoopBackgroundModifierListener iLoopBackgroundModifierListener, IBackgroundModifier iBackgroundModifier) {
        super(iBackgroundModifierListener, n, iLoopBackgroundModifierListener, iBackgroundModifier);
    }

    public LoopBackgroundModifier(IBackgroundModifier iBackgroundModifier) {
        super(iBackgroundModifier);
    }

    protected LoopBackgroundModifier(LoopBackgroundModifier loopBackgroundModifier) {
        super(loopBackgroundModifier);
    }

    @Override
    public LoopBackgroundModifier clone() {
        return new LoopBackgroundModifier(this);
    }

    public interface ILoopBackgroundModifierListener
    extends LoopModifier.ILoopModifierListener<IBackground> {
    }

}

