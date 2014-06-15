/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.AlertDialog
 *  android.app.AlertDialog$Builder
 *  android.app.Dialog
 *  android.content.Context
 *  android.content.DialogInterface
 *  android.content.DialogInterface$OnCancelListener
 *  android.content.DialogInterface$OnClickListener
 *  android.text.Editable
 *  android.view.View
 *  android.widget.EditText
 *  android.widget.Toast
 */
package org.anddev.andengine.ui.dialog;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.text.Editable;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;
import org.anddev.andengine.util.Callback;
import org.anddev.andengine.util.Debug;

public abstract class GenericInputDialogBuilder<T> {
    protected final Context mContext;
    private final String mDefaultText;
    private final int mErrorResID;
    protected final int mIconResID;
    protected final int mMessageResID;
    protected final DialogInterface.OnCancelListener mOnCancelListener;
    protected final Callback<T> mSuccessCallback;
    protected final int mTitleResID;

    public GenericInputDialogBuilder(Context context, int n, int n2, int n3, int n4, String string, Callback<T> callback, DialogInterface.OnCancelListener onCancelListener) {
        this.mContext = context;
        this.mTitleResID = n;
        this.mMessageResID = n2;
        this.mErrorResID = n3;
        this.mIconResID = n4;
        this.mDefaultText = string;
        this.mSuccessCallback = callback;
        this.mOnCancelListener = onCancelListener;
    }

    public GenericInputDialogBuilder(Context context, int n, int n2, int n3, int n4, Callback<T> callback, DialogInterface.OnCancelListener onCancelListener) {
        this(context, n, n2, n3, n4, "", callback, onCancelListener);
    }

    public Dialog create() {
        EditText editText = new EditText(this.mContext);
        editText.setText((CharSequence)this.mDefaultText);
        AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
        if (this.mTitleResID != 0) {
            builder.setTitle(this.mTitleResID);
        }
        if (this.mMessageResID != 0) {
            builder.setMessage(this.mMessageResID);
        }
        if (this.mIconResID != 0) {
            builder.setIcon(this.mIconResID);
        }
        this.setView(builder, editText);
        builder.setOnCancelListener(this.mOnCancelListener).setPositiveButton(17039370, (DialogInterface.OnClickListener)new DialogInterface.OnClickListener(){

            public void onClick(DialogInterface dialogInterface, int n) {
                Object T;
                try {
                    T = GenericInputDialogBuilder.this.generateResult(editText.getText().toString());
                }
                catch (IllegalArgumentException var3_3) {
                    Debug.e("Error in GenericInputDialogBuilder.generateResult()", var3_3);
                    Toast.makeText((Context)GenericInputDialogBuilder.this.mContext, (int)GenericInputDialogBuilder.this.mErrorResID, (int)0).show();
                    return;
                }
                GenericInputDialogBuilder.this.mSuccessCallback.onCallback(T);
                dialogInterface.dismiss();
                return;
            }
        }).setNegativeButton(17039360, (DialogInterface.OnClickListener)new DialogInterface.OnClickListener(){

            public void onClick(DialogInterface dialogInterface, int n) {
                GenericInputDialogBuilder.this.mOnCancelListener.onCancel(dialogInterface);
                dialogInterface.dismiss();
            }
        });
        return builder.create();
    }

    protected abstract T generateResult(String var1);

    protected void setView(AlertDialog.Builder builder, EditText editText) {
        builder.setView((View)editText);
    }

}

