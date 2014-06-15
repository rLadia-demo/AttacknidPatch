package org.anddev.andengine.ui.dialog;

import android.content.Context;
import android.content.DialogInterface.OnCancelListener;
import org.anddev.andengine.util.Callback;

public class StringInputDialogBuilder
  extends GenericInputDialogBuilder<String>
{
  public StringInputDialogBuilder(Context paramContext, int paramInt1, int paramInt2, int paramInt3, int paramInt4, String paramString, Callback<String> paramCallback, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    super(paramContext, paramInt1, paramInt2, paramInt3, paramInt4, paramString, paramCallback, paramOnCancelListener);
  }
  
  public StringInputDialogBuilder(Context paramContext, int paramInt1, int paramInt2, int paramInt3, int paramInt4, Callback<String> paramCallback, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    super(paramContext, paramInt1, paramInt2, paramInt3, paramInt4, paramCallback, paramOnCancelListener);
  }
  
  protected String generateResult(String paramString)
  {
    return paramString;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.ui.dialog.StringInputDialogBuilder
 * JD-Core Version:    0.7.0.1
 */