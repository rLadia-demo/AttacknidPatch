package org.anddev.andengine.engine.options.resolutionpolicy;

import android.view.View.MeasureSpec;
import org.anddev.andengine.opengl.view.RenderSurfaceView;

public class FillResolutionPolicy
  extends BaseResolutionPolicy
{
  public void onMeasure(RenderSurfaceView paramRenderSurfaceView, int paramInt1, int paramInt2)
  {
    BaseResolutionPolicy.throwOnNotMeasureSpecEXACTLY(paramInt1, paramInt2);
    paramRenderSurfaceView.setMeasuredDimensionProxy(View.MeasureSpec.getSize(paramInt1), View.MeasureSpec.getSize(paramInt2));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.options.resolutionpolicy.FillResolutionPolicy
 * JD-Core Version:    0.7.0.1
 */