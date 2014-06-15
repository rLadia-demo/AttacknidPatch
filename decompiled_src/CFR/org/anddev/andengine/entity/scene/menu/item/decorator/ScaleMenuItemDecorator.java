/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.menu.item.decorator;

import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.entity.scene.menu.item.decorator.BaseMenuItemDecorator;

public class ScaleMenuItemDecorator
extends BaseMenuItemDecorator {
    private final float mSelectedScale;
    private final float mUnselectedScale;

    public ScaleMenuItemDecorator(IMenuItem iMenuItem, float f, float f2) {
        super(iMenuItem);
        this.mSelectedScale = f;
        this.mUnselectedScale = f2;
        iMenuItem.setScale(f2);
    }

    @Override
    public void onMenuItemReset(IMenuItem iMenuItem) {
        this.setScale(this.mUnselectedScale);
    }

    @Override
    public void onMenuItemSelected(IMenuItem iMenuItem) {
        this.setScale(this.mSelectedScale);
    }

    @Override
    public void onMenuItemUnselected(IMenuItem iMenuItem) {
        this.setScale(this.mUnselectedScale);
    }
}

