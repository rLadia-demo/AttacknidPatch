/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.background;

import org.anddev.andengine.entity.scene.background.IBackground;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ModifierList;

public abstract class BaseBackground
implements IBackground {
    private final ModifierList<IBackground> mBackgroundModifiers;

    public BaseBackground() {
        this.mBackgroundModifiers = new ModifierList<BaseBackground>(this);
    }

    @Override
    public void addBackgroundModifier(IModifier<IBackground> iModifier) {
        this.mBackgroundModifiers.add(iModifier);
    }

    @Override
    public void clearBackgroundModifiers() {
        this.mBackgroundModifiers.clear();
    }

    @Override
    public void onUpdate(float f) {
        this.mBackgroundModifiers.onUpdate(f);
    }

    @Override
    public boolean removeBackgroundModifier(IModifier<IBackground> iModifier) {
        return this.mBackgroundModifiers.remove(iModifier);
    }

    @Override
    public void reset() {
        this.mBackgroundModifiers.reset();
    }
}

