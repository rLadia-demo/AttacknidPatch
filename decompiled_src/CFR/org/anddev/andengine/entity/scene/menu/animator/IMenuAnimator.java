/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.menu.animator;

import java.util.ArrayList;
import org.anddev.andengine.entity.scene.menu.animator.AlphaMenuAnimator;
import org.anddev.andengine.entity.scene.menu.item.IMenuItem;

public interface IMenuAnimator {
    public static final IMenuAnimator DEFAULT = new AlphaMenuAnimator();

    public void buildAnimations(ArrayList<IMenuItem> var1, float var2, float var3);

    public void prepareAnimations(ArrayList<IMenuItem> var1, float var2, float var3);
}

