package org.anddev.andengine.extension.augmentedreality;

import android.os.Bundle;
import android.view.SurfaceHolder;
import android.view.ViewGroup.LayoutParams;
import org.anddev.andengine.opengl.view.ComponentSizeChooser;
import org.anddev.andengine.opengl.view.RenderSurfaceView;
import org.anddev.andengine.ui.activity.BaseGameActivity;

public abstract class BaseAugmentedRealityGameActivity
  extends BaseGameActivity
{
  private CameraPreviewSurfaceView mCameraPreviewSurfaceView;
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mCameraPreviewSurfaceView = new CameraPreviewSurfaceView(this);
    addContentView(this.mCameraPreviewSurfaceView, new ViewGroup.LayoutParams(-2, -2));
    this.mRenderSurfaceView.bringToFront();
  }
  
  protected void onPause()
  {
    super.onPause();
  }
  
  protected void onSetContentView()
  {
    this.mRenderSurfaceView = new RenderSurfaceView(this, this.mEngine);
    this.mRenderSurfaceView.setEGLConfigChooser(new ComponentSizeChooser(4, 4, 4, 4, 16, 0));
    this.mRenderSurfaceView.getHolder().setFormat(-3);
    this.mRenderSurfaceView.applyRenderer();
    setContentView(this.mRenderSurfaceView, createSurfaceViewLayoutParams());
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.augmentedreality.BaseAugmentedRealityGameActivity
 * JD-Core Version:    0.7.0.1
 */