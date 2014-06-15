/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.opengl.font;

import java.util.ArrayList;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.opengl.font.FontLibrary;

public class FontManager {
    private final ArrayList<Font> mFontsManaged = new ArrayList<Font>();

    public void clear() {
        this.mFontsManaged.clear();
    }

    public void loadFont(Font font) {
        this.mFontsManaged.add(font);
    }

    public void loadFonts(FontLibrary fontLibrary) {
        fontLibrary.loadFonts(this);
    }

    public /* varargs */ void loadFonts(Font ... arrfont) {
        int n = -1 + arrfont.length;
        while (n >= 0) {
            this.loadFont(arrfont[n]);
            --n;
        }
        return;
    }

    public void reloadFonts() {
        ArrayList<Font> arrayList = this.mFontsManaged;
        int n = -1 + arrayList.size();
        while (n >= 0) {
            arrayList.get(n).reload();
            --n;
        }
        return;
    }

    public void updateFonts(GL10 gL10) {
        ArrayList<Font> arrayList = this.mFontsManaged;
        int n = arrayList.size();
        if (n <= 0) return;
        int n2 = n - 1;
        while (n2 >= 0) {
            arrayList.get(n2).update(gL10);
            --n2;
        }
        return;
    }
}

