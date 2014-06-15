package org.anddev.andengine.opengl.font;

import java.util.*;
import javax.microedition.khronos.opengles.*;

public class FontManager
{
    private final ArrayList<Font> mFontsManaged;
    
    public FontManager() {
        super();
        this.mFontsManaged = new ArrayList<Font>();
    }
    
    public void clear() {
        this.mFontsManaged.clear();
    }
    
    public void loadFont(final Font font) {
        this.mFontsManaged.add(font);
    }
    
    public void loadFonts(final FontLibrary fontLibrary) {
        fontLibrary.loadFonts(this);
    }
    
    public void loadFonts(final Font... array) {
        for (int i = -1 + array.length; i >= 0; --i) {
            this.loadFont(array[i]);
        }
    }
    
    public void reloadFonts() {
        final ArrayList<Font> mFontsManaged = this.mFontsManaged;
        for (int i = -1 + mFontsManaged.size(); i >= 0; --i) {
            mFontsManaged.get(i).reload();
        }
    }
    
    public void updateFonts(final GL10 gl10) {
        final ArrayList<Font> mFontsManaged = this.mFontsManaged;
        final int size = mFontsManaged.size();
        if (size > 0) {
            for (int i = size - 1; i >= 0; --i) {
                mFontsManaged.get(i).update(gl10);
            }
        }
    }
}
