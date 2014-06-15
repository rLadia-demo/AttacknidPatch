package org.anddev.andengine.engine.options.resolutionpolicy;

import android.view.View.MeasureSpec;
import org.anddev.andengine.opengl.view.RenderSurfaceView;

public class RelativeResolutionPolicy
  extends BaseResolutionPolicy
{
  private final float mHeightScale;
  private final float mWidthScale;
  
  public RelativeResolutionPolicy(float paramFloat)
  {
    this(paramFloat, paramFloat);
  }
  
  public RelativeResolutionPolicy(float paramFloat1, float paramFloat2)
  {
    this.mWidthScale = paramFloat1;
    this.mHeightScale = paramFloat2;
  }
  
  public void onMeasure(RenderSurfaceView paramRenderSurfaceView, int paramInt1, int paramInt2)
  {
    BaseResolutionPolicy.throwOnNotMeasureSpecEXACTLY(paramInt1, paramInt2);
    paramRenderSurfaceView.setMeasuredDimensionProxy((int)(View.MeasureSpec.getSize(paramInt1) * this.mWidthScale), (int)(View.MeasureSpec.getSize(paramInt2) * this.mHeightScale));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.options.resolutionpolicy.RelativeResolutionPolicy
 * JD-Core Version:    0.7.0.1
 */