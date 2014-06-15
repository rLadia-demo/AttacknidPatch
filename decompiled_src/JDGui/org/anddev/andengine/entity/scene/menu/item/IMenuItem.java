package org.anddev.andengine.entity.scene.menu.item;

import org.anddev.andengine.entity.shape.IShape;

public abstract interface IMenuItem
  extends IShape
{
  public abstract int getID();
  
  public abstract void onSelected();
  
  public abstract void onUnselected();
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.menu.item.IMenuItem
 * JD-Core Version:    0.7.0.1
 */