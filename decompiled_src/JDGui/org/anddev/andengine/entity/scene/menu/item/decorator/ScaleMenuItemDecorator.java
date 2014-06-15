package org.anddev.andengine.entity.scene.menu.item.decorator;

import org.anddev.andengine.entity.scene.menu.item.IMenuItem;

public class ScaleMenuItemDecorator
  extends BaseMenuItemDecorator
{
  private final float mSelectedScale;
  private final float mUnselectedScale;
  
  public ScaleMenuItemDecorator(IMenuItem paramIMenuItem, float paramFloat1, float paramFloat2)
  {
    super(paramIMenuItem);
    this.mSelectedScale = paramFloat1;
    this.mUnselectedScale = paramFloat2;
    paramIMenuItem.setScale(paramFloat2);
  }
  
  public void onMenuItemReset(IMenuItem paramIMenuItem)
  {
    setScale(this.mUnselectedScale);
  }
  
  public void onMenuItemSelected(IMenuItem paramIMenuItem)
  {
    setScale(this.mSelectedScale);
  }
  
  public void onMenuItemUnselected(IMenuItem paramIMenuItem)
  {
    setScale(this.mUnselectedScale);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.menu.item.decorator.ScaleMenuItemDecorator
 * JD-Core Version:    0.7.0.1
 */