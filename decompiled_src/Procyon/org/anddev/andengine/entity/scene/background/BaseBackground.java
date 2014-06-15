package org.anddev.andengine.entity.scene.background;

import org.anddev.andengine.util.modifier.*;

public abstract class BaseBackground implements IBackground
{
    private final ModifierList<IBackground> mBackgroundModifiers;
    
    public BaseBackground() {
        super();
        this.mBackgroundModifiers = new ModifierList<IBackground>(this);
    }
    
    @Override
    public void addBackgroundModifier(final IModifier<IBackground> modifier) {
        this.mBackgroundModifiers.add(modifier);
    }
    
    @Override
    public void clearBackgroundModifiers() {
        this.mBackgroundModifiers.clear();
    }
    
    @Override
    public void onUpdate(final float n) {
        this.mBackgroundModifiers.onUpdate(n);
    }
    
    @Override
    public boolean removeBackgroundModifier(final IModifier<IBackground> modifier) {
        return this.mBackgroundModifiers.remove(modifier);
    }
    
    @Override
    public void reset() {
        this.mBackgroundModifiers.reset();
    }
}
