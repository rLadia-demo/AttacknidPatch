package org.anddev.andengine.opengl.font;

import android.util.SparseArray;
import org.anddev.andengine.util.Library;

public class FontLibrary
  extends Library<Font>
{
  public FontLibrary() {}
  
  public FontLibrary(int paramInt)
  {
    super(paramInt);
  }
  
  void loadFonts(FontManager paramFontManager)
  {
    SparseArray localSparseArray = this.mItems;
    for (int i = -1 + localSparseArray.size();; i--)
    {
      if (i < 0) {
        return;
      }
      paramFontManager.loadFont((Font)localSparseArray.get(i));
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.font.FontLibrary
 * JD-Core Version:    0.7.0.1
 */