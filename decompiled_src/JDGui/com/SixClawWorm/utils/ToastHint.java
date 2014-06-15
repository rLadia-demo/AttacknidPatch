package com.SixClawWorm.utils;

import android.content.Context;
import android.content.res.Resources;
import android.widget.Toast;

public class ToastHint
{
  public static void show(Context paramContext, int paramInt)
  {
    Toast.makeText(paramContext, paramContext.getResources().getText(paramInt), 1).show();
  }
  
  public static void show(Context paramContext, String paramString)
  {
    Toast.makeText(paramContext, paramString, 1).show();
  }
  
  public static void showShort(Context paramContext, String paramString)
  {
    Toast.makeText(paramContext, paramString, 0).show();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.SixClawWorm.utils.ToastHint
 * JD-Core Version:    0.7.0.1
 */