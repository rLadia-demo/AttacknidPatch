package org.anddev.andengine.entity.scene;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.shape.Shape;
import org.anddev.andengine.input.touch.TouchEvent;

public class CameraScene
  extends Scene
{
  protected Camera mCamera;
  
  public CameraScene(int paramInt)
  {
    this(paramInt, null);
  }
  
  public CameraScene(int paramInt, Camera paramCamera)
  {
    super(paramInt);
    this.mCamera = paramCamera;
  }
  
  public void centerShapeInCamera(Shape paramShape)
  {
    Camera localCamera = this.mCamera;
    paramShape.setPosition(0.5F * (localCamera.getWidth() - paramShape.getWidth()), 0.5F * (localCamera.getHeight() - paramShape.getHeight()));
  }
  
  public void centerShapeInCameraHorizontally(Shape paramShape)
  {
    paramShape.setPosition(0.5F * (this.mCamera.getWidth() - paramShape.getWidth()), paramShape.getY());
  }
  
  public void centerShapeInCameraVertically(Shape paramShape)
  {
    paramShape.setPosition(paramShape.getX(), 0.5F * (this.mCamera.getHeight() - paramShape.getHeight()));
  }
  
  public Camera getCamera()
  {
    return this.mCamera;
  }
  
  protected boolean onChildSceneTouchEvent(TouchEvent paramTouchEvent)
  {
    if ((this.mChildScene instanceof CameraScene))
    {
      this.mCamera.convertCameraSceneToSceneTouchEvent(paramTouchEvent);
      boolean bool = super.onChildSceneTouchEvent(paramTouchEvent);
      this.mCamera.convertSceneToCameraSceneTouchEvent(paramTouchEvent);
      return bool;
    }
    return super.onChildSceneTouchEvent(paramTouchEvent);
  }
  
  protected void onManagedDraw(GL10 paramGL10, Camera paramCamera)
  {
    if (this.mCamera != null)
    {
      paramGL10.glMatrixMode(5889);
      this.mCamera.onApplyCameraSceneMatrix(paramGL10);
      paramGL10.glMatrixMode(5888);
      paramGL10.glPushMatrix();
      paramGL10.glLoadIdentity();
      super.onManagedDraw(paramGL10, paramCamera);
      paramGL10.glPopMatrix();
      paramGL10.glMatrixMode(5889);
    }
  }
  
  public boolean onSceneTouchEvent(TouchEvent paramTouchEvent)
  {
    if (this.mCamera == null) {
      return false;
    }
    this.mCamera.convertSceneToCameraSceneTouchEvent(paramTouchEvent);
    if (super.onSceneTouchEvent(paramTouchEvent)) {
      return true;
    }
    this.mCamera.convertCameraSceneToSceneTouchEvent(paramTouchEvent);
    return false;
  }
  
  public void setCamera(Camera paramCamera)
  {
    this.mCamera = paramCamera;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.CameraScene
 * JD-Core Version:    0.7.0.1
 */