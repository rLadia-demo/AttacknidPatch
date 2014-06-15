package org.anddev.andengine.entity.scene.menu.animator;

import java.util.ArrayList;
import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.util.HorizontalAlign;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class BaseMenuAnimator
  implements IMenuAnimator
{
  protected static final float DURATION = 1.0F;
  private static final HorizontalAlign HORIZONTALALIGN_DEFAULT = HorizontalAlign.CENTER;
  private static final float MENUITEMSPACING_DEFAULT = 1.0F;
  protected final IEaseFunction mEaseFunction;
  protected final HorizontalAlign mHorizontalAlign;
  protected final float mMenuItemSpacing;
  
  public BaseMenuAnimator()
  {
    this(1.0F);
  }
  
  public BaseMenuAnimator(float paramFloat)
  {
    this(HORIZONTALALIGN_DEFAULT, paramFloat);
  }
  
  public BaseMenuAnimator(float paramFloat, IEaseFunction paramIEaseFunction)
  {
    this(HORIZONTALALIGN_DEFAULT, paramFloat, paramIEaseFunction);
  }
  
  public BaseMenuAnimator(HorizontalAlign paramHorizontalAlign)
  {
    this(paramHorizontalAlign, 1.0F);
  }
  
  public BaseMenuAnimator(HorizontalAlign paramHorizontalAlign, float paramFloat)
  {
    this(paramHorizontalAlign, paramFloat, IEaseFunction.DEFAULT);
  }
  
  public BaseMenuAnimator(HorizontalAlign paramHorizontalAlign, float paramFloat, IEaseFunction paramIEaseFunction)
  {
    this.mHorizontalAlign = paramHorizontalAlign;
    this.mMenuItemSpacing = paramFloat;
    this.mEaseFunction = paramIEaseFunction;
  }
  
  public BaseMenuAnimator(HorizontalAlign paramHorizontalAlign, IEaseFunction paramIEaseFunction)
  {
    this(paramHorizontalAlign, 1.0F, paramIEaseFunction);
  }
  
  public BaseMenuAnimator(IEaseFunction paramIEaseFunction)
  {
    this(1.0F, paramIEaseFunction);
  }
  
  protected float getMaximumWidth(ArrayList<IMenuItem> paramArrayList)
  {
    float f = 1.4E-45F;
    for (int i = -1 + paramArrayList.size();; i--)
    {
      if (i < 0) {
        return f;
      }
      f = Math.max(f, ((IMenuItem)paramArrayList.get(i)).getWidthScaled());
    }
  }
  
  protected float getOverallHeight(ArrayList<IMenuItem> paramArrayList)
  {
    float f = 0.0F;
    for (int i = -1 + paramArrayList.size();; i--)
    {
      if (i < 0) {
        return f + (-1 + paramArrayList.size()) * this.mMenuItemSpacing;
      }
      f += ((IMenuItem)paramArrayList.get(i)).getHeight();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.menu.animator.BaseMenuAnimator
 * JD-Core Version:    0.7.0.1
 */