/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.DialogInterface
 *  android.content.DialogInterface$OnCancelListener
 */
package org.anddev.andengine.ui.dialog;

import android.content.Context;
import android.content.DialogInterface;
import org.anddev.andengine.ui.dialog.GenericInputDialogBuilder;
import org.anddev.andengine.util.Callback;

public class StringInputDialogBuilder
extends GenericInputDialogBuilder<String> {
    public StringInputDialogBuilder(Context context, int n, int n2, int n3, int n4, String string, Callback<String> callback, DialogInterface.OnCancelListener onCancelListener) {
        super(context, n, n2, n3, n4, string, callback, onCancelListener);
    }

    public StringInputDialogBuilder(Context context, int n, int n2, int n3, int n4, Callback<String> callback, DialogInterface.OnCancelListener onCancelListener) {
        super(context, n, n2, n3, n4, callback, onCancelListener);
    }

    @Override
    protected String generateResult(String string) {
        return string;
    }
}

