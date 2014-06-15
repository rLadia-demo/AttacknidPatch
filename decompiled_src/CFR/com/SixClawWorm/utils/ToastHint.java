/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.res.Resources
 *  android.widget.Toast
 */
package com.SixClawWorm.utils;

import android.content.Context;
import android.content.res.Resources;
import android.widget.Toast;

public class ToastHint {
    public static void show(Context context, int n) {
        Toast.makeText((Context)context, (CharSequence)context.getResources().getText(n), (int)1).show();
    }

    public static void show(Context context, String string) {
        Toast.makeText((Context)context, (CharSequence)string, (int)1).show();
    }

    public static void showShort(Context context, String string) {
        Toast.makeText((Context)context, (CharSequence)string, (int)0).show();
    }
}

