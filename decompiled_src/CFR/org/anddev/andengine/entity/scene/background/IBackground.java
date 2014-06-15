/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.background;

import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.opengl.IDrawable;
import org.anddev.andengine.util.modifier.IModifier;

public interface IBackground
extends IDrawable,
IUpdateHandler {
    public void addBackgroundModifier(IModifier<IBackground> var1);

    public void clearBackgroundModifiers();

    public boolean removeBackgroundModifier(IModifier<IBackground> var1);

    public void setColor(float var1, float var2, float var3);

    public void setColor(float var1, float var2, float var3, float var4);
}

