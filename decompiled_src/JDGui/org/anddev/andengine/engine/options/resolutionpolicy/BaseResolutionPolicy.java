package org.anddev.andengine.engine.options.resolutionpolicy;

import android.view.View.MeasureSpec;

public abstract class BaseResolutionPolicy
  implements IResolutionPolicy
{
  protected static void throwOnNotMeasureSpecEXACTLY(int paramInt1, int paramInt2)
  {
    int i = View.MeasureSpec.getMode(paramInt1);
    int j = View.MeasureSpec.getMode(paramInt2);
    if ((i != 1073741824) || (j != 1073741824)) {
      throw new IllegalStateException("This IResolutionPolicy requires MeasureSpec.EXACTLY ! That means ");
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.options.resolutionpolicy.BaseResolutionPolicy
 * JD-Core Version:    0.7.0.1
 */