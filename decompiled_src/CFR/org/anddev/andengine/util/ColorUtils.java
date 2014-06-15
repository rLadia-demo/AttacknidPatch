/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Color
 */
package org.anddev.andengine.util;

import android.graphics.Color;

public class ColorUtils {
    private static final int COLOR_FLOAT_TO_INT_FACTOR = 255;
    private static final float[] HSV_TO_COLOR = new float[3];
    private static final int HSV_TO_COLOR_HUE_INDEX = 0;
    private static final int HSV_TO_COLOR_SATURATION_INDEX = 1;
    private static final int HSV_TO_COLOR_VALUE_INDEX = 2;

    public static int HSVToColor(float f, float f2, float f3) {
        ColorUtils.HSV_TO_COLOR[0] = f;
        ColorUtils.HSV_TO_COLOR[1] = f2;
        ColorUtils.HSV_TO_COLOR[2] = f3;
        return Color.HSVToColor((float[])ColorUtils.HSV_TO_COLOR);
    }

    public static int RGBToColor(float f, float f2, float f3) {
        return Color.rgb((int)((int)(f * 255.0f)), (int)((int)(f2 * 255.0f)), (int)((int)(255.0f * f3)));
    }
}

