package org.anddev.andengine.util;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;

public class ViewUtils
{
  public static View inflate(Context paramContext, int paramInt)
  {
    return LayoutInflater.from(paramContext).inflate(paramInt, null);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.ViewUtils
 * JD-Core Version:    0.7.0.1
 */