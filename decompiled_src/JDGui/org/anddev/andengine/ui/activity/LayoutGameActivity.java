package org.anddev.andengine.ui.activity;

import org.anddev.andengine.opengl.view.RenderSurfaceView;

public abstract class LayoutGameActivity
  extends BaseGameActivity
{
  protected abstract int getLayoutID();
  
  protected abstract int getRenderSurfaceViewID();
  
  protected void onSetContentView()
  {
    super.setContentView(getLayoutID());
    this.mRenderSurfaceView = ((RenderSurfaceView)findViewById(getRenderSurfaceViewID()));
    this.mRenderSurfaceView.setEGLConfigChooser(false);
    this.mRenderSurfaceView.setRenderer(this.mEngine);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.ui.activity.LayoutGameActivity
 * JD-Core Version:    0.7.0.1
 */