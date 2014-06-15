package org.anddev.andengine.opengl.font;

import org.anddev.andengine.util.*;
import android.util.*;

public class FontLibrary extends Library<Font>
{
    public FontLibrary() {
        super();
    }
    
    public FontLibrary(final int n) {
        super(n);
    }
    
    void loadFonts(final FontManager fontManager) {
        final SparseArray<T> mItems = this.mItems;
        for (int i = -1 + mItems.size(); i >= 0; --i) {
            fontManager.loadFont((Font)mItems.get(i));
        }
    }
}
