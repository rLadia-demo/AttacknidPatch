package com.SixClawWorm.utils;

import android.app.ProgressDialog;
import android.content.Context;

public class ProgressDialogHint
{
  private static ProgressDialog mProgressDialog = null;
  
  public static void Dismiss()
  {
    if (mProgressDialog != null)
    {
      mProgressDialog.hide();
      mProgressDialog = null;
    }
  }
  
  public static void Show(Context paramContext, String paramString1, String paramString2)
  {
    ProgressDialog localProgressDialog = new ProgressDialog(paramContext);
    localProgressDialog.setTitle(paramString1);
    localProgressDialog.setMessage(paramString2);
    localProgressDialog.setIndeterminate(true);
    localProgressDialog.setCancelable(true);
    if (localProgressDialog != null) {
      localProgressDialog.show();
    }
    mProgressDialog = localProgressDialog;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.SixClawWorm.utils.ProgressDialogHint
 * JD-Core Version:    0.7.0.1
 */