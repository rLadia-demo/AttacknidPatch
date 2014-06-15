package org.anddev.andengine.entity.scene.menu.item.decorator;

import org.anddev.andengine.entity.scene.menu.item.IMenuItem;

public class ColorMenuItemDecorator
  extends BaseMenuItemDecorator
{
  private final float mSelectedBlue;
  private final float mSelectedGreen;
  private final float mSelectedRed;
  private final float mUnselectedBlue;
  private final float mUnselectedGreen;
  private final float mUnselectedRed;
  
  public ColorMenuItemDecorator(IMenuItem paramIMenuItem, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    super(paramIMenuItem);
    this.mSelectedRed = paramFloat1;
    this.mSelectedGreen = paramFloat2;
    this.mSelectedBlue = paramFloat3;
    this.mUnselectedRed = paramFloat4;
    this.mUnselectedGreen = paramFloat5;
    this.mUnselectedBlue = paramFloat6;
    paramIMenuItem.setColor(this.mUnselectedRed, this.mUnselectedGreen, this.mUnselectedBlue);
  }
  
  public void onMenuItemReset(IMenuItem paramIMenuItem)
  {
    paramIMenuItem.setColor(this.mUnselectedRed, this.mUnselectedGreen, this.mUnselectedBlue);
  }
  
  public void onMenuItemSelected(IMenuItem paramIMenuItem)
  {
    paramIMenuItem.setColor(this.mSelectedRed, this.mSelectedGreen, this.mSelectedBlue);
  }
  
  public void onMenuItemUnselected(IMenuItem paramIMenuItem)
  {
    paramIMenuItem.setColor(this.mUnselectedRed, this.mUnselectedGreen, this.mUnselectedBlue);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.menu.item.decorator.ColorMenuItemDecorator
 * JD-Core Version:    0.7.0.1
 */