package com.SixClawWorm.utils;

import android.app.*;
import android.content.*;

public class ProgressDialogHint
{
    private static ProgressDialog mProgressDialog;
    
    static {
        ProgressDialogHint.mProgressDialog = null;
    }
    
    public static void Dismiss() {
        if (ProgressDialogHint.mProgressDialog != null) {
            ProgressDialogHint.mProgressDialog.hide();
            ProgressDialogHint.mProgressDialog = null;
        }
    }
    
    public static void Show(final Context context, final String title, final String message) {
        final ProgressDialog mProgressDialog = new ProgressDialog(context);
        mProgressDialog.setTitle((CharSequence)title);
        mProgressDialog.setMessage((CharSequence)message);
        mProgressDialog.setIndeterminate(true);
        mProgressDialog.setCancelable(true);
        if (mProgressDialog != null) {
            mProgressDialog.show();
        }
        ProgressDialogHint.mProgressDialog = mProgressDialog;
    }
}
