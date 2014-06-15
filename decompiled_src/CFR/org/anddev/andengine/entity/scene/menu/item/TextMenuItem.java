/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.menu.item;

import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.entity.text.Text;
import org.anddev.andengine.opengl.font.Font;

public class TextMenuItem
extends Text
implements IMenuItem {
    private final int mID;

    public TextMenuItem(int n, Font font, String string) {
        super(0.0f, 0.0f, font, string);
        this.mID = n;
    }

    @Override
    public int getID() {
        return this.mID;
    }

    @Override
    public void onSelected() {
    }

    @Override
    public void onUnselected() {
    }
}

