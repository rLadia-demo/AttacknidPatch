package org.anddev.andengine.ui.dialog;

import android.app.*;
import android.content.*;
import org.anddev.andengine.util.*;
import android.widget.*;
import android.view.*;

public abstract class GenericInputDialogBuilder<T>
{
    protected final Context mContext;
    private final String mDefaultText;
    private final int mErrorResID;
    protected final int mIconResID;
    protected final int mMessageResID;
    protected final DialogInterface$OnCancelListener mOnCancelListener;
    protected final Callback<T> mSuccessCallback;
    protected final int mTitleResID;
    
    public GenericInputDialogBuilder(final Context mContext, final int mTitleResID, final int mMessageResID, final int mErrorResID, final int mIconResID, final String mDefaultText, final Callback<T> mSuccessCallback, final DialogInterface$OnCancelListener mOnCancelListener) {
        super();
        this.mContext = mContext;
        this.mTitleResID = mTitleResID;
        this.mMessageResID = mMessageResID;
        this.mErrorResID = mErrorResID;
        this.mIconResID = mIconResID;
        this.mDefaultText = mDefaultText;
        this.mSuccessCallback = mSuccessCallback;
        this.mOnCancelListener = mOnCancelListener;
    }
    
    public GenericInputDialogBuilder(final Context context, final int n, final int n2, final int n3, final int n4, final Callback<T> callback, final DialogInterface$OnCancelListener dialogInterface$OnCancelListener) {
        this(context, n, n2, n3, n4, "", callback, dialogInterface$OnCancelListener);
    }
    
    public Dialog create() {
        final EditText editText = new EditText(this.mContext);
        editText.setText((CharSequence)this.mDefaultText);
        final AlertDialog$Builder alertDialog$Builder = new AlertDialog$Builder(this.mContext);
        if (this.mTitleResID != 0) {
            alertDialog$Builder.setTitle(this.mTitleResID);
        }
        if (this.mMessageResID != 0) {
            alertDialog$Builder.setMessage(this.mMessageResID);
        }
        if (this.mIconResID != 0) {
            alertDialog$Builder.setIcon(this.mIconResID);
        }
        this.setView(alertDialog$Builder, editText);
        alertDialog$Builder.setOnCancelListener(this.mOnCancelListener).setPositiveButton(17039370, (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
            public void onClick(final DialogInterface dialogInterface, final int n) {
                try {
                    GenericInputDialogBuilder.this.mSuccessCallback.onCallback(GenericInputDialogBuilder.this.generateResult(editText.getText().toString()));
                    dialogInterface.dismiss();
                }
                catch (IllegalArgumentException ex) {
                    Debug.e("Error in GenericInputDialogBuilder.generateResult()", ex);
                    Toast.makeText(GenericInputDialogBuilder.this.mContext, GenericInputDialogBuilder.this.mErrorResID, 0).show();
                }
            }
        }).setNegativeButton(17039360, (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
            public void onClick(final DialogInterface dialogInterface, final int n) {
                GenericInputDialogBuilder.this.mOnCancelListener.onCancel(dialogInterface);
                dialogInterface.dismiss();
            }
        });
        return (Dialog)alertDialog$Builder.create();
    }
    
    protected abstract T generateResult(final String p0);
    
    protected void setView(final AlertDialog$Builder alertDialog$Builder, final EditText view) {
        alertDialog$Builder.setView((View)view);
    }
}
