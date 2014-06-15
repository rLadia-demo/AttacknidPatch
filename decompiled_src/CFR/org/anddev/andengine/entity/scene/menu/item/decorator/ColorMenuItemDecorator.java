/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.menu.item.decorator;

import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.entity.scene.menu.item.decorator.BaseMenuItemDecorator;

public class ColorMenuItemDecorator
extends BaseMenuItemDecorator {
    private final float mSelectedBlue;
    private final float mSelectedGreen;
    private final float mSelectedRed;
    private final float mUnselectedBlue;
    private final float mUnselectedGreen;
    private final float mUnselectedRed;

    public ColorMenuItemDecorator(IMenuItem iMenuItem, float f, float f2, float f3, float f4, float f5, float f6) {
        super(iMenuItem);
        this.mSelectedRed = f;
        this.mSelectedGreen = f2;
        this.mSelectedBlue = f3;
        this.mUnselectedRed = f4;
        this.mUnselectedGreen = f5;
        this.mUnselectedBlue = f6;
        iMenuItem.setColor(this.mUnselectedRed, this.mUnselectedGreen, this.mUnselectedBlue);
    }

    @Override
    public void onMenuItemReset(IMenuItem iMenuItem) {
        iMenuItem.setColor(this.mUnselectedRed, this.mUnselectedGreen, this.mUnselectedBlue);
    }

    @Override
    public void onMenuItemSelected(IMenuItem iMenuItem) {
        iMenuItem.setColor(this.mSelectedRed, this.mSelectedGreen, this.mSelectedBlue);
    }

    @Override
    public void onMenuItemUnselected(IMenuItem iMenuItem) {
        iMenuItem.setColor(this.mUnselectedRed, this.mUnselectedGreen, this.mUnselectedBlue);
    }
}

