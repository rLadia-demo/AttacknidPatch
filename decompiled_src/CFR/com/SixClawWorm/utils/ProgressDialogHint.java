/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.ProgressDialog
 *  android.content.Context
 */
package com.SixClawWorm.utils;

import android.app.ProgressDialog;
import android.content.Context;

public class ProgressDialogHint {
    private static ProgressDialog mProgressDialog = null;

    public static void Dismiss() {
        if (ProgressDialogHint.mProgressDialog == null) return;
        ProgressDialogHint.mProgressDialog.hide();
        ProgressDialogHint.mProgressDialog = null;
    }

    public static void Show(Context context, String string, String string2) {
        ProgressDialog progressDialog = new ProgressDialog(context);
        progressDialog.setTitle((CharSequence)string);
        progressDialog.setMessage((CharSequence)string2);
        progressDialog.setIndeterminate(true);
        progressDialog.setCancelable(true);
        if (progressDialog != null) {
            progressDialog.show();
        }
        ProgressDialogHint.mProgressDialog = progressDialog;
    }
}

