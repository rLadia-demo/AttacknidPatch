package org.anddev.andengine.engine.camera;

import android.app.*;
import android.util.*;

public class CameraFactory
{
    public static Camera createPixelPerfectCamera(final Activity activity, final float n, final float n2) {
        final DisplayMetrics displayMetrics = getDisplayMetrics(activity);
        final float n3 = displayMetrics.widthPixels;
        final float n4 = displayMetrics.heightPixels;
        return new Camera(n - n3 * 0.5f, n2 - 0.5f * n4, n3, n4);
    }
    
    private static DisplayMetrics getDisplayMetrics(final Activity activity) {
        final DisplayMetrics displayMetrics = new DisplayMetrics();
        activity.getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        return displayMetrics;
    }
}
