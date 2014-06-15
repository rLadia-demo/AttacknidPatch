/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.Activity
 *  android.util.DisplayMetrics
 *  android.view.Display
 *  android.view.WindowManager
 */
package org.anddev.andengine.engine.camera;

import android.app.Activity;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import org.anddev.andengine.engine.camera.Camera;

public class CameraFactory {
    public static Camera createPixelPerfectCamera(Activity activity, float f, float f2) {
        DisplayMetrics displayMetrics = CameraFactory.getDisplayMetrics(activity);
        float f3 = displayMetrics.widthPixels;
        float f4 = displayMetrics.heightPixels;
        return new Camera(f - f3 * 0.5f, f2 - 0.5f * f4, f3, f4);
    }

    private static DisplayMetrics getDisplayMetrics(Activity activity) {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        activity.getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        return displayMetrics;
    }
}

