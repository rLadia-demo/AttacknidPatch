package org.anddev.andengine.entity.scene.popup;

import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.handler.timer.ITimerCallback;
import org.anddev.andengine.engine.handler.timer.TimerHandler;
import org.anddev.andengine.entity.scene.CameraScene;
import org.anddev.andengine.entity.scene.Scene;

public class PopupScene
  extends CameraScene
{
  public PopupScene(Camera paramCamera, Scene paramScene, float paramFloat)
  {
    this(paramCamera, paramScene, paramFloat, null);
  }
  
  public PopupScene(Camera paramCamera, final Scene paramScene, float paramFloat, final Runnable paramRunnable)
  {
    super(1, paramCamera);
    setBackgroundEnabled(false);
    paramScene.setChildScene(this, false, true, true);
    registerUpdateHandler(new TimerHandler(paramFloat, new ITimerCallback()
    {
      public void onTimePassed(TimerHandler paramAnonymousTimerHandler)
      {
        PopupScene.this.unregisterUpdateHandler(paramAnonymousTimerHandler);
        paramScene.clearChildScene();
        if (paramRunnable != null) {
          paramRunnable.run();
        }
      }
    }));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.popup.PopupScene
 * JD-Core Version:    0.7.0.1
 */