package org.anddev.andengine.ui.dialog;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.text.Editable;
import android.widget.EditText;
import android.widget.Toast;
import org.anddev.andengine.util.Callback;
import org.anddev.andengine.util.Debug;

public abstract class GenericInputDialogBuilder<T>
{
  protected final Context mContext;
  private final String mDefaultText;
  private final int mErrorResID;
  protected final int mIconResID;
  protected final int mMessageResID;
  protected final DialogInterface.OnCancelListener mOnCancelListener;
  protected final Callback<T> mSuccessCallback;
  protected final int mTitleResID;
  
  public GenericInputDialogBuilder(Context paramContext, int paramInt1, int paramInt2, int paramInt3, int paramInt4, String paramString, Callback<T> paramCallback, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    this.mContext = paramContext;
    this.mTitleResID = paramInt1;
    this.mMessageResID = paramInt2;
    this.mErrorResID = paramInt3;
    this.mIconResID = paramInt4;
    this.mDefaultText = paramString;
    this.mSuccessCallback = paramCallback;
    this.mOnCancelListener = paramOnCancelListener;
  }
  
  public GenericInputDialogBuilder(Context paramContext, int paramInt1, int paramInt2, int paramInt3, int paramInt4, Callback<T> paramCallback, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    this(paramContext, paramInt1, paramInt2, paramInt3, paramInt4, "", paramCallback, paramOnCancelListener);
  }
  
  public Dialog create()
  {
    final EditText localEditText = new EditText(this.mContext);
    localEditText.setText(this.mDefaultText);
    AlertDialog.Builder localBuilder = new AlertDialog.Builder(this.mContext);
    if (this.mTitleResID != 0) {
      localBuilder.setTitle(this.mTitleResID);
    }
    if (this.mMessageResID != 0) {
      localBuilder.setMessage(this.mMessageResID);
    }
    if (this.mIconResID != 0) {
      localBuilder.setIcon(this.mIconResID);
    }
    setView(localBuilder, localEditText);
    localBuilder.setOnCancelListener(this.mOnCancelListener).setPositiveButton(17039370, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        try
        {
          Object localObject = GenericInputDialogBuilder.this.generateResult(localEditText.getText().toString());
          GenericInputDialogBuilder.this.mSuccessCallback.onCallback(localObject);
          paramAnonymousDialogInterface.dismiss();
          return;
        }
        catch (IllegalArgumentException localIllegalArgumentException)
        {
          Debug.e("Error in GenericInputDialogBuilder.generateResult()", localIllegalArgumentException);
          Toast.makeText(GenericInputDialogBuilder.this.mContext, GenericInputDialogBuilder.this.mErrorResID, 0).show();
        }
      }
    }).setNegativeButton(17039360, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        GenericInputDialogBuilder.this.mOnCancelListener.onCancel(paramAnonymousDialogInterface);
        paramAnonymousDialogInterface.dismiss();
      }
    });
    return localBuilder.create();
  }
  
  protected abstract T generateResult(String paramString);
  
  protected void setView(AlertDialog.Builder paramBuilder, EditText paramEditText)
  {
    paramBuilder.setView(paramEditText);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.ui.dialog.GenericInputDialogBuilder
 * JD-Core Version:    0.7.0.1
 */