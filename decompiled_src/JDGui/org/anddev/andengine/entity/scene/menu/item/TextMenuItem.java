package org.anddev.andengine.entity.scene.menu.item;

import org.anddev.andengine.entity.text.Text;
import org.anddev.andengine.opengl.font.Font;

public class TextMenuItem
  extends Text
  implements IMenuItem
{
  private final int mID;
  
  public TextMenuItem(int paramInt, Font paramFont, String paramString)
  {
    super(0.0F, 0.0F, paramFont, paramString);
    this.mID = paramInt;
  }
  
  public int getID()
  {
    return this.mID;
  }
  
  public void onSelected() {}
  
  public void onUnselected() {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.menu.item.TextMenuItem
 * JD-Core Version:    0.7.0.1
 */