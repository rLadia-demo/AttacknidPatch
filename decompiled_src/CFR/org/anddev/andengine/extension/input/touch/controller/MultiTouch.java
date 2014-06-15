/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.pm.PackageManager
 */
package org.anddev.andengine.extension.input.touch.controller;

import android.content.Context;
import android.content.pm.PackageManager;
import org.anddev.andengine.util.SystemUtils;

public class MultiTouch {
    private static Boolean SUPPORTED = null;
    private static Boolean SUPPORTED_DISTINCT = null;

    private static boolean hasFeature(Context context, String string) {
        Method method;
        block3 : {
            method = PackageManager.class.getMethod("hasSystemFeature", String.class);
            if (method != null) break block3;
            return false;
        }
        try {
            boolean bl = (Boolean)method.invoke((Object)context.getPackageManager(), string);
            return bl;
        }
        catch (Throwable var2_4) {
            return false;
        }
    }

    /*
     * Enabled aggressive block sorting
     */
    public static boolean isSupported(Context context) {
        if (MultiTouch.SUPPORTED != null) return MultiTouch.SUPPORTED;
        boolean bl = SystemUtils.isAndroidVersionOrHigher(7) && MultiTouch.hasFeature(context, "android.hardware.touchscreen.multitouch");
        MultiTouch.SUPPORTED = bl;
        return MultiTouch.SUPPORTED;
    }

    public static boolean isSupportedByAndroidVersion() {
        return SystemUtils.isAndroidVersionOrHigher(5);
    }

    /*
     * Enabled aggressive block sorting
     */
    public static boolean isSupportedDistinct(Context context) {
        if (MultiTouch.SUPPORTED_DISTINCT != null) return MultiTouch.SUPPORTED_DISTINCT;
        boolean bl = SystemUtils.isAndroidVersionOrHigher(7) && MultiTouch.hasFeature(context, "android.hardware.touchscreen.multitouch.distinct");
        MultiTouch.SUPPORTED_DISTINCT = bl;
        return MultiTouch.SUPPORTED_DISTINCT;
    }
}

