/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier;

import java.util.ArrayList;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.util.modifier.IModifier;

public class ModifierList<T>
extends ArrayList<IModifier<T>>
implements IUpdateHandler {
    private static final long serialVersionUID = 1610345592534873475L;
    private final T mTarget;

    public ModifierList(T T) {
        this.mTarget = T;
    }

    public T getTarget() {
        return this.mTarget;
    }

    @Override
    public void onUpdate(float f) {
        int n = this.size();
        if (n <= 0) return;
        int n2 = n - 1;
        while (n2 >= 0) {
            IModifier iModifier = (IModifier)this.get(n2);
            iModifier.onUpdate(f, this.mTarget);
            if (iModifier.isFinished() && iModifier.isRemoveWhenFinished()) {
                this.remove(n2);
            }
            --n2;
        }
        return;
    }

    @Override
    public void reset() {
        int n = -1 + this.size();
        while (n >= 0) {
            ((IModifier)this.get(n)).reset();
            --n;
        }
        return;
    }
}

