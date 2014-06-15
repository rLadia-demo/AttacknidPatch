package org.anddev.andengine.util;

import org.anddev.andengine.util.constants.*;
import android.content.*;

public class SimplePreferences implements Constants
{
    private static SharedPreferences$Editor EDITORINSTANCE;
    private static SharedPreferences INSTANCE;
    private static final String PREFERENCES_NAME;
    
    static {
        PREFERENCES_NAME = null;
    }
    
    public static int getAccessCount(final Context context, final String s) {
        return getInstance(context).getInt(s, 0);
    }
    
    public static SharedPreferences$Editor getEditorInstance(final Context context) {
        if (SimplePreferences.EDITORINSTANCE == null) {
            SimplePreferences.EDITORINSTANCE = getInstance(context).edit();
        }
        return SimplePreferences.EDITORINSTANCE;
    }
    
    public static SharedPreferences getInstance(final Context context) {
        if (SimplePreferences.INSTANCE == null) {
            SimplePreferences.INSTANCE = context.getSharedPreferences(SimplePreferences.PREFERENCES_NAME, 0);
        }
        return SimplePreferences.INSTANCE;
    }
    
    public static int incrementAccessCount(final Context context, final String s) {
        return incrementAccessCount(context, s, 1);
    }
    
    public static int incrementAccessCount(final Context context, final String s, final int n) {
        final SharedPreferences instance = getInstance(context);
        final int n2 = n + instance.getInt(s, 0);
        instance.edit().putInt(s, n2).commit();
        return n2;
    }
}
