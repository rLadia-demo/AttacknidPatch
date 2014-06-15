package org.anddev.andengine.engine.camera;

import android.app.Activity;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;

public class CameraFactory
{
  public static Camera createPixelPerfectCamera(Activity paramActivity, float paramFloat1, float paramFloat2)
  {
    DisplayMetrics localDisplayMetrics = getDisplayMetrics(paramActivity);
    float f1 = localDisplayMetrics.widthPixels;
    float f2 = localDisplayMetrics.heightPixels;
    return new Camera(paramFloat1 - f1 * 0.5F, paramFloat2 - 0.5F * f2, f1, f2);
  }
  
  private static DisplayMetrics getDisplayMetrics(Activity paramActivity)
  {
    DisplayMetrics localDisplayMetrics = new DisplayMetrics();
    paramActivity.getWindowManager().getDefaultDisplay().getMetrics(localDisplayMetrics);
    return localDisplayMetrics;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.camera.CameraFactory
 * JD-Core Version:    0.7.0.1
 */