package org.anddev.andengine.util;

import android.graphics.Color;

public class ColorUtils
{
  private static final int COLOR_FLOAT_TO_INT_FACTOR = 255;
  private static final float[] HSV_TO_COLOR = new float[3];
  private static final int HSV_TO_COLOR_HUE_INDEX = 0;
  private static final int HSV_TO_COLOR_SATURATION_INDEX = 1;
  private static final int HSV_TO_COLOR_VALUE_INDEX = 2;
  
  public static int HSVToColor(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    HSV_TO_COLOR[0] = paramFloat1;
    HSV_TO_COLOR[1] = paramFloat2;
    HSV_TO_COLOR[2] = paramFloat3;
    return Color.HSVToColor(HSV_TO_COLOR);
  }
  
  public static int RGBToColor(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    return Color.rgb((int)(paramFloat1 * 255.0F), (int)(paramFloat2 * 255.0F), (int)(255.0F * paramFloat3));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.ColorUtils
 * JD-Core Version:    0.7.0.1
 */