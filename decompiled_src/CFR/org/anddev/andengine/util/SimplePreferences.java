/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.SharedPreferences
 *  android.content.SharedPreferences$Editor
 */
package org.anddev.andengine.util;

import android.content.Context;
import android.content.SharedPreferences;
import org.anddev.andengine.util.constants.Constants;

public class SimplePreferences
implements Constants {
    private static SharedPreferences.Editor EDITORINSTANCE;
    private static SharedPreferences INSTANCE;
    private static final String PREFERENCES_NAME;

    static {
        SimplePreferences.PREFERENCES_NAME = null;
    }

    public static int getAccessCount(Context context, String string) {
        return SimplePreferences.getInstance(context).getInt(string, 0);
    }

    public static SharedPreferences.Editor getEditorInstance(Context context) {
        if (SimplePreferences.EDITORINSTANCE != null) return SimplePreferences.EDITORINSTANCE;
        SimplePreferences.EDITORINSTANCE = SimplePreferences.getInstance(context).edit();
        return SimplePreferences.EDITORINSTANCE;
    }

    public static SharedPreferences getInstance(Context context) {
        if (SimplePreferences.INSTANCE != null) return SimplePreferences.INSTANCE;
        SimplePreferences.INSTANCE = context.getSharedPreferences(SimplePreferences.PREFERENCES_NAME, 0);
        return SimplePreferences.INSTANCE;
    }

    public static int incrementAccessCount(Context context, String string) {
        return SimplePreferences.incrementAccessCount(context, string, 1);
    }

    public static int incrementAccessCount(Context context, String string, int n) {
        SharedPreferences sharedPreferences = SimplePreferences.getInstance(context);
        int n2 = n + sharedPreferences.getInt(string, 0);
        sharedPreferences.edit().putInt(string, n2).commit();
        return n2;
    }
}

