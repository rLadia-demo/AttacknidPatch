package org.anddev.andengine.extension.augmentedreality;

import android.content.Context;
import android.hardware.Camera;
import android.hardware.Camera.Parameters;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;
import java.io.IOException;
import org.anddev.andengine.util.Debug;

class CameraPreviewSurfaceView
  extends SurfaceView
  implements SurfaceHolder.Callback
{
  private Camera mCamera;
  private final SurfaceHolder mSurfaceHolder = getHolder();
  
  public CameraPreviewSurfaceView(Context paramContext)
  {
    super(paramContext);
    this.mSurfaceHolder.addCallback(this);
    this.mSurfaceHolder.setType(3);
  }
  
  public void surfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1, int paramInt2, int paramInt3)
  {
    Camera.Parameters localParameters = this.mCamera.getParameters();
    localParameters.setPreviewSize(paramInt2, paramInt3);
    this.mCamera.setParameters(localParameters);
    this.mCamera.startPreview();
  }
  
  public void surfaceCreated(SurfaceHolder paramSurfaceHolder)
  {
    this.mCamera = Camera.open();
    try
    {
      this.mCamera.setPreviewDisplay(paramSurfaceHolder);
      return;
    }
    catch (IOException localIOException)
    {
      Debug.e("Error in Camera.setPreviewDisplay", localIOException);
    }
  }
  
  public void surfaceDestroyed(SurfaceHolder paramSurfaceHolder)
  {
    this.mCamera.stopPreview();
    this.mCamera.release();
    this.mCamera = null;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.augmentedreality.CameraPreviewSurfaceView
 * JD-Core Version:    0.7.0.1
 */