package org.anddev.andengine.entity.scene.menu.item;

import org.anddev.andengine.entity.sprite.Sprite;
import org.anddev.andengine.opengl.texture.region.TextureRegion;

public class SpriteMenuItem
  extends Sprite
  implements IMenuItem
{
  private final int mID;
  
  public SpriteMenuItem(int paramInt, TextureRegion paramTextureRegion)
  {
    super(0.0F, 0.0F, paramTextureRegion);
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
 * Qualified Name:     org.anddev.andengine.entity.scene.menu.item.SpriteMenuItem
 * JD-Core Version:    0.7.0.1
 */