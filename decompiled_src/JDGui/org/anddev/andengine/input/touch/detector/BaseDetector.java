package org.anddev.andengine.input.touch.detector;

import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.scene.Scene.IOnSceneTouchListener;
import org.anddev.andengine.input.touch.TouchEvent;

public abstract class BaseDetector
  implements Scene.IOnSceneTouchListener
{
  private boolean mEnabled = true;
  
  public boolean isEnabled()
  {
    return this.mEnabled;
  }
  
  protected abstract boolean onManagedTouchEvent(TouchEvent paramTouchEvent);
  
  public boolean onSceneTouchEvent(Scene paramScene, TouchEvent paramTouchEvent)
  {
    return onTouchEvent(paramTouchEvent);
  }
  
  public final boolean onTouchEvent(TouchEvent paramTouchEvent)
  {
    if (this.mEnabled) {
      return onManagedTouchEvent(paramTouchEvent);
    }
    return false;
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    this.mEnabled = paramBoolean;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.input.touch.detector.BaseDetector
 * JD-Core Version:    0.7.0.1
 */