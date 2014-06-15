package org.anddev.andengine.engine.camera.hud.controls;

import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.detector.ClickDetector;
import org.anddev.andengine.input.touch.detector.ClickDetector.IClickDetectorListener;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.util.constants.TimeConstants;

public class AnalogOnScreenControl
  extends BaseOnScreenControl
  implements TimeConstants, ClickDetector.IClickDetectorListener
{
  private final ClickDetector mClickDetector = new ClickDetector(this);
  
  public AnalogOnScreenControl(int paramInt1, int paramInt2, Camera paramCamera, TextureRegion paramTextureRegion1, TextureRegion paramTextureRegion2, float paramFloat, long paramLong, IAnalogOnScreenControlListener paramIAnalogOnScreenControlListener)
  {
    super(paramInt1, paramInt2, paramCamera, paramTextureRegion1, paramTextureRegion2, paramFloat, paramIAnalogOnScreenControlListener);
    this.mClickDetector.setTriggerClickMaximumMilliseconds(paramLong);
  }
  
  public AnalogOnScreenControl(int paramInt1, int paramInt2, Camera paramCamera, TextureRegion paramTextureRegion1, TextureRegion paramTextureRegion2, float paramFloat, IAnalogOnScreenControlListener paramIAnalogOnScreenControlListener)
  {
    super(paramInt1, paramInt2, paramCamera, paramTextureRegion1, paramTextureRegion2, paramFloat, paramIAnalogOnScreenControlListener);
    this.mClickDetector.setEnabled(false);
  }
  
  public IAnalogOnScreenControlListener getOnScreenControlListener()
  {
    return (IAnalogOnScreenControlListener)super.getOnScreenControlListener();
  }
  
  public void onClick(ClickDetector paramClickDetector, TouchEvent paramTouchEvent)
  {
    getOnScreenControlListener().onControlClick(this);
  }
  
  protected boolean onHandleControlBaseTouched(TouchEvent paramTouchEvent, float paramFloat1, float paramFloat2)
  {
    this.mClickDetector.onSceneTouchEvent(null, paramTouchEvent);
    return super.onHandleControlBaseTouched(paramTouchEvent, paramFloat1, paramFloat2);
  }
  
  public void setOnControlClickEnabled(boolean paramBoolean)
  {
    this.mClickDetector.setEnabled(paramBoolean);
  }
  
  public void setOnControlClickMaximumMilliseconds(long paramLong)
  {
    this.mClickDetector.setTriggerClickMaximumMilliseconds(paramLong);
  }
  
  public static abstract interface IAnalogOnScreenControlListener
    extends BaseOnScreenControl.IOnScreenControlListener
  {
    public abstract void onControlClick(AnalogOnScreenControl paramAnalogOnScreenControl);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.camera.hud.controls.AnalogOnScreenControl
 * JD-Core Version:    0.7.0.1
 */