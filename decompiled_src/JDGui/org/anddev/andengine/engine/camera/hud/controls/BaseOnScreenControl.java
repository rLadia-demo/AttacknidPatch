package org.anddev.andengine.engine.camera.hud.controls;

import android.util.Log;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.camera.hud.HUD;
import org.anddev.andengine.engine.handler.timer.ITimerCallback;
import org.anddev.andengine.engine.handler.timer.TimerHandler;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.scene.Scene.IOnSceneTouchListener;
import org.anddev.andengine.entity.sprite.Sprite;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.util.MathUtils;

public abstract class BaseOnScreenControl
  extends HUD
  implements Scene.IOnSceneTouchListener
{
  private static final int INVALID_POINTER_ID = -1;
  private int mActivePointerID = -1;
  private final Sprite mControlBase;
  private final Sprite mControlKnob;
  private float mControlValueX;
  private float mControlValueY;
  private final IOnScreenControlListener mOnScreenControlListener;
  
  public BaseOnScreenControl(int paramInt1, int paramInt2, Camera paramCamera, TextureRegion paramTextureRegion1, TextureRegion paramTextureRegion2, float paramFloat, IOnScreenControlListener paramIOnScreenControlListener)
  {
    setCamera(paramCamera);
    this.mOnScreenControlListener = paramIOnScreenControlListener;
    this.mControlBase = new Sprite(paramInt1, paramInt2, paramTextureRegion1)
    {
      public boolean onAreaTouched(TouchEvent paramAnonymousTouchEvent, float paramAnonymousFloat1, float paramAnonymousFloat2)
      {
        return BaseOnScreenControl.this.onHandleControlBaseTouched(paramAnonymousTouchEvent, paramAnonymousFloat1, paramAnonymousFloat2);
      }
    };
    this.mControlKnob = new Sprite(0.0F, 0.0F, paramTextureRegion2);
    onHandleControlKnobReleased();
    setOnSceneTouchListener(this);
    registerTouchArea(this.mControlBase);
    registerTouchArea(this.mControlKnob);
    registerUpdateHandler(new TimerHandler(paramFloat, true, new ITimerCallback()
    {
      public void onTimePassed(TimerHandler paramAnonymousTimerHandler)
      {
        BaseOnScreenControl.this.mOnScreenControlListener.onControlChange(BaseOnScreenControl.this, BaseOnScreenControl.this.mControlValueX, BaseOnScreenControl.this.mControlValueY);
      }
    }));
    ILayer localILayer = getBottomLayer();
    localILayer.addEntity(this.mControlBase);
    localILayer.addEntity(this.mControlKnob);
    setTouchAreaBindingEnabled(true);
  }
  
  private void updateControlKnob(TouchEvent paramTouchEvent, float paramFloat1, float paramFloat2)
  {
    Sprite localSprite = this.mControlBase;
    onUpdateControlKnob(MathUtils.bringToBounds(0.0F, localSprite.getWidth(), paramFloat1) / localSprite.getWidth() - 0.5F, MathUtils.bringToBounds(0.0F, localSprite.getHeight(), paramFloat2) / localSprite.getHeight() - 0.5F);
  }
  
  public Sprite getControlBase()
  {
    return this.mControlBase;
  }
  
  public Sprite getControlKnob()
  {
    return this.mControlKnob;
  }
  
  public IOnScreenControlListener getOnScreenControlListener()
  {
    return this.mOnScreenControlListener;
  }
  
  protected void onHandleControlBaseLeft()
  {
    onUpdateControlKnob(0.0F, 0.0F);
  }
  
  protected boolean onHandleControlBaseTouched(TouchEvent paramTouchEvent, float paramFloat1, float paramFloat2)
  {
    int i = paramTouchEvent.getPointerID();
    switch (paramTouchEvent.getAction())
    {
    case 2: 
    default: 
      if (this.mActivePointerID == i) {
        updateControlKnob(paramTouchEvent, paramFloat1, paramFloat2);
      }
      break;
    }
    do
    {
      do
      {
        return true;
      } while (this.mActivePointerID != -1);
      this.mActivePointerID = i;
      updateControlKnob(paramTouchEvent, paramFloat1, paramFloat2);
      this.mOnScreenControlListener.onControlKnobDown(this);
      return true;
    } while (this.mActivePointerID != i);
    this.mActivePointerID = -1;
    onHandleControlKnobReleased();
    this.mOnScreenControlListener.onControlKnobUp(this);
    return true;
  }
  
  protected void onHandleControlKnobReleased()
  {
    onUpdateControlKnob(0.0F, 0.0F);
  }
  
  public boolean onSceneTouchEvent(Scene paramScene, TouchEvent paramTouchEvent)
  {
    if (paramTouchEvent.getPointerID() == this.mActivePointerID)
    {
      onHandleControlBaseLeft();
      switch (paramTouchEvent.getAction())
      {
      }
    }
    for (;;)
    {
      return false;
      this.mActivePointerID = -1;
    }
  }
  
  protected void onUpdateControlKnob(float paramFloat1, float paramFloat2)
  {
    Sprite localSprite1 = this.mControlBase;
    Sprite localSprite2 = this.mControlKnob;
    float f1 = paramFloat1;
    float f2 = paramFloat2;
    double d1 = Math.sqrt(f1 * f1 + f2 * f2);
    if (d1 > Math.abs(0.5F))
    {
      Log.e("摇杆引擎", "=============出界重置: relatvieS=" + d1);
      f1 = 0.0F;
      f2 = 0.0F;
      this.mActivePointerID = -1;
      this.mOnScreenControlListener.onControlKnobUp(this);
    }
    for (;;)
    {
      this.mControlValueX = (2.0F * f1);
      this.mControlValueY = (2.0F * f2);
      float[] arrayOfFloat = localSprite1.getSceneCenterCoordinates();
      localSprite2.setPosition(arrayOfFloat[0] - 0.5F * localSprite2.getWidth() + f1 * localSprite1.getWidthScaled(), arrayOfFloat[1] - 0.5F * localSprite2.getHeight() + f2 * localSprite1.getHeightScaled());
      return;
      if ((d1 >= Math.abs(0.3F)) && (d1 <= Math.abs(0.5F)))
      {
        Log.e("摇杆引擎", "=============限制范围: relatvieS=" + d1);
        double d2 = 0.300000011920929D / d1;
        f1 = (float)(d2 * f1);
        f2 = (float)(d2 * f2);
      }
    }
  }
  
  public void refreshControlKnobPosition()
  {
    onUpdateControlKnob(0.5F * this.mControlValueX, 0.5F * this.mControlValueY);
  }
  
  public static abstract interface IOnScreenControlListener
  {
    public abstract void onControlChange(BaseOnScreenControl paramBaseOnScreenControl, float paramFloat1, float paramFloat2);
    
    public abstract void onControlKnobDown(BaseOnScreenControl paramBaseOnScreenControl);
    
    public abstract void onControlKnobUp(BaseOnScreenControl paramBaseOnScreenControl);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.camera.hud.controls.BaseOnScreenControl
 * JD-Core Version:    0.7.0.1
 */