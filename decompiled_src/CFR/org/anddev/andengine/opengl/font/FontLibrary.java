/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.SparseArray
 */
package org.anddev.andengine.opengl.font;

import android.util.SparseArray;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.opengl.font.FontManager;
import org.anddev.andengine.util.Library;

public class FontLibrary
extends Library<Font> {
    public FontLibrary() {
    }

    public FontLibrary(int n) {
        super(n);
    }

    void loadFonts(FontManager fontManager) {
        SparseArray sparseArray = this.mItems;
        int n = -1 + sparseArray.size();
        while (n >= 0) {
            fontManager.loadFont((Font)sparseArray.get(n));
            --n;
        }
        return;
    }
}

