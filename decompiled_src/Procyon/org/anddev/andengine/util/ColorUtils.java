package org.anddev.andengine.util;

import android.graphics.*;

public class ColorUtils
{
    private static final int COLOR_FLOAT_TO_INT_FACTOR = 255;
    private static final float[] HSV_TO_COLOR;
    private static final int HSV_TO_COLOR_HUE_INDEX = 0;
    private static final int HSV_TO_COLOR_SATURATION_INDEX = 1;
    private static final int HSV_TO_COLOR_VALUE_INDEX = 2;
    
    static {
        HSV_TO_COLOR = new float[3];
    }
    
    public static int HSVToColor(final float n, final float n2, final float n3) {
        ColorUtils.HSV_TO_COLOR[0] = n;
        ColorUtils.HSV_TO_COLOR[1] = n2;
        ColorUtils.HSV_TO_COLOR[2] = n3;
        return Color.HSVToColor(ColorUtils.HSV_TO_COLOR);
    }
    
    public static int RGBToColor(final float n, final float n2, final float n3) {
        return Color.rgb((int)(n * 255.0f), (int)(n2 * 255.0f), (int)(255.0f * n3));
    }
}
