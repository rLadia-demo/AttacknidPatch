package org.anddev.andengine.engine.camera;

import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.util.MathUtils;

public class ZoomCamera
  extends BoundCamera
{
  private float mZoomFactor = 1.0F;
  
  public ZoomCamera(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  protected void applySceneToCameraSceneOffset(TouchEvent paramTouchEvent)
  {
    float f1 = this.mZoomFactor;
    if (f1 != 1.0F)
    {
      float f2 = getCenterX();
      float f3 = getCenterY();
      VERTICES_TOUCH_TMP[0] = paramTouchEvent.getX();
      VERTICES_TOUCH_TMP[1] = paramTouchEvent.getY();
      MathUtils.scaleAroundCenter(VERTICES_TOUCH_TMP, f1, f1, f2, f3);
      paramTouchEvent.set(VERTICES_TOUCH_TMP[0], VERTICES_TOUCH_TMP[1]);
    }
    super.applySceneToCameraSceneOffset(paramTouchEvent);
  }
  
  public float getHeight()
  {
    return super.getHeight() / this.mZoomFactor;
  }
  
  public float getMaxX()
  {
    if (this.mZoomFactor == 1.0F) {
      return super.getMaxX();
    }
    float f = getCenterX();
    return f + (super.getMaxX() - f) / this.mZoomFactor;
  }
  
  public float getMaxY()
  {
    if (this.mZoomFactor == 1.0F) {
      return super.getMaxY();
    }
    float f = getCenterY();
    return f + (super.getMaxY() - f) / this.mZoomFactor;
  }
  
  public float getMinX()
  {
    if (this.mZoomFactor == 1.0F) {
      return super.getMinX();
    }
    float f = getCenterX();
    return f - (f - super.getMinX()) / this.mZoomFactor;
  }
  
  public float getMinY()
  {
    if (this.mZoomFactor == 1.0F) {
      return super.getMinY();
    }
    float f = getCenterY();
    return f - (f - super.getMinY()) / this.mZoomFactor;
  }
  
  public float getWidth()
  {
    return super.getWidth() / this.mZoomFactor;
  }
  
  public float getZoomFactor()
  {
    return this.mZoomFactor;
  }
  
  public void setZoomFactor(float paramFloat)
  {
    this.mZoomFactor = paramFloat;
    if (this.mBoundsEnabled) {
      ensureInBounds();
    }
  }
  
  protected void unapplySceneToCameraSceneOffset(TouchEvent paramTouchEvent)
  {
    super.unapplySceneToCameraSceneOffset(paramTouchEvent);
    float f1 = this.mZoomFactor;
    if (f1 != 1.0F)
    {
      float f2 = getCenterX();
      float f3 = getCenterY();
      VERTICES_TOUCH_TMP[0] = paramTouchEvent.getX();
      VERTICES_TOUCH_TMP[1] = paramTouchEvent.getY();
      MathUtils.revertScaleAroundCenter(VERTICES_TOUCH_TMP, f1, f1, f2, f3);
      paramTouchEvent.set(VERTICES_TOUCH_TMP[0], VERTICES_TOUCH_TMP[1]);
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.camera.ZoomCamera
 * JD-Core Version:    0.7.0.1
 */