package org.anddev.andengine.entity.scene.menu.animator;

import java.util.ArrayList;
import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.entity.shape.modifier.MoveModifier;
import org.anddev.andengine.util.HorizontalAlign;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class SlideMenuAnimator
  extends BaseMenuAnimator
{
  public SlideMenuAnimator() {}
  
  public SlideMenuAnimator(float paramFloat)
  {
    super(paramFloat);
  }
  
  public SlideMenuAnimator(float paramFloat, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat, paramIEaseFunction);
  }
  
  public SlideMenuAnimator(HorizontalAlign paramHorizontalAlign)
  {
    super(paramHorizontalAlign);
  }
  
  public SlideMenuAnimator(HorizontalAlign paramHorizontalAlign, float paramFloat)
  {
    super(paramHorizontalAlign, paramFloat);
  }
  
  public SlideMenuAnimator(HorizontalAlign paramHorizontalAlign, float paramFloat, IEaseFunction paramIEaseFunction)
  {
    super(paramHorizontalAlign, paramFloat, paramIEaseFunction);
  }
  
  public SlideMenuAnimator(HorizontalAlign paramHorizontalAlign, IEaseFunction paramIEaseFunction)
  {
    super(paramHorizontalAlign, paramIEaseFunction);
  }
  
  public SlideMenuAnimator(IEaseFunction paramIEaseFunction)
  {
    super(paramIEaseFunction);
  }
  
  public void buildAnimations(ArrayList<IMenuItem> paramArrayList, float paramFloat1, float paramFloat2)
  {
    IEaseFunction localIEaseFunction = this.mEaseFunction;
    float f1 = getMaximumWidth(paramArrayList);
    float f2 = getOverallHeight(paramArrayList);
    float f3 = 0.5F * (paramFloat1 - f1);
    float f4 = 0.5F * (paramFloat2 - f2);
    float f5 = 0.0F;
    int i = paramArrayList.size();
    int j = 0;
    if (j >= i) {
      return;
    }
    IMenuItem localIMenuItem = (IMenuItem)paramArrayList.get(j);
    float f6;
    switch (this.mHorizontalAlign)
    {
    case LEFT: 
    default: 
      f6 = 0.5F * (f1 - localIMenuItem.getWidthScaled());
    }
    for (;;)
    {
      MoveModifier localMoveModifier = new MoveModifier(1.0F, -f1, f3 + f6, f4 + f5, f4 + f5, localIEaseFunction);
      localMoveModifier.setRemoveWhenFinished(false);
      localIMenuItem.addShapeModifier(localMoveModifier);
      f5 += localIMenuItem.getHeight() + this.mMenuItemSpacing;
      j++;
      break;
      f6 = 0.0F;
      continue;
      f6 = f1 - localIMenuItem.getWidthScaled();
    }
  }
  
  public void prepareAnimations(ArrayList<IMenuItem> paramArrayList, float paramFloat1, float paramFloat2)
  {
    float f1 = getMaximumWidth(paramArrayList);
    float f2 = 0.5F * (paramFloat2 - getOverallHeight(paramArrayList));
    float f3 = this.mMenuItemSpacing;
    float f4 = 0.0F;
    int i = paramArrayList.size();
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return;
      }
      IMenuItem localIMenuItem = (IMenuItem)paramArrayList.get(j);
      localIMenuItem.setPosition(-f1, f2 + f4);
      f4 += f3 + localIMenuItem.getHeight();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.menu.animator.SlideMenuAnimator
 * JD-Core Version:    0.7.0.1
 */