/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier;

public interface IModifier<T>
extends Cloneable {
    public IModifier<T> clone();

    public float getDuration();

    public IModifierListener<T> getModifierListener();

    public boolean isFinished();

    public boolean isRemoveWhenFinished();

    public void onUpdate(float var1, T var2);

    public void reset();

    public void setModifierListener(IModifierListener<T> var1);

    public void setRemoveWhenFinished(boolean var1);

    public interface IModifierListener<T> {
        public void onModifierFinished(IModifier<T> var1, T var2);
    }

}

