package org.anddev.andengine.extension.input.touch.controller;

import android.content.*;
import android.content.pm.*;
import java.lang.reflect.*;
import org.anddev.andengine.util.*;

public class MultiTouch
{
    private static Boolean SUPPORTED;
    private static Boolean SUPPORTED_DISTINCT;
    
    static {
        MultiTouch.SUPPORTED = null;
        MultiTouch.SUPPORTED_DISTINCT = null;
    }
    
    private static boolean hasFeature(final Context context, final String s) {
        try {
            final Method method = PackageManager.class.getMethod("hasSystemFeature", String.class);
            return method != null && (boolean)method.invoke(context.getPackageManager(), s);
        }
        catch (Throwable t) {
            return false;
        }
    }
    
    public static boolean isSupported(final Context context) {
        if (MultiTouch.SUPPORTED == null) {
            MultiTouch.SUPPORTED = (SystemUtils.isAndroidVersionOrHigher(7) && hasFeature(context, "android.hardware.touchscreen.multitouch"));
        }
        return MultiTouch.SUPPORTED;
    }
    
    public static boolean isSupportedByAndroidVersion() {
        return SystemUtils.isAndroidVersionOrHigher(5);
    }
    
    public static boolean isSupportedDistinct(final Context context) {
        if (MultiTouch.SUPPORTED_DISTINCT == null) {
            MultiTouch.SUPPORTED_DISTINCT = (SystemUtils.isAndroidVersionOrHigher(7) && hasFeature(context, "android.hardware.touchscreen.multitouch.distinct"));
        }
        return MultiTouch.SUPPORTED_DISTINCT;
    }
}
