package org.anddev.andengine.engine.options.resolutionpolicy;

import org.anddev.andengine.opengl.view.RenderSurfaceView;

public class FixedResolutionPolicy
  extends BaseResolutionPolicy
{
  private final int mHeight;
  private final int mWidth;
  
  public FixedResolutionPolicy(int paramInt1, int paramInt2)
  {
    this.mWidth = paramInt1;
    this.mHeight = paramInt2;
  }
  
  public void onMeasure(RenderSurfaceView paramRenderSurfaceView, int paramInt1, int paramInt2)
  {
    paramRenderSurfaceView.setMeasuredDimensionProxy(this.mWidth, this.mHeight);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.options.resolutionpolicy.FixedResolutionPolicy
 * JD-Core Version:    0.7.0.1
 */