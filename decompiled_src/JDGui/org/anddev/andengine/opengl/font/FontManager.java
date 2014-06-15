package org.anddev.andengine.opengl.font;

import java.util.ArrayList;
import javax.microedition.khronos.opengles.GL10;

public class FontManager
{
  private final ArrayList<Font> mFontsManaged = new ArrayList();
  
  public void clear()
  {
    this.mFontsManaged.clear();
  }
  
  public void loadFont(Font paramFont)
  {
    this.mFontsManaged.add(paramFont);
  }
  
  public void loadFonts(FontLibrary paramFontLibrary)
  {
    paramFontLibrary.loadFonts(this);
  }
  
  public void loadFonts(Font... paramVarArgs)
  {
    for (int i = -1 + paramVarArgs.length;; i--)
    {
      if (i < 0) {
        return;
      }
      loadFont(paramVarArgs[i]);
    }
  }
  
  public void reloadFonts()
  {
    ArrayList localArrayList = this.mFontsManaged;
    for (int i = -1 + localArrayList.size();; i--)
    {
      if (i < 0) {
        return;
      }
      ((Font)localArrayList.get(i)).reload();
    }
  }
  
  public void updateFonts(GL10 paramGL10)
  {
    ArrayList localArrayList = this.mFontsManaged;
    int i = localArrayList.size();
    if (i > 0) {}
    for (int j = i - 1;; j--)
    {
      if (j < 0) {
        return;
      }
      ((Font)localArrayList.get(j)).update(paramGL10);
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.font.FontManager
 * JD-Core Version:    0.7.0.1
 */