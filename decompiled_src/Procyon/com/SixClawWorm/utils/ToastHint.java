package com.SixClawWorm.utils;

import android.content.*;
import android.widget.*;

public class ToastHint
{
    public static void show(final Context context, final int n) {
        Toast.makeText(context, context.getResources().getText(n), 1).show();
    }
    
    public static void show(final Context context, final String s) {
        Toast.makeText(context, (CharSequence)s, 1).show();
    }
    
    public static void showShort(final Context context, final String s) {
        Toast.makeText(context, (CharSequence)s, 0).show();
    }
}
